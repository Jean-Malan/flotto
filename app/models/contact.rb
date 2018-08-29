class Contact < ActiveRecord::Base
    
  has_many :sales 
  has_many :purchases
  has_many :financial_transactions
  belongs_to :user 





end