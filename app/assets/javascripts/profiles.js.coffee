# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $('.js-form').on('ajax:beforeSend', (e, data, status, xhr) ->
    $('.js-loading').toggle()
    $('.js-ok').hide()
  )

  $('.js-form').on('ajax:success', (e, data, status, xhr) ->
    $('.js-loading').toggle()
    $('.js-ok').show()
  )
