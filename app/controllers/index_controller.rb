class IndexController < ApplicationController
    before_action :authenticate_user!
  def home
      @sale = Sale.all.where("user_id =?", current_user.id)
      @purchases = Purchase.all.where("user_id =?", current_user.id)
      @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
      @sale_total = Sale.where('date > ?', 30.days.ago).where("user_id =?", current_user.id)
      @purchases = Purchase.where('date > ?', 30.days.ago).where("user_id =?", current_user.id)
      
      @gross_profit = 0
      @sale.each do |sale|
          @gross_profit += sale.amount.to_f
      end
      @purchases.each do |purchase|
          @gross_profit += purchase.amount.to_f
      end
      
 end
end
