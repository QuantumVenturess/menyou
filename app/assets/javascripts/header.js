$(document).ready(function() {
	var winWidth = $(window).width();
	var logoWidth = $('.logo').width();
	var navWidth = (winWidth - logoWidth)/2 - 70;
	$('.leftNav, .rightNav').width(navWidth);
	$(window).resize(function() {
		var winWidth = $(window).width();
		var logoWidth = $('.logo').width();
		var navWidth = (winWidth - logoWidth)/2 - 70;
		$('.leftNav, .rightNav').width(navWidth);
	})
})