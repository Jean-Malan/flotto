class IndexController < ApplicationController
    before_action :authenticate_user!
  def home
      @sale = Sale.all.where("user_id =?", current_user.id)
      @purchases = Purchase.all.where("user_id =?", current_user.id)
      @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
      @sale_total = Sale.where('date > ?', 30.days.ago).where("user_id =?", current_user.id)
      
 end
end
