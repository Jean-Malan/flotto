require 'test_helper'

class CreditingNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crediting_note = crediting_notes(:one)
  end

  test "should get index" do
    get crediting_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_crediting_note_url
    assert_response :success
  end

  test "should create crediting_note" do
    assert_difference('CreditingNote.count') do
      post crediting_notes_url, params: { crediting_note: { balance: @crediting_note.balance, contact_id: @crediting_note.contact_id, credit_amount: @crediting_note.credit_amount, date: @crediting_note.date, purchase_id: @crediting_note.purchase_id, sale_id: @crediting_note.sale_id, user_id: @crediting_note.user_id } }
    end

    assert_redirected_to crediting_note_url(CreditingNote.last)
  end

  test "should show crediting_note" do
    get crediting_note_url(@crediting_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_crediting_note_url(@crediting_note)
    assert_response :success
  end

  test "should update crediting_note" do
    patch crediting_note_url(@crediting_note), params: { crediting_note: { balance: @crediting_note.balance, contact_id: @crediting_note.contact_id, credit_amount: @crediting_note.credit_amount, date: @crediting_note.date, purchase_id: @crediting_note.purchase_id, sale_id: @crediting_note.sale_id, user_id: @crediting_note.user_id } }
    assert_redirected_to crediting_note_url(@crediting_note)
  end

  test "should destroy crediting_note" do
    assert_difference('CreditingNote.count', -1) do
      delete crediting_note_url(@crediting_note)
    end

    assert_redirected_to crediting_notes_url
  end
end
