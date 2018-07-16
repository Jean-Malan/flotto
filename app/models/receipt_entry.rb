class ReceiptEntry < ActiveRecord::Base
    belongs_to :user 
    has_many :financial_transactions, dependent: :destroy

    accepts_nested_attributes_for :financial_transactions,
                                  allow_destroy: true
end
