class FinancialTransaction < ActiveRecord::Base
before_save :format_values, :format_vat, :format_rounding
    after_save :update_sales, :update_purchases
    
    belongs_to :user 
    belongs_to :gl_account
    belongs_to :payment_entry
    belongs_to :receipt_entry
    belongs_to :purchase
    belongs_to :sale
    belongs_to :contact
    belongs_to :bank_account
    
    
    enum transaction_type: {
    payment:          0,
    receipt:          1
  }
  
   enum vat_type: {
    no_vat:                                         0,
    standard_rate_purchases_15:                     1,
    standard_rate_sales_15:                         2,
    standard_rate_sales_capital_goods_15:           3,
    zero_rated_sales_excluding_goods_exported:      4,
    zero_rated_only_exported_goods:                 5
  }


  private
  
  
def update_sales
  if sale.present?
  sale.update_balance
 end
end


def update_purchases
  if purchase.present?
  purchase.update_balance
  end
end
   

  def format_values
     if self.payment_entry_id != nil
      self.total_amount *= -1
     end
  end
  
  def format_vat
     if self.vat_type ==  "standard_rate_purchases_15" || self.vat_type ==  "standard_rate_sales_15" || self.vat_type ==  "standard_rate_sales_capital_goods_15"
      self.vat_amount = ( self.total_amount * 0.15) / (1 + 0.15)
      self.net_amount = self.total_amount / (1.15)
     else if self.vat_type == "zero_rated_sales_excluding_goods_exported" || self.vat_type == "zero_rated_only_exported_goods"
      self.total_amount = self.total_amount
     else
      self.vat_amount = 0
     end
     end
  end
  
  def format_rounding
   if self.vat_amount != nil
      self.vat_amount = self.vat_amount.round(2)
            self.total_amount = self.total_amount.round(2)
     end
      if self.net_amount.present?
      self.net_amount = self.net_amount.round(2)
     end
  end

   def self.import(file)
    bank_id = @bank_account_id 
   CSV.foreach(file.path, headers: true) do |row|
    FinancialTransaction.create! row.to_hash
  end
  end
    
    def self.search(search)
  if search
    where('description LIKE ?', "%#{search}%") 
  else
    all
  end
end

    def self.searchref(searchref)
  if searchref
    where('reference LIKE ?', "%#{searchref}%") 
  else
    all
  end
end

#    def self.between_times(date1, date2)
#  if between_times
#    where("date >= (?) AND date <= (?)", date1, date2) 
#  else
#    all
#  end
#end


#def self.search(dat)
#
#    if date
#    where('date LIKE ?', "%#{date}%") 
#  else
#    all
#  end
#end



end

