function search(){
	var text=$("#search-content").val();
	$.ajax({
		url: 'search.in',
		type: 'POST',
		data: {
			text: text
		},
		//scriptCharset: 'utf-8',
		//contentType: "application/x-www-form-urlencoded; charset=utf-8",   
		success: function(json){
			$("#body1").html("");
			$.each(JSON.parse(json),function(index, ele){
				var eassyImg=null;
				var eassyImg1=null;
					if(ele.imgres!=null){
						eassyImg=ele.imgres.split("|");
						eassyImg1=eassyImg[0];
					}
					
					$("#body1").prepend(
							"<div id='essay_box' class='col-md-6 col-lg-4 col-xs-6'>" +
							"<img src='"+eassyImg1+"'>"+
							"<h1>"+ele.eassytitle+"</h1>" +
							"<p>"+ele.content+"</p> " +
							"<div id='link_box'>" +
							"<span class='glyphicon glyphicon-time'>"+ele.time+"</span>" +
							"</div>" +
						"</div>"
					)
			});
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
$('#search-content').on('keypress',function(event){ 
    
    if(event.keyCode == 13)      

    {  
    	search();
    }  

});