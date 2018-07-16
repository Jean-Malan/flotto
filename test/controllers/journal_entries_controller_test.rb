require 'test_helper'

class JournalEntriesControllerTest < ActionController::TestCase
  setup do
    @journal_entry = journal_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_entry" do
    assert_difference('JournalEntry.count') do
      post :create, journal_entry: { account_id: @journal_entry.account_id, amount: @journal_entry.amount, credit: @journal_entry.credit, current_liability: @journal_entry.current_liability, date: @journal_entry.date, debit: @journal_entry.debit, description: @journal_entry.description, equity: @journal_entry.equity, gl_account_id: @journal_entry.gl_account_id, journal_id: @journal_entry.journal_id, non_current_liability: @journal_entry.non_current_liability, user_id: @journal_entry.user_id }
    end

    assert_redirected_to journal_entry_path(assigns(:journal_entry))
  end

  test "should show journal_entry" do
    get :show, id: @journal_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal_entry
    assert_response :success
  end

  test "should update journal_entry" do
    patch :update, id: @journal_entry, journal_entry: { account_id: @journal_entry.account_id, amount: @journal_entry.amount, credit: @journal_entry.credit, current_liability: @journal_entry.current_liability, date: @journal_entry.date, debit: @journal_entry.debit, description: @journal_entry.description, equity: @journal_entry.equity, gl_account_id: @journal_entry.gl_account_id, journal_id: @journal_entry.journal_id, non_current_liability: @journal_entry.non_current_liability, user_id: @journal_entry.user_id }
    assert_redirected_to journal_entry_path(assigns(:journal_entry))
  end

  test "should destroy journal_entry" do
    assert_difference('JournalEntry.count', -1) do
      delete :destroy, id: @journal_entry
    end

    assert_redirected_to journal_entries_path
  end
end
