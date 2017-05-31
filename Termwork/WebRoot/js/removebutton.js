$("#content #items").mouseover(function(event) {
	/* Act on the event */
	$(this).find('#remove').css('opacity', '1.0');
});
$("#content #items").mouseout(function(event) {
	/* Act on the event */
	$(this).find('#remove').css('opacity', '0');
});
function deleteeassy(ele,eassyid){
	var a=$(ele).parent().parent("#items");
	a.fadeOut('slow');
	$.ajax({
		url: 'Deassy.in',
		type: 'POST',
		data: {eassyid: eassyid},
		success: function(message){
			if(message==1)tip("success");
			else tip("failed");
		}
	})
	.done(function() {
		console.log("success");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
}