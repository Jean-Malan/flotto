require 'test_helper'

class PaymentEntriesControllerTest < ActionController::TestCase
  setup do
    @payment_entry = payment_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_entry" do
    assert_difference('PaymentEntry.count') do
      post :create, payment_entry: { transaction_id: @payment_entry.transaction_id }
    end

    assert_redirected_to payment_entry_path(assigns(:payment_entry))
  end

  test "should show payment_entry" do
    get :show, id: @payment_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_entry
    assert_response :success
  end

  test "should update payment_entry" do
    patch :update, id: @payment_entry, payment_entry: { transaction_id: @payment_entry.transaction_id }
    assert_redirected_to payment_entry_path(assigns(:payment_entry))
  end

  test "should destroy payment_entry" do
    assert_difference('PaymentEntry.count', -1) do
      delete :destroy, id: @payment_entry
    end

    assert_redirected_to payment_entries_path
  end
end
