$(document).ready(function() {
	$('#sign_in_native').click(function(event) {
		event.preventDefault();

		loadNative();
	});

	$('#new_account').click(function(event) {
		event.preventDefault();

		newAccount();
	});

});


// private functions----------------------------------

var loadNative = function() {
	$.get('/sign_in_native', function(response) {
		$('.user_false').html(response);
	});
}

var newAccount = function() {
	$.get('/new_account', function(response) {
		$('.user_false').html(response);
	});
}
