$(document).ready(function() {
	//屏蔽右击
 
	 // $(document).bind("contextmenu",function(e){   
  //       return false;   
  //    });   

	//第一个版本
	// $("#header .container-fluid .row #nav-second a").click(function(event) {
	// 	if($("#header .container-fluid .row #nav-second a").html().toString()=='<img src="img/index/heart-red.png">'){
	// 		$("#header .container-fluid .row #nav-second a").html('<img src="img/index/heart-filled-red.png">');
	// 	}else{
	// 		$("#header .container-fluid .row #nav-second a").html('<img src="img/index/heart-red.png">');
	// 	}
	// });
	// $(window).scroll(function(event) {
	// 	var distance =$(window).scrollTop();
	// 	if (distance>=50){
	// 		$("#header").css({
	// 			"position": 'fixed',
	// 			"top": '0px',
	// 			"z-index":'99'
	// 		});
	// 		$("#header .container-fluid .row div").css({
	// 			"height": '75px',
	// 			"padding": '10px'
	// 		});
	// 		$("#body").css('margin-top', '120px');
	// 		$("#header .container-fluid .row h1").css({
	// 			"padding-left":'60px',
	// 			'padding-top':'30px'
	// 		});
	// 		$("#h1-box").css('padding', '0px');
	// 	}
	// 	if (distance<50){
	// 		$("#header").css({
	// 			"position": 'relative',
	// 			"top": '0px'
	// 		});
	// 		$("#header .container-fluid .row div").css({
	// 			"height": '150px',
	// 			"padding": '60px'
	// 		});

	// 		$("#header .container-fluid .row h1").css({
	// 			"padding-left":'0px',
	// 			"padding-top":"0px"
	// 		});

	// 		$("#body").css('margin-top', '0px');
	// 	}
		
	// });

	//禁用滚动条
	// $(document.body).css({
	// 	   "overflow-x":"hidden",
	// 	   "overflow-y":"hidden"
	// 	});

	//导航栏随页面滚动条变化

	if($(window).scrollTop()>=40){
			$("#header").css({
				'top': '0px',
				property2: 'value2'
			});
			$("#header-static").css({
				'top': '-110px',
				property2: 'value2'
			});
	}
	$(window).scroll(function(event) {
		/* Act on the event */
		var distance=$(window).scrollTop();
		if(distance>=40){
			$("#header").css({
				'top': '0px',
				property2: 'value2'
			});
			$("#header-static").css({
				'top': '-110px',
				property2: 'value2'
			});
		}
		if(distance<40){
			$("#header").css({
				'top': '-80px',
				property2: 'value2'
			});
			$("#header-static").css({
				'top': '0px',
				property2: 'value2'
			});
		}
	});
	//第二个版本
	var widt=parseFloat($("#header #logo").width())/2.0;   //让logo居中
	$("#header #logo").css({
		'margin-left':'-'+widt+'px',
		'opacity':'1.0'
});

	$("#header #item2 a").click(function(event) {
		if($("#header #item2 a").html().toString()=='<img src="http://optpqehds.bkt.clouddn.com/bc/images/navbar/heart-red.png">'){
			$("#header #item2 a").html('<img src="http://optpqehds.bkt.clouddn.com/bc/images/navbar/heart-filled-red.png">');
		}else{
			$("#header #item2 a").html('<img src="http://optpqehds.bkt.clouddn.com/bc/images/navbar/heart-red.png">');
		}
	});
	//弹出header-left 左侧导航
	$("#header #box-left #item1").click(function(event) {
		$("#header-left").css({
			'left': '0px',
			'opacity': '1.0'
		});
		$("#mask-top,#mask-bottom").css({
			'animation':'mask-show 2s',
			'height':'50vh',
			'opacity':'0.7'
		});
		$("body").css('overflow', 'hidden');
	});
	//弹出header-left 左侧导航
	$("#header-static #menu-box").click(function(event) {
		/* Act on the event */
		$("body").css('overflow', 'hidden');
		$("#header-left").css({
			'left': '0px',
			'opacity': '1.0'
		});
		$("#mask-top,#mask-bottom").css({
			'animation':'mask-show 2s',
			'height':'50vh',
			'opacity':'0.7'
		});
	});
	//左侧导航缩进
	$("#header-left #head #text span").click(function(event) {
		$("#header-left").css({
			'left': '-300px',
			'opacity': '0.7'
		});
		$("#mask-top,#mask-bottom").css({
			'animation':'mask-hidden 3s',
			'height':'0px'
		});
		$("body").css('overflow', 'auto');
	});
	//点击遮罩层左侧导航缩进
	$("#mask-top,#mask-bottom").click(function(event) {
		$("#header-left").css({
			'left': '-300px',
			'opacity': '0.7'
		});
		$("#mask-top,#mask-bottom").css({
			'animation':'mask-hidden 2s',
			'height':'0px'
		});
		$("body").css('overflow', 'auto');
	});
	//监视网页大小
	if(document.body.clientWidth<1000){
			$("#header #item4").attr('id','item4-m');
			$("#header #item2").attr('id','item2-m');
			$("#header #item3").attr('id','item3-m');
	}
	window.onresize=function(){
		if(document.body.clientWidth>=1000){
			$("#header #item4-m").attr('id','item4');
			$("#header #item2-m").attr('id','item2');
			$("#header #item3-m").attr('id','item3');
		}
		if(document.body.clientWidth<1000){
			$("#header #item4").attr('id','item4-m');
			$("#header #item2").attr('id','item2-m');
			$("#header #item3").attr('id','item3-m');
		}

	}
	
});
//护眼模式!!!!
$("#header-left #change span").click(function(event) {
	/* Act on the event */
	change();
});

//header-static search界面
$("#header-static #search-box span").click(function(event) {
	/* Act on the event */
	$("#header-static #search-box #search input").css({
		'opacity': '1.0',
		'animation':'search-input 2s'
	});
	$("#header-static #search-box #search").css({
		'left': '0',
		'animation': 'search 0.7s'
	});
});
//search
$("#header #item4 span").click(function(event) {
	/* Act on the event */
	$("#header #box-right").css({
		'opacity': '1.0',
		'display': 'block'
	});
	$("#mask-main").css({
		'background-color': 'rgba(0,0,0,0.75)',
		'height': '100vh',
		'animation':'mask-main 1s'
	});
	$("body").css('overflow', 'hidden');
});
$("#mask-main").click(function(event) {
	/* Act on the event */
	$("#mask-main").css({
		'background-color': 'rgba(0,0,0,0.75)',
		'height': '0vh'
	});
	$("#header #box-right").css({
		'opacity': '1.0',
		'display': 'none'
	});
	$("body").css('overflow', 'auto');
});
//改变网页颜色
function change(){
	$("#header-left #change span").css('color', 'red');
	$("body").css({
		'background': '#282828',
		'color': '#ccc'
	});
	$("#header-static").css({
		'background': '#380000',
		'color': '#ccc'
	});
	$("#header").css({
		'background': '#380000',
		'color': '#ccc'
	});
	$("#header #box-left").css({
		'border-color': '#888',
		'color': '#ccc'
	});
	$("#header #box-left span").css({
		'border-color': '#888',
		'color': '#ccc'
	});
	$("#header-left").css({
		'background': '#282828',
		'color': '#ccc',
	});
	$("#header-left #items").css({
		'border-color':'#888',
		property2: 'value2'
	});
	$("#header #item3").css({
		'background': '#2F4F4F',
		'color': '#ccc'
	});
	$(".footer").css({
		'background': '#505050',
		'color': '#ccc'
	});
	$(".footer #top").css({
		'background': '#505050',
		'border-color': '#eee'
	});
	$("#details-devider").css({
		'background': '#380000',
		'color': '#ccc'
	});
}