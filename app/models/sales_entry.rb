class SalesEntry < ActiveRecord::Base
   before_save :format_rounding,  :format_vat, :define_total_price, :update_amount, :update_vat_amount
   after_create_commit :update_sale_quantity, :update_current_stock 
   
       belongs_to :user 
       belongs_to :gl_account
       belongs_to :bank_account
       belongs_to :sale
       belongs_to :product
       
  enum vat_type: {
    no_vat:                                         0,
    standard_rate_purchases_15:                     1,
    standard_rate_sales_15:                         2,
    standard_rate_sales_capital_goods_15:           3,
    zero_rated_sales_excluding_goods_exported:      4,
    zero_rated_only_exported_goods:                 5
  }
       
       
 #total price for line item
  def define_total_price
         self.total_price =  self.quantity.to_f * (self.price.to_f + self.vat_amount.to_f)
  end

 #formating vat value
  def format_vat
     if self.vat_type ==  "standard_rate_purchases_15" || self.vat_type ==  "standard_rate_sales_15" || self.vat_type ==  "standard_rate_sales_capital_goods_15"
      self.vat_amount = ( self.price.round(2) * 0.15) / (1 + 0.15)
      self.net_price = self.price / (1.15)
      
     else
         self.vat_amount = 0.0
         self.net_price = self.price
     end
  end
  
  #rounding values
   def format_rounding
      self.price = self.price
      self.vat_amount = self.vat_amount
   end
  
  #updating Sale amount
  def update_amount
  if self.price?
  sale.update_amount
  end
end

  def update_vat_amount
  if self.vat_amount?
  sale.update_vat_amount
  end
end
  
  #updating balance notes when Sale.sale_type = credit_note
  def update_credit_note_balances
      self.price = self.price * -1 
      self.amount =  self.amount * -1 
      self.vat_amount self.amount * -1 
      self.total_price self.amount * -1 
      
  end
  
  
    def update_sale_quantity
    if product.present?
        product.update_sale_balance
   end 
  end
  
   def update_current_stock
    if product.present?
        product.update_current_stock  
   end 
  end
  
  
end
