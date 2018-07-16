require 'test_helper'

class ReceiptEntriesControllerTest < ActionController::TestCase
  setup do
    @receipt_entry = receipt_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_entry" do
    assert_difference('ReceiptEntry.count') do
      post :create, receipt_entry: { transaction_id: @receipt_entry.transaction_id }
    end

    assert_redirected_to receipt_entry_path(assigns(:receipt_entry))
  end

  test "should show receipt_entry" do
    get :show, id: @receipt_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_entry
    assert_response :success
  end

  test "should update receipt_entry" do
    patch :update, id: @receipt_entry, receipt_entry: { transaction_id: @receipt_entry.transaction_id }
    assert_redirected_to receipt_entry_path(assigns(:receipt_entry))
  end

  test "should destroy receipt_entry" do
    assert_difference('ReceiptEntry.count', -1) do
      delete :destroy, id: @receipt_entry
    end

    assert_redirected_to receipt_entries_path
  end
end
