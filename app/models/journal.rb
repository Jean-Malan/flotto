class Journal < ActiveRecord::Base
      validate :ensure_journal_entries_balance_to_zero
      
     belongs_to :user 
     belongs_to :gl_account
     has_many :journal_entries
      accepts_nested_attributes_for :journal_entries,
                                  allow_destroy: true
                                  
                                  
                                  
def ensure_journal_entries_balance_to_zero
  # Use find_all instead of where since you might be dealing with unpersisted records
  credits_sum = journal_entries
                  .find_all(&:credit?)
                  .sum { |journal_entry| journal_entry.amount }
  debits_sum = journal_entries
                 .find_all(&:debit?)
                 .sum { |journal_entry| journal_entry.amount }

  return if credits_sum - debits_sum == 0

  errors.add(:base, "Journal entries must balance to zero")
  
  end
  
end
