$(document).ready(function(){
	// menu nav waypoint
	var top = $('.menuWayTop');
	var mid = $('.menuWayMid');
	var bot = $('.menuWayBot');
	var way = $('.menuWaypoint');
	var bar = $('.menuSidebar');
	way.waypoint(function(event, direction) {
		if (direction == 'down') {
			bar.addClass('fixed_50');
		}
	})
	way.waypoint(function(event, direction) {
		if (direction == 'up') {
			bar.removeClass('fixed_50');
		}
	})
})