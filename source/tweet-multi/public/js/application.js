$(document).ready(function() {

	$('form').keyup(function(event) {
		$('#char_remaining').text(characterCount());
	});


	$('form').submit(function(event) {
		event.preventDefault();
		displayWaitMessage();
		sendTweet($(this).serialize());
	});

});



// private functions---------------------------------------

var displayWaitMessage = function() {
	$('.container').append("<h5 id='wait_message'>Please wait while your tweet is being sent...</h5>");
}

var sendTweet = function(form_data) {
	$.post('/tweet', form_data, function(response) {
		$('#wait_message').replaceWith("<h5 id='success_message'>Sent successfully.");
		$('form [name=tweet]').val("")
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
