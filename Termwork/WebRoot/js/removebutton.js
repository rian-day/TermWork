$("#content #items").mouseover(function(event) {
	/* Act on the event */
	$(this).find('#remove').css('opacity', '1.0');
});
$("#content #items").mouseout(function(event) {
	/* Act on the event */
	$(this).find('#remove').css('opacity', '0');
});