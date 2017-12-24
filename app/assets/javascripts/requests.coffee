# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	
	institutes = $('#request_institute').html();
	$('#request_college_id').change ->
		college = $('#request_college_id :selected').text()
		options = $(institutes).filter("optgroup[label='#{college}']").html()
		if options
			$('#request_institute').html(options)
			$('#request_institute').parent().show()
		else
			$('request_institute').empty()
			