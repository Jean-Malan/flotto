class CreditingNote < ApplicationRecord
    
    belongs_to :sale
    belongs_to :user
    belongs_to :purchase
    belongs_to :contact
    has_many :financial_transactions
    
    
    
    
end
