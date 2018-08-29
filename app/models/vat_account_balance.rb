class VatAccountBalance < ApplicationRecord
    
    belongs_to :gl_account
    has_many :financial_transactions
    has_many :journal_entries
    has_many :sales_entries
    has_many :purchase_entries
    has_many :sales
    
end
