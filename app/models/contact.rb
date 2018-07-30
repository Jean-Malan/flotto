class Contact < ActiveRecord::Base
    
    
    has_many :sales 
    has_many :purchases
    has_many :financial_transactions
    belongs_to :user 


  def set_balance

  end
 
  def update_sale_balance
    update(sale_balance: purchases.sum(:amount))
  end

  def update_purchase_balance
    update(purchase_balance: purchases.sum(:amount))
  end
  
  def update_transaction_purchase_balance
    update(payment_balance: financial_transactions.sum(:total_amount))
  end
  
  def update_transaction_sale_balance
    update(receipt_balance: financial_transactions.sum(:total_amount))
  end
  

  end