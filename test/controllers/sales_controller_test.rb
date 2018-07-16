require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post :create, sale: { address: @sale.address, amount: @sale.amount, balance: @sale.balance, contact_id: @sale.contact_id, customer_id: @sale.customer_id, date: @sale.date, due_date: @sale.due_date, invoice_number: @sale.invoice_number, notes: @sale.notes, number: @sale.number, sale_id: @sale.sale_id, sales_type: @sale.sales_type, title: @sale.title, type: @sale.type, user_id: @sale.user_id, vat_total: @sale.vat_total }
    end

    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should show sale" do
    get :show, id: @sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale
    assert_response :success
  end

  test "should update sale" do
    patch :update, id: @sale, sale: { address: @sale.address, amount: @sale.amount, balance: @sale.balance, contact_id: @sale.contact_id, customer_id: @sale.customer_id, date: @sale.date, due_date: @sale.due_date, invoice_number: @sale.invoice_number, notes: @sale.notes, number: @sale.number, sale_id: @sale.sale_id, sales_type: @sale.sales_type, title: @sale.title, type: @sale.type, user_id: @sale.user_id, vat_total: @sale.vat_total }
    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale
    end

    assert_redirected_to sales_path
  end
end
