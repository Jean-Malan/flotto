class GlAccount < ActiveRecord::Base

   belongs_to :user 
   has_many :financial_transactions
   has_many :payment_entries
   has_many :sales_entries
   has_many :purchase_entries
   has_many :journal_entries
   has_many :purchases
   
  accepts_nested_attributes_for :journal_entries
   accepts_nested_attributes_for :financial_transactions
   accepts_nested_attributes_for :sales_entries
   
    
    enum account_type: {
    current_asset:          0,
    non_current_asset:      1,
    current_liability:      2,
    non_current_liability:  3,
    equity:                 4,
    cost_of_sales:          5,
    operating_expense:      6,
    sales:                  7,
    other_income:           8
  }


def update_balance
  update(account_balance: financial_transactions.sum(:total_amount))
end

    
end
