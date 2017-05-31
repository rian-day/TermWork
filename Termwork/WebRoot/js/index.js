function deleteeassy(ele,eassyid){
	var a=$(ele).parent().parent("#essay_box");
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