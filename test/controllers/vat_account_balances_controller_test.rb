require 'test_helper'

class VatAccountBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vat_account_balance = vat_account_balances(:one)
  end

  test "should get index" do
    get vat_account_balances_url
    assert_response :success
  end

  test "should get new" do
    get new_vat_account_balance_url
    assert_response :success
  end

  test "should create vat_account_balance" do
    assert_difference('VatAccountBalance.count') do
      post vat_account_balances_url, params: { vat_account_balance: { date: @vat_account_balance.date, description: @vat_account_balance.description, financial_transaction_id: @vat_account_balance.financial_transaction_id, gl_account_id: @vat_account_balance.gl_account_id, journal_entry_id: @vat_account_balance.journal_entry_id, purchase_entry_id: @vat_account_balance.purchase_entry_id, purchase_id: @vat_account_balance.purchase_id, reference: @vat_account_balance.reference, sale_id: @vat_account_balance.sale_id, sales_entry_id: @vat_account_balance.sales_entry_id, user_id: @vat_account_balance.user_id, vat_amount: @vat_account_balance.vat_amount } }
    end

    assert_redirected_to vat_account_balance_url(VatAccountBalance.last)
  end

  test "should show vat_account_balance" do
    get vat_account_balance_url(@vat_account_balance)
    assert_response :success
  end

  test "should get edit" do
    get edit_vat_account_balance_url(@vat_account_balance)
    assert_response :success
  end

  test "should update vat_account_balance" do
    patch vat_account_balance_url(@vat_account_balance), params: { vat_account_balance: { date: @vat_account_balance.date, description: @vat_account_balance.description, financial_transaction_id: @vat_account_balance.financial_transaction_id, gl_account_id: @vat_account_balance.gl_account_id, journal_entry_id: @vat_account_balance.journal_entry_id, purchase_entry_id: @vat_account_balance.purchase_entry_id, purchase_id: @vat_account_balance.purchase_id, reference: @vat_account_balance.reference, sale_id: @vat_account_balance.sale_id, sales_entry_id: @vat_account_balance.sales_entry_id, user_id: @vat_account_balance.user_id, vat_amount: @vat_account_balance.vat_amount } }
    assert_redirected_to vat_account_balance_url(@vat_account_balance)
  end

  test "should destroy vat_account_balance" do
    assert_difference('VatAccountBalance.count', -1) do
      delete vat_account_balance_url(@vat_account_balance)
    end

    assert_redirected_to vat_account_balances_url
  end
end
