$(document).ready(function() {
	$('.contactUs, .commentFormHeader').live('click', function() {
		var form = $('.commentForm');
		var up = $('.commentFormShow');
		var down = $('.commentFormHide');
		if (form.hasClass('show')) {
			form.animate({
				bottom: '-=215'
			}, 0, function() {
				form.removeClass('show')
			})
			up.show();
			down.hide();
		}
		else {
			form.animate({
				bottom: '+=215'
			}, 0, function() {
				form.addClass('show')
			})
			$('.commentForm .field input').focus();
			up.hide();
			down.show();
		}
		return false;
	})
	// Regex comment form
	$('.commentForm .action input').live('click', function() {
		var email = $('.commentForm .field input').val();
		var content = $('.commentForm .field textarea').val();
		if (email.length == 0) {
			$('.commentForm .field input').focus();
			return false;
		}
		else if (content.length == 0 || content.length > 255) {
			$('.commentForm .field textarea').focus();
			return false;
		}
	})
	// Comment character counter
	$('.commentForm textarea').keyup(function() {
		var count = $(this).val().length;
		var remaining = 255 - count;
		var counter = $('.commentCounter');
		if (remaining < 0) {
			counter.addClass('red');
		}
		else {
			counter.removeClass('red');
		}
		counter.html(remaining);
	})	
})