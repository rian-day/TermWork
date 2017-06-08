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
function addfollow(followername,username){
	$.ajax({
		url: 'addfollow.in',
		type: 'POST',
		data: {
			followername: followername,
			username:username
		},
		success: function(message){
			if(message==1)tip("关注成功");
			else tip("已经关注");
		}
	})
	.done(function() {
		console.log("success");
		tip("完成");
	})
	.fail(function() {
		console.log("error");
		tip("发生未知错误");
	})
	.always(function() {
		console.log("complete");
	});
}