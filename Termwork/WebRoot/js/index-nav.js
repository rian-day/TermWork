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

	//第二个版本
	var widt=parseFloat($("#header #logo").width())/2.0;   //让logo居中
	$("#header #logo").css({
		'margin-left':'-'+widt+'px',
		'opacity':'1.0'
	});

	$("#header #item2 a").click(function(event) {
		if($("#header #item2 a").html().toString()=='<img src="../img/index/heart-red.png">'){
			$("#header #item2 a").html('<img src="../img/index/heart-filled-red.png">');
		}else{
			$("#header #item2 a").html('<img src="../img/index/heart-red.png">');
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
		// $("body").css({
		// 	'transition':'3s',
		// 	'transform':'translate(300px,0px)'
		// });
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
		// $("body").css({
		// 	'transition':'3s',
		// 	'transform':'translate(0px,0px)'
		// });
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
		// $("body").css({
		// 	'transition':'3s',
		// 	'transform':'translate(0px,0px)'
		// });
	});
	//监视网页大小
	// window.onresize=function(){
	// 	alert(document.body.clientWidth);
	// }
	
});
