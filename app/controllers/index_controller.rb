class IndexController < ApplicationController
    before_action :authenticate_user!
  def home
      @sale = Sale.all
      @purchases = Purchase.all
      @transactions = FinancialTransaction.all
      @sale_total = Sale.where('date > ?', 30.days.ago) 
      
 end
end
