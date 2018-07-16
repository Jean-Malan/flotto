class Product < ActiveRecord::Base
   belongs_to :user 
    belongs_to :sale
    belongs_to :purchase
    has_many :sales_entries
   has_many :purchase_entries
 
end
