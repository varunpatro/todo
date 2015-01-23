# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

search = ->
  form = $("#search_form")
  url = form.attr("action")
  formData = {}
  $(form).find("input[name]").each (index, node) ->
    formData[node.name] = node.value
    return

  $.get(url, formData).done (data) ->
    $(".search_results").html data
    return

  return

$("#search_button").click ->
  search()
  return

