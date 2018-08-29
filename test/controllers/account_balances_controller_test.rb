require 'test_helper'

class AccountBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_balance = account_balances(:one)
  end

  test "should get index" do
    get account_balances_url
    assert_response :success
  end

  test "should get new" do
    get new_account_balance_url
    assert_response :success
  end

  test "should create account_balance" do
    assert_difference('AccountBalance.count') do
      post account_balances_url, params: { account_balance: { account_id: @account_balance.account_id, amount: @account_balance.amount, date: @account_balance.date, reference: @account_balance.reference, user_id: @account_balance.user_id } }
    end

    assert_redirected_to account_balance_url(AccountBalance.last)
  end

  test "should show account_balance" do
    get account_balance_url(@account_balance)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_balance_url(@account_balance)
    assert_response :success
  end

  test "should update account_balance" do
    patch account_balance_url(@account_balance), params: { account_balance: { account_id: @account_balance.account_id, amount: @account_balance.amount, date: @account_balance.date, reference: @account_balance.reference, user_id: @account_balance.user_id } }
    assert_redirected_to account_balance_url(@account_balance)
  end

  test "should destroy account_balance" do
    assert_difference('AccountBalance.count', -1) do
      delete account_balance_url(@account_balance)
    end

    assert_redirected_to account_balances_url
  end
end
