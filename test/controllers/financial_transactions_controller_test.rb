require 'test_helper'

class FinancialTransactionsControllerTest < ActionController::TestCase
  setup do
    @financial_transaction = financial_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:financial_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create financial_transaction" do
    assert_difference('FinancialTransaction.count') do
      post :create, financial_transaction: { : @financial_transaction., bank_account_id: @financial_transaction.bank_account_id, contact_id: @financial_transaction.contact_id, date: @financial_transaction.date, description: @financial_transaction.description, gl_account_id: @financial_transaction.gl_account_id, net_amount: @financial_transaction.net_amount, payment: @financial_transaction.payment, payment_entry_id: @financial_transaction.payment_entry_id, project_id: @financial_transaction.project_id, purchase_id: @financial_transaction.purchase_id, receipt_entry_id: @financial_transaction.receipt_entry_id, reference: @financial_transaction.reference, sale_id: @financial_transaction.sale_id, total_amount: @financial_transaction.total_amount, transaction_type: @financial_transaction.transaction_type, vat_amount: @financial_transaction.vat_amount, vat_type: @financial_transaction.vat_type }
    end

    assert_redirected_to financial_transaction_path(assigns(:financial_transaction))
  end

  test "should show financial_transaction" do
    get :show, id: @financial_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @financial_transaction
    assert_response :success
  end

  test "should update financial_transaction" do
    patch :update, id: @financial_transaction, financial_transaction: { : @financial_transaction., bank_account_id: @financial_transaction.bank_account_id, contact_id: @financial_transaction.contact_id, date: @financial_transaction.date, description: @financial_transaction.description, gl_account_id: @financial_transaction.gl_account_id, net_amount: @financial_transaction.net_amount, payment: @financial_transaction.payment, payment_entry_id: @financial_transaction.payment_entry_id, project_id: @financial_transaction.project_id, purchase_id: @financial_transaction.purchase_id, receipt_entry_id: @financial_transaction.receipt_entry_id, reference: @financial_transaction.reference, sale_id: @financial_transaction.sale_id, total_amount: @financial_transaction.total_amount, transaction_type: @financial_transaction.transaction_type, vat_amount: @financial_transaction.vat_amount, vat_type: @financial_transaction.vat_type }
    assert_redirected_to financial_transaction_path(assigns(:financial_transaction))
  end

  test "should destroy financial_transaction" do
    assert_difference('FinancialTransaction.count', -1) do
      delete :destroy, id: @financial_transaction
    end

    assert_redirected_to financial_transactions_path
  end
end
