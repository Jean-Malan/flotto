class AccountBalance < ApplicationRecord
    attr_reader :date_from, :date_to
  
    belongs_to :gl_account
    has_many :financial_transactions
    has_many :journal_entries
    has_many :sales_entries
    has_many :purchase_entries
    has_many :sales
    has_many :vat_account_balances
    
    
end
