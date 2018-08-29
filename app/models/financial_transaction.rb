class FinancialTransaction < ActiveRecord::Base

    before_save :format_expense, :format_rounding, :set_contact, :create_balance, :create_vat_balance
    after_save :update_sales, :update_purchases, :set_contact_purchase_balance, :set_contact_sale_balance
    
    
    belongs_to :user 
    belongs_to :gl_account
    belongs_to :payment_entry
    belongs_to :receipt_entry
    belongs_to :purchase
    belongs_to :sale
    belongs_to :contact
    belongs_to :bank_account
    belongs_to :account_balance
    belongs_to :vat_account_balance
    
    
    enum transaction_type: {
    payment:          0,
    receipt:          1
  }
  
   enum vat_type: {
    no_vat:                                         0,
    standard_rate_purchases_15:                     1,
    standard_rate_sales_15:                         2,
    standard_rate_sales_capital_goods_15:           3,
    zero_rated_sales_excluding_goods_exported:      4,
    zero_rated_only_exported_goods:                 5
  }


  private
  
#----------------------------Setting the contact id to update the payment balance for invoice balance comparison --------------------
  def set_contact
    if purchase.present? 
        self.contact_id = self.purchase.contact_id
    else if sale.present? 
        self.contact_id = self.sale.contact_id
    end
    end
  end

#---------------------------- Updating the Contacts Purchases and Sales balance to balance their amount due/owed --------------------  
  

  def set_contact_purchase_balance
   if purchase.present?
    contact_balance = contact.purchase_balance.to_f + self.total_amount.to_f
    contact.update_attributes(purchase_balance: contact_balance)
   end
  end
  
  
  def set_contact_sale_balance
   if sale.present?
    contact_sale_balance = contact.sale_balance.to_f - self.total_amount.to_f
    contact.update_attributes(sale_balance: contact_sale_balance)
   end
  end
 
#---------------------------- Updating the Sales and Purchase balance to offset if its been paid --------------------

def update_sales
  if sale.present?
   updated_sale_balance = sale.balance.to_f + self.total_amount.to_f
  sale.update_attributes(balance: updated_sale_balance)
 end
end


def update_purchases
 if purchase.present?
  updated_purchase_balance = purchase.balance.to_f - self.total_amount.to_f
  purchase.update_attributes(balance: updated_purchase_balance)
  end
end

#---------------------------- Formatting values for Vat --------------------

  def format_expense
   if self.payment == true
    self.total_amount = self.total_amount * -1
    format_vat
   else
    format_vat
   end
  end 
  
  def format_vat
     if self.vat_type ==  "standard_rate_purchases_15" || self.vat_type ==  "standard_rate_sales_15" || self.vat_type ==  "standard_rate_sales_capital_goods_15"
      self.vat_amount = ( self.total_amount * 0.15) / (1 + 0.15)
      self.net_amount = self.total_amount / (1.15)
     else if self.vat_type == "zero_rated_sales_excluding_goods_exported" || self.vat_type == "zero_rated_only_exported_goods"
      self.total_amount = self.total_amount
      self.vat_amount = 0
      self.net_amount = self.total_amount
     end
     end
  end
  
  
  def format_rounding
   if self.vat_amount != nil
      self.vat_amount = self.vat_amount.round(2)
            self.total_amount = self.total_amount.round(2)
     end
      if self.net_amount.present?
      self.net_amount = self.net_amount.round(2)
     end
  end

 
 #---------------------------- Implementing CSV Import -------------------- 
   def self.import(file)
    bank_id = @bank_account_id 
   CSV.foreach(file.path, headers: true) do |row|
    FinancialTransaction.create! row.to_hash
  end
  end
  

 #---------------------------- Implementing Search functionality -------------------- 
    def self.search(search)
  if search
    where('description LIKE ?', "%#{search}%") 
  else
    all
  end
end

 def self.searchref(searchref)
  if searchref
    where('reference LIKE ?', "%#{searchref}%") 
  else
    all
  end
 end


 
 #---------------------------- Account Balance is a cached version of the transaction which is pulled through for transaction -------------------- 
 #---------------------------- Note: The transaction itself is never called for reporting purposes -------------------- 
 
 
 def create_balance
    if account_balance_id == nil
     create_balance = AccountBalance.new(date: self.date, gl_account_id: self.gl_account_id, reference: self.reference, amount: (self.total_amount - self.vat_amount.to_f), user_id: self.user_id)
     create_balance.save!
     self.account_balance_id = create_balance.id
    else
     update_balance
    end
 end

 def update_balance
    amount = self.total_amount.to_f - self.vat_amount.to_f
    account = self.gl_account_id
    account_balance.update_attributes(amount: amount, gl_account_id: account)
 end    

 #---------------------------- Vat Account Balance is a cached version of the  vat amount of the transaction which is pulled through for vat reports -------------------- 
 #---------------------------- Note: The transaction itself is never called for reporting purposes -------------------- 
 
 def create_vat_balance
    if vat_account_balance_id == nil && vat_amount != nil
     create_vat_balance = VatAccountBalance.new(date: self.date, gl_account_id: self.user_id*4**8, vat_amount: self.vat_amount.to_f, user_id: self.user_id, financial_transaction_id: self.id, sale_id: nil)
     create_vat_balance.save!
     self.vat_account_balance_id = create_vat_balance.id
      else
     update_vat_balance
    end
 end

 def update_vat_balance
    if vat_amount != nil
    vat_amount = self.vat_amount.to_f
    vat_account_balance.update_attributes(vat_amount: vat_amount, date: self.date)
 end 
 end 



end

