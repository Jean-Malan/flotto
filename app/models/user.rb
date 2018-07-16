class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :bank_accounts
         has_many :contacts
         has_many :financial_transactions
         has_many :gl_accounts
         has_many :journals
         has_many :journal_entries
         has_many :payment_entries
         has_many :products
         has_many :purchases
         has_many :purchase_entries
         has_many :receipt_entries
         has_many :reports
         has_many :sale_entries
         has_many :sales
        
    
end
