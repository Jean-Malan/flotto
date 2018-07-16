class JournalEntry < ActiveRecord::Base
 before_save :format_values
     belongs_to :user 
    belongs_to :journal
    belongs_to :gl_account
    
    
     def format_values
       if self.credit == true && self.amount > 0 
        self.amount *= -1
       end
     end
   
end
