# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# For Reply Form
$ ->
  $('.toReplyForm').each ->
    $(this).click ->
      $(this).next().toggle()
      return
    return
  return


# For Edit Form
$ ->
  $('.toEditForm').each ->
    $(this).click ->
      $(this).next().toggle()
      return
    return
  return