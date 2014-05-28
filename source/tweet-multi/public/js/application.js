$(document).ready(function() {

	$('form').keyup(function(event) {
		$('#char_remaining').text(characterCount());
	});


	$('form').submit(function(event) {
		event.preventDefault();
		sendTweet($(this).serialize());
	});

});



// private functions---------------------------------------

var displayWaitMessage = function() {
	$('textarea').prop('placeholder', "Please wait while your tweet is being sent...");
}

var sendTweet = function(form_data) {
	$.post('/tweet', form_data, function(response) {
		$('form [name=tweet]').val("")
		$('textarea').prop('placeholder', "Sent successfully.");
		resetForm();
	});
}

var characterCount = function() {
	var charLimit = 140;
	var remaining = charLimit - $('form [name=tweet]').val().length;

	if (remaining === charLimit) {
		$('form [type=submit]').prop('disabled', true);
		$('#char_remaining').css('color', '#E0E0E0')
	}
	else if (remaining < 0) {
		$('form [type=submit]').prop('disabled', true);
		$('#char_remaining').css('color', '#FF0033')
	}
	else {
		$('form [type=submit]').prop('disabled', false);
		$('#char_remaining').css('color', '#E0E0E0')
	}

	return remaining;
}

var resetForm = function() {
	setTimeout(function() { 
		$('textarea').prop('placeholder', "enter 140 characters or less.");
		$('textarea').focus();
		$('#char_remaining').text(140);
	}, 2000);
}