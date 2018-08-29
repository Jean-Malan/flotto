class PurchaseEntry < ActiveRecord::Base
    before_save :format_rounding,  :format_vat, :define_total_price, :create_balance
    after_create_commit :update_purchase_quantity, :update_current_stock
    
       belongs_to :user 
       belongs_to :gl_account
       belongs_to :bank_account
       belongs_to :purchase
       belongs_to :product
       belongs_to :account_balance
       belongs_to :vat_account_balance
       
       
 enum vat_type: {
    no_vat:                                         0,
    standard_rate_purchases_15:                     1,
    standard_rate_sales_15:                         2,
    standard_rate_sales_capital_goods_15:           3,
    zero_rated_sales_excluding_goods_exported:      4,
    zero_rated_only_exported_goods:                 5
  }
     

#---------------------------- Formatting values total Prices  -------------------- 
  def define_total_price
         self.total_price =  self.quantity.to_f * (self.price.to_f + self.vat_amount.to_f )
  end
  
#---------------------------- Formatting values for Vat  --------------------   
    def format_vat
        if self.vat_type ==  "standard_rate_purchases_15" || self.vat_type ==  "standard_rate_sales_15" || self.vat_type ==  "standard_rate_sales_capital_goods_15"
      self.vat_amount = ( self.price * 0.15) / (1 + 0.15)
      self.net_price = self.price / (1.15)
      
     else
         self.vat_amount = 0
         self.net_price = self.price
     end
    end
  
    def format_rounding
         self.vat_amount = self.vat_amount.to_f.round(2) 
         self.price = self.price.to_f.round(2) 
          self.total_price = self.price.to_f.round(2) 
   end
   
    #---------------------------- Updating Stock Values -------------------- 
   def update_purchase_quantity 
    if product.present?
        product.update_purchase_balance
   end 
  end
  
  def update_current_stock
    if product.present?
        product.update_current_stock  
   end 
  end
  
 #---------------------------- Updating Sale Amounts --------------------  
  

   
 #---------------------------- Account Balance is a cached version of the transaction which is pulled through for transaction -------------------- 
 #---------------------------- Note: The transaction itself is never called for reporting purposes -------------------- 
   

def create_balance
    if account_balance_id == nil
     account_amount = (self.net_price * self.quantity) * -1
     create_balance = AccountBalance.new(date: self.purchase.date, gl_account_id: self.gl_account_id, amount: account_amount, user_id: self.user_id)
     create_balance.save!
     self.account_balance_id = create_balance.id
    else
     update_balance
    end
 end

 def update_balance
    amount = (self.net_price * self.quantity) * -1
    account = self.gl_account_id
    account_balance.update_attributes(amount: amount, gl_account_id: account)
 end    
 
end

