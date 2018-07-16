class BankAccount < ActiveRecord::Base
 
   belongs_to :user 
   has_many :financial_transactions
   has_many :payment_entries
   has_many :sales_entries
   
   accepts_nested_attributes_for :financial_transactions
   
 
end
