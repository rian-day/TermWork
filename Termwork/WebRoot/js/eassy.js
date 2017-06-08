$(document).ready(function() {
	$(".comment-box").slideToggle(0);
});
$(".comment-bar").click(function(event) {
	/* Act on the event */
	$(".comment-box").slideToggle(500);
});
function addcommit(username,eassyid){
	alert(eassyid);
	alert(username);
	var commentcontent=$("#commentcontent").val();
	alert(commentcontent);
	$.ajax({
		url: 'addcommit.in',
		type: 'POST',
		data: {
			username: username,
			commentcontent:commentcontent,
			eassyid:eassyid
			},
		success: function(message){
			if(message=="1"){
				tip("添加成功");
			}else{
				tip("发生未知错误");
			}
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