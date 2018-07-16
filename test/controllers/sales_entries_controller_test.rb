require 'test_helper'

class SalesEntriesControllerTest < ActionController::TestCase
  setup do
    @sales_entry = sales_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_entry" do
    assert_difference('SalesEntry.count') do
      post :create, sales_entry: { account_id: @sales_entry.account_id, description: @sales_entry.description, gl_account_id: @sales_entry.gl_account_id, price: @sales_entry.price, product_id: @sales_entry.product_id, quantity: @sales_entry.quantity, sale_id: @sales_entry.sale_id, total_price: @sales_entry.total_price, vat_amount: @sales_entry.vat_amount, vat_type: @sales_entry.vat_type }
    end

    assert_redirected_to sales_entry_path(assigns(:sales_entry))
  end

  test "should show sales_entry" do
    get :show, id: @sales_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_entry
    assert_response :success
  end

  test "should update sales_entry" do
    patch :update, id: @sales_entry, sales_entry: { account_id: @sales_entry.account_id, description: @sales_entry.description, gl_account_id: @sales_entry.gl_account_id, price: @sales_entry.price, product_id: @sales_entry.product_id, quantity: @sales_entry.quantity, sale_id: @sales_entry.sale_id, total_price: @sales_entry.total_price, vat_amount: @sales_entry.vat_amount, vat_type: @sales_entry.vat_type }
    assert_redirected_to sales_entry_path(assigns(:sales_entry))
  end

  test "should destroy sales_entry" do
    assert_difference('SalesEntry.count', -1) do
      delete :destroy, id: @sales_entry
    end

    assert_redirected_to sales_entries_path
  end
end
