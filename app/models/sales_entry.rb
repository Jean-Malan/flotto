class SalesEntry < ActiveRecord::Base

    before_save :format_rounding,  :format_vat, :define_total_price
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
       
       
 
  def define_total_price
  # Use find_all instead of where since you might be dealing with unpersisted records
         self.total_price =  self.quantity.to_f * (self.price.to_f + self.vat_amount.to_f)
  end


  def format_vat
     if self.vat_type ==  "standard_rate_purchases_15" || self.vat_type ==  "standard_rate_sales_15" || self.vat_type ==  "standard_rate_sales_capital_goods_15"
      self.vat_amount = ( self.price.round(2) * 0.15) / (1 + 0.15)
      self.price = self.price / (1.15)
     else
         self.vat_amount = 0.0
     end
  end
  
   def format_rounding
      self.price = self.price
      self.vat_amount = self.vat_amount
   end
  
  
end
