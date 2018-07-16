require 'test_helper'

class GlAccountsControllerTest < ActionController::TestCase
  setup do
    @gl_account = gl_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gl_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gl_account" do
    assert_difference('GlAccount.count') do
      post :create, gl_account: { account_type: @gl_account.account_type, code: @gl_account.code, name: @gl_account.name }
    end

    assert_redirected_to gl_account_path(assigns(:gl_account))
  end

  test "should show gl_account" do
    get :show, id: @gl_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gl_account
    assert_response :success
  end

  test "should update gl_account" do
    patch :update, id: @gl_account, gl_account: { account_type: @gl_account.account_type, code: @gl_account.code, name: @gl_account.name }
    assert_redirected_to gl_account_path(assigns(:gl_account))
  end

  test "should destroy gl_account" do
    assert_difference('GlAccount.count', -1) do
      delete :destroy, id: @gl_account
    end

    assert_redirected_to gl_accounts_path
  end
end
