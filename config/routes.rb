Rails.application.routes.draw do

  resources :vat_account_balances
  resources :account_balances
  resources :crediting_notes
  resources :profiles
  devise_for :users
  
 
  get 'bank_accounts/unallocated'
  get 'purchases/paid'
  get 'purchases/draft_index'
  get 'purchases/unpaid'
  get 'purchases/partially_paid'
  get 'reports/balance_sheet'
  get 'report/trial_balance'
  get 'report/general_ledger'
  get 'payment_entries/invoice_entry'
  get 'receipt_entries/invoice_entry'
   get 'sales/paid'
  get 'sales/draft_index'
  get 'sales/unpaid'
  get 'sales/partially_paid'
    get 'sales/credit_note'
  resources :journals
  resources :journal_entries
  resources :products
    get 'purchases/draft'
   get 'purchases/invoice'
  resources :purchase_entries
  resources :purchases
  resources :contacts
  get 'sales/quote'
  get 'sales/draft'
   get 'sales/invoice'
  resources :sales_entries
  resources :sales
  resources :receipt_entries
  resources :payment_entries
  resources :bank_accounts
  resources :gl_accounts
  resources :financial_transactions
  resources :financial_transactions do
  member do
    patch :editrec
    put :editrec
  end
end


  get 'index/home'
  get 'reports/income_statement'
  get 'reports/trial_balance'
  get 'payment_entries/invoice_entry'
  get 'reports/customer_balance'
  get 'reports/supplier_balance'
  get 'reports/vat_report'
  root 'index#home'
  
    resources :financial_transactions do 
    collection { post :import }
  end
  resources :bank_accounts do 
    collection { post :import }
  end
  
   resources :financial_transactions do
    collection do
      delete 'destroy_multiple'
    end
  end
 
end