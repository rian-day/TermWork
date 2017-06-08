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
function deleteeassy(ele,eassyid){
	var a=$(ele).parent().parent("#eassy");
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

//异步刷新加载
var start=5;
var end=10;
var count=0;
$("#box-left .bottombar").click(function(){
	$(this).html("");
	$(this).css({
		'background-image': 'url("../img/loading/smallload.gif")',
		'cursor': 'auto'
	});
	$(this).unbind("click");

	$.ajax({
		url: 'moreload.in',
		type: 'POST',
		data: {
			start: start,
			end:end
			},
		success: function(json){
			$.each(JSON.parse(json),function(index, ele){
				$("#box-left #eassy-box").append('<div id="eassy"><div id="person-info"><div id="person-head"></div>'+ele.username+'</div><div id="person-content"><a href="page/eassy.jsp?eassyid='+ele.eassyid+'"><div id="eassy-name">'+ele.eassytitle+'</div></a><div id="eassy-content">'+ele.content+'</div><div id="eassy-foot"><ul><li><span class="glyphicon glyphicon-time">'+ele.time+'</span></li><li><span class="glyphicon glyphicon-comment"></span></li><li><span class="glyphicon glyphicon-heart-empty">'+ele.good+'</span></li></ul></div></div></div>'
						);
				});
		}
	})
	.done(function() {
		console.log("success");
		start+=5;
		end+=5;
		count=0;
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
		$(this).html('加载更多 <span class="glyphicon glyphicon-chevron-down"></span>');
		$(this).css({
			'background-image': 'none',
			'cursor': 'pointer'
		});
		$(this).bind("click",function(){
			$(this).html("");
			$(this).css({
				'background-image': 'url("../img/loading/smallload.gif")',
				'background-color: ':'#fff',
				'cursor': 'auto'
			});
			$(this).unbind("click");
		});
	});
	
});
