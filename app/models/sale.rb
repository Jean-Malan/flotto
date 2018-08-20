class Sale < ActiveRecord::Base
 
      before_save :update_amount
      
      belongs_to :user 
      belongs_to :contact
      belongs_to :gl_account
      has_many :financial_transactions
      has_many :sales_entries
    
     accepts_nested_attributes_for :sales_entries,
                                  allow_destroy: true
    
    
    
    enum sales_type: {
    invoice:       0,
    draft:         1,
    estimate:      2,
 
  }
  
 def set_balance
   self.balance = 0.00
 end
  
  def update_balance
  update(balance: financial_transactions.sum(:total_amount))
end
  
  def update_customer_sale_balance
  if contact.present?
     contact.update_sale_balance
  end
end


 def update_amount
  # Use find_all instead of where since you might be dealing with unpersisted records
  self.amount  = sales_entries
                  .find_all(&:price?)
                  .sum { |sales_entry| sales_entry.price * sales_entry.quantity }
 
  
  end
  
   def update_vat_amount
  # Use find_all instead of where since you might be dealing with unpersisted records
  self.vat_total  = sales_entries
                  .find_all(&:vat_amount?)
                  .sum { |sales_entry| sales_entry.vat_amount * sales_entry.quantity }
 
  
  end
  
  
  
  def credit_note
   if self.sales_type == credit_note
   
    self.amount  = sales_entries
                   .find_all(&:price?)
                   .sales_entry.credit_note
  
    self.amount = self.amount * -1
  
  end
 end
  
 
end
