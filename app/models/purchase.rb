class Purchase < ActiveRecord::Base
  
  before_update :update_edit_purchase_balance
  before_create :update_customer_purchase_balance, :create_initial_purchase_balance
  before_save  :update_amount, :create_vat_balance

 
    belongs_to :user 
    belongs_to :contact
    has_many :financial_transactions
    belongs_to :gl_account
    has_many :purchase_entries
    belongs_to :vat_account_balance
    
    accepts_nested_attributes_for :purchase_entries,
                                  allow_destroy: true
    
    enum purchases_type: {
    invoice:       0,
    draft:         1,
  }
  
  
#--------------- Updating the balance of the invoice from Financial Transactions ------------------   

 
  def update_purchase_balance
    update(balance: financial_transactions.sum(:total_amount))
  end
  
  #--------------- Updating customer Sale balance which is offset by receipts ------------------  
  
  
def update_customer_purchase_balance
  if contact.present?
        new_positve_balance = self.amount.to_f + contact.purchase_balance.to_f  
         contact.update_attributes(purchase_balance: new_positve_balance)
end
end

def update_edit_purchase_balance
  if contact.present?
      new_balance = self.amount.to_f - self.initial_purchase_balance.to_f
      updated_purchase_balance = new_balance + contact.purchase_balance.to_f
       contact.update_attributes(purchase_balance: updated_purchase_balance)
       self.initial_purchase_balance = updated_purchase_balance
  end
end

#--------------- Calculating the gross amount & Vat Amount of Purchase through the purchase_entries  ------------------ 
  def update_amount
      self.amount  = purchase_entries
                      .find_all(&:price?)
                      .sum { |journal_entry| journal_entry.price * journal_entry.quantity  }
                      
     self.vat_amount = purchase_entries
                      .find_all(&:vat_amount?)
                      .sum { |journal_entry| journal_entry.vat_amount * journal_entry.quantity }
   end
  
   def create_initial_purchase_balance
    self.initial_purchase_balance = self.amount
    end
  
  
  #--------------- Create vat balance  ------------------  
   def create_vat_balance
    if vat_account_balance_id == nil && vat_amount != nil
     create_vat_balance = VatAccountBalance.new(date: self.date, gl_account_id: self.user_id*4**8, vat_amount: (self.vat_amount.to_f * -1), user_id: self.user_id, purchase_id: self.id)
     create_vat_balance.save!
     self.vat_account_balance_id = create_vat_balance.id
    else
     update_vat_balance
 end
end
 
  def update_vat_balance
    vat_account_balance.update_attributes(vat_amount: (self.vat_amount.to_f * -1), date: self.date, purchase_id: self.id)
 end 


end
