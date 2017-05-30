$("#body1 #person_info #text").click(function(event) {
	/* Act on the event */
	$("#body1 #input-box").fadeToggle(300);
});
function Ddynamic(ele,dynamicid){
	$.ajax({
		url: 'Ddynamic.in',
		type: 'POST',
		data: {dynamicid: dynamicid},
		success: function(message){
			if(message==1){
				tip("删除成功");
				var p=$(ele).parent().parent().parent().parent().parent().parent(".goods");
				p.fadeOut('slow');
			}else tip("发生错误");
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
function commit(){
	var content=$("#dynamic-content").val();
	$.ajax({
		url: 'insertDynamic.in',
		type: 'POST',
		data: {content: content},
		success: function(message){
			if(message==1){
				tip("添加成功");
				$("#person_info").after("" +
						"<div class='D-tip'>有最新动态!</div>");
			}else tip("发生错误");
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