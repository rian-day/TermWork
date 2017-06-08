$(".content .view").mouseover(function(event) {
	/* Act on the event */
	$(this).find('.bottom').css('bottom', '0px');
});
$(".content .view").mouseout(function(event) {
	/* Act on the event */
	$(this).find('.bottom').css('bottom', '-75px');
});