class Purchase < ActiveRecord::Base
  before_save :journal_params
    belongs_to :user 
    belongs_to :contact_id
    has_many :financial_transactions
    belongs_to :gl_account
    has_many :purchase_entries
    
    accepts_nested_attributes_for :purchase_entries,
                                  allow_destroy: true
    
    enum purchases_type: {
    invoice:       0,
    draft:         1,
  }
  
  
  
   def set_balance
   self.balance = 0.00
 end
 
  def update_balance
    update(balance: financial_transactions.sum(:total_amount))
  end

  def journal_params
      self.amount  = purchase_entries
                      .find_all(&:price?)
                      .sum { |journal_entry| journal_entry.price * journal_entry.quantity  }
                      
     self.vat_amount = purchase_entries
                      .find_all(&:vat_amount?)
                      .sum { |journal_entry| journal_entry.vat_amount * journal_entry.quantity }
  end
  
end
