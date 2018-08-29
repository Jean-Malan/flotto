class User < ActiveRecord::Base 
    after_create :create_vat_account
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
        
        def create_vat_account
            new_vat_acocunt = GlAccount.new(user_id: self.id, code: '9000', id: self.id*4**8, name: 'Vat Control Account',account_type: 'non_current_liability' )
            new_vat_acocunt.save!
    end
    
end
