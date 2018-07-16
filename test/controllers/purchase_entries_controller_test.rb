require 'test_helper'

class PurchaseEntriesControllerTest < ActionController::TestCase
  setup do
    @purchase_entry = purchase_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_entry" do
    assert_difference('PurchaseEntry.count') do
      post :create, purchase_entry: { account_id: @purchase_entry.account_id, description: @purchase_entry.description, gl_account_id: @purchase_entry.gl_account_id, net_price: @purchase_entry.net_price, price: @purchase_entry.price, product_id: @purchase_entry.product_id, purchase_id: @purchase_entry.purchase_id, quantity: @purchase_entry.quantity, total_price: @purchase_entry.total_price, user_id: @purchase_entry.user_id, vat_amount: @purchase_entry.vat_amount, vat_type: @purchase_entry.vat_type }
    end

    assert_redirected_to purchase_entry_path(assigns(:purchase_entry))
  end

  test "should show purchase_entry" do
    get :show, id: @purchase_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_entry
    assert_response :success
  end

  test "should update purchase_entry" do
    patch :update, id: @purchase_entry, purchase_entry: { account_id: @purchase_entry.account_id, description: @purchase_entry.description, gl_account_id: @purchase_entry.gl_account_id, net_price: @purchase_entry.net_price, price: @purchase_entry.price, product_id: @purchase_entry.product_id, purchase_id: @purchase_entry.purchase_id, quantity: @purchase_entry.quantity, total_price: @purchase_entry.total_price, user_id: @purchase_entry.user_id, vat_amount: @purchase_entry.vat_amount, vat_type: @purchase_entry.vat_type }
    assert_redirected_to purchase_entry_path(assigns(:purchase_entry))
  end

  test "should destroy purchase_entry" do
    assert_difference('PurchaseEntry.count', -1) do
      delete :destroy, id: @purchase_entry
    end

    assert_redirected_to purchase_entries_path
  end
end
