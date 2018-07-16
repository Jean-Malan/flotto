class Sale < ActiveRecord::Base
      before_save :journal_params, :journal_params
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
  
 def journal_params
  # Use find_all instead of where since you might be dealing with unpersisted records
  self.amount  = sales_entries
                  .find_all(&:price?)
                  .sum { |journal_entry| journal_entry.total_price }
 
  
  end
 
end
