class Sale < ActiveRecord::Base
 
      before_update :update_edit_sale_balance
      before_create :update_customer_sale_balance, :create_initial_sale_balance
      before_save :update_amount, :create_vat_balance

      
      belongs_to :account_balance
      belongs_to :user 
      belongs_to :contact
      belongs_to :gl_account
      has_many :financial_transactions
      has_many :sales_entries
      belongs_to :vat_account_balance
    
     accepts_nested_attributes_for :sales_entries,
                                  allow_destroy: true
    
    enum sales_type: {
    invoice:       0,
    draft:         1,
    estimate:      2,
    credit_note:   3,

  }
  

#--------------- Updating the balance of the invoice from Financial Transactions ------------------    

  
  def update_balance
  update(balance: financial_transactions.sum(:total_amount))
end

#--------------- Updating customer Sale balance which is offset by receipts ------------------  
  
  
def update_customer_sale_balance
  if contact.present?
        new_positve_balance = self.amount.to_f + contact.sale_balance.to_f  
         contact.update_attributes(sale_balance: new_positve_balance)
end
end

def update_edit_sale_balance
  if contact.present?
      new_balance = self.amount.to_f - self.initial_sale_balance.to_f
      updated_sale_balance = new_balance + contact.sale_balance.to_f
       contact.update_attributes(sale_balance: updated_sale_balance)
       self.initial_sale_balance = updated_sale_balance
  end
end


#--------------- Calculating the gross amount & Vat Amount of Sale through the Sale_entries  ------------------  

  def update_amount
  self.amount  = sales_entries
                  .find_all(&:price?)
                  .sum { |sales_entry| sales_entry.price * sales_entry.quantity }
  
  self.vat_total  = sales_entries
                  .find_all(&:vat_amount?)
                  .sum { |sales_entry| sales_entry.vat_amount * sales_entry.quantity }
                  
             
  end
  
  def  create_initial_sale_balance
    self.initial_sale_balance = self.amount
    end
  
 
#--------------- Create vat balance  ------------------  
 
 def create_vat_balance
    if self.vat_account_balance_id == nil 
     create_vat_balance = VatAccountBalance.new(date: self.date, gl_account_id: self.user_id*4**8, vat_amount: self.vat_total.to_f, user_id: self.user_id, sale_id: self.id)
     create_vat_balance.save!
     self.vat_account_balance_id = create_vat_balance.id
    else
     update_vat_balance
 end
end
 
 
  def update_vat_balance
    vat_amount = self.vat_total.to_f
    vat_account_balance.update_attributes(vat_amount: vat_amount, date: self.date, sale_id: self.id)
 end 



   
  
 
end