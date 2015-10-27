# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#function that creates array of preferences for user
window.getChosen = ->
  items_array = []
  $('#chosen_items li').each ->
    items_array.push $(this).text().trim()
  items_array

#function that submits user choice every time he modifies his preferences
window.saveChoice = ->
  a = getChosen()
  $.ajax
    method: 'POST'
    url: '/users/update_prefs'
    data:
      preferences: a

$(document).ready ->
  #Create sortable lists
  document.el_ava = document.getElementById('available_items')
  document.sortable = Sortable.create(document.el_ava, {group: "lists", onEnd: saveChoice})
  document.el_cho = document.getElementById('chosen_items')
  document.sortable = Sortable.create(document.el_cho, {group: "lists", onEnd: saveChoice})
