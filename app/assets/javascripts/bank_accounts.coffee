# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

total = 0

CalculateTotal = ->
  $('value').each ->
    if $(this).is(':checked')
      total += parseFloat($(this).val())
    return
  $('#total').html total
  return

$('input:checkbox').change(->
  total = 0
  CalculateTotal()
  return
).trigger 'change'