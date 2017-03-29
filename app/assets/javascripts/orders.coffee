# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('select#quantity').bind 'change', ->
    console.log 'quantity was changed'
    new_text = 'Order Now - ' + $('select option:selected').html()
    $('.btn-order').html new_text


