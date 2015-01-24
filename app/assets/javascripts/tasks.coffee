# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = undefined
ready = ->
  $("#search_form").submit (e) ->
    formURL = undefined
    postData = undefined
    $(".search_results").html "Searching..."
    formURL = undefined
    postData = undefined
    formURL = undefined
    postData = undefined
    postData = $(this).serializeArray()
    formURL = $(this).attr("action")
    $.ajax
      url: formURL
      type: "GET"
      data: postData
      success: (data, textStatus, jqXHR) ->
        $(".search_results").html data
        return

      error: (jqXHR, textStatus, errorThrown) ->
        $(".search_results").html data
        return

    e.preventDefault()
    return

  return

$(document).ready ready