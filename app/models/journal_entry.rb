class JournalEntry < ActiveRecord::Base
 before_save :format_values, :create_balance
     belongs_to :user 
    belongs_to :journal
    belongs_to :gl_account
    belongs_to :account_balance
    
    
     def format_values
       if self.credit == true && self.amount > 0 
        self.amount *= -1
       end
     end
     
     def create_balance
    if account_balance_id == nil
     create_balance = AccountBalance.new(date: self.journal.date, gl_account_id: self.gl_account_id, amount: self.amount.to_f, user_id: self.user_id)
     create_balance.save!
     self.account_balance_id = create_balance.id
    else
     update_balance
    end
 end

 def update_balance
    amount = self.amount.to_f
    account = self.gl_account_id
    account_balance.update_attributes(amount: amount, gl_account_id: account)
 end    
 
   
end
