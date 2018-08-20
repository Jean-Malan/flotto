# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update_fields = ->
  $('tr').each ->
    if $('#select').val() == 'Select'
      $('.invoicedrop').hide()
      $('.standarddrop').hide()
    else if $('#select').val() == 'Regular'
      $('.invoicedrop').hide()
      $('.standarddrop').show()
    else if $('#select').val() == 'Invoice'
      $('.standarddrop').hide()
      $('.invoicedrop').show()
    return
  return

$(document).on 'click', '#transactionType', ->
  $('td').change ->
    update_fields()
    return
  return