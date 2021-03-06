createAddPlaceDialog = ->
	addDialog = $('#add-place-dialog')
	addForm = addDialog.find 'form'
	
	placeNameField = $('#place_name')
	walkingField = $('#place_walkable')
	timeFields = $('#add-place-dialog select')
	submitButton = $('#add-place-dialog input[type=submit]')
		
	addDialog.dialog
		autoOpen: false
		modal: true
		title: $('#add-place').text()
		resizable: false
		buttons: [{
		  text: submitButton.val()
		  click: ->
		    addForm.submit()
		}]
		open: ->
			placeNameField.val ''
			timeFields.val ''
			walkingField.removeAttr 'checked'
			placeNameField.focus()

	$('#add-place').button(icons: {primary:"ui-icon-plusthick"}).click ->
		addDialog.dialog 'open'
			
	submitButton.hide()
	
createEditPlaceDialog = ->
  editDialog = $('#edit-place-dialog')
  editDialog.dialog
    autoOpen: false
    modal: true
    title: editDialog.attr('title')
    resizable: false
	
$(document).ready ->
	createAddPlaceDialog()
	createEditPlaceDialog()