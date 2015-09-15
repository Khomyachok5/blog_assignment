# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

prevOpenedNinja = null
$(document).ready ->
  $('.reply_button').click ->
    div = $('#' + @getAttribute('data-id'))
    if div.hasClass('ninja')
      if prevOpenedNinja != null
        prevOpenedNinja.addClass 'ninja'
      div.removeClass 'ninja'
      #Form shows on button click
      prevOpenedNinja = div
    else
      div.addClass 'ninja'
    false
  return