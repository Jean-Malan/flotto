class Product < ActiveRecord::Base
    belongs_to :user 
    belongs_to :sale
    belongs_to :purchase
    has_many :sales_entries
    has_many :purchase_entries
 
 
 
 def update_purchase_balance
   update(purchase_balance: purchase_entries.sum(:quantity))
   update_current_stock   
  end
  
  def update_sale_balance
   update(sale_balance: sales_entries.sum(:quantity))
   update_current_stock   
  end
       
       def update_current_stock   
           self.current_stock = self.purchase_balance.to_f + self.opening_stock.to_f - self.sale_balance.to_f
       end
                      
end
