$(document).ready(function() {
	// About page images
	$('.aboutImages img').each(function() {
		$(this).imagesLoaded(function() {
			var width = $(this).width();
			var maxWidth = 720;
			if (width < maxWidth) {
				var offset = (maxWidth - width)/2;
				$(this).css('margin-left', offset);
			}
			else if (width > maxWidth) {
				var offset = (width - maxWidth)/2 * -1;
				$(this).css('margin-left', offset)
			}
		})
	})
	// Menu item images
	setInterval(adjustItemImage, 0);
	// Category images
	setInterval(adjustCategoryImage, 0);
	// Lightbox
	$('.itemImage a').lightBox({
		txtImage: $(this).attr('title')
	});
})

function adjustItemImage() {
	$('.menuItems img').each(function() {
		$(this).imagesLoaded(function() {
			var width = $(this).width();
			var maxWidth = 130;
			if (width < maxWidth) {
				var offset = Math.round((maxWidth - width)/2);
				$(this).css('margin-left', offset);
			}
			else if (width > maxWidth) {
				var offset = Math.round((width - maxWidth)/2 * -1);
				$(this).css('margin-left', offset)
			}
		})
	})
}

function adjustCategoryImage() {
	$('.categoryImage img').each(function() {
		$(this).imagesLoaded(function() {
			var height = $(this).height();
			var maxHeight = 200;
			if (height < maxHeight) {
				var offset = Math.round((maxHeight - height)/2);
				$(this).css('margin-top', offset);
			}
			else if (height > maxHeight) {
				var offset = (height - maxHeight)/2 * -1;
				$(this).css('margin-top', offset)
			}
		})
	})
}