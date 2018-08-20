# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


update_amounts = ->
  sum = 0.0
  vatDue = 0.0
  $('#myTable > tr').each ->
    vat = $(this).find('.vat').val()
    qty = $(this).find('.qty').val()
    price = $(this).find('.price').val()
    amount = qty * price
    sum += amount
    $(this).find('#amount').text 'R' + amount.toFixed(2)
    return
  $('.total').text sum.toFixed(2)
  return

$(document).on 'click', '#myTable', ->
  update_amounts()
  $('#amount').change ->
    update_amounts()
    return
  return
$(document).on 'click', '#myTable', ->
  update_amounts()
  $('#amount').change ->
    update_amounts()
    return
  return
