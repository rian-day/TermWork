$("#content #box-left #nav").mouseover(function(event) {
	/* Act on the event */
	$(this).find('#public').css({
		'height': '0px',
		'line-height':'0px',
		'font-size':'0px'
	});
	$(this).find('#person').css({
		'height': '100px',
		'line-height': '100px',
		'font-size':'20px'
	});
});
$("#content #box-left #nav").mouseout(function(event) {
	/* Act on the event */
	$(this).find('#public').css({
		'height': '100px',
		'line-height':'100px',
		'font-size':'20px'
	});
	$(this).find('#person').css({
		'height': '0px',
		'line-height': '0px',
		'font-size':'0px'
	});
});
//第一个版本
//第二个版本
