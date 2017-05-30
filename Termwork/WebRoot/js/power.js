var username=new Array([10000]);
var powername=new Array([10000]);
var count=0;
var countpower=0;
function commit(){
	var payMethod=$('#PayMethod input[name="payMethod"]:checked ').val();
	var username=$("#myModal").attr('name');
	$.ajax({
		url: 'changepower.in',
		type: 'POST',
		data: {
			payMethod: payMethod,
			username: username
		},
		success : function(json){
			var data =JSON.parse(json);
			if(data.result=="complete"){
				alert("修改成功");
			}else{
				alert("发生未知错误");
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
	road();
}
function deleteUser(){
	var username=$("#myModal2").attr('name');
	$.ajax({
		url: 'deleteuser.in',
		type: 'POST',
		data: {
			username: username
		},
		success : function(message){
			if(message=="1"){
				alert("删除成功");
				road();
			}else{
				alert("发生未知错误");
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
function assign(count){
	$("#myModal").attr('name',username[count]);
} 
function assignD(count){
	$("#myModal2").attr('name',username[count]);
}
function road(){
	$("#table").html('<tr class="active" id="title"><td id="username">用户名:</td><td id="power"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">地位</button></td><td id="control"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">操作</button></td></tr>');
	$.ajax({
		url: 'getuser.in',
		type: 'POST',
		success: function(json){
			count=0;
			$.each(JSON.parse(json),function(index, ele){
				username[count]=ele.name;
				switch (ele.power) {
					case "总统":
						$("#table #title").after("" +
		"<tr class='danger'>" +
			"<td id='username'>"+ele.name+"</td>" +
			"<td id='power'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>总统</button></td>" +
			"<td id='control'><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2'>删除</button>" +
				"<button class='btn btn-success' data-toggle='modal' data-target='#myModal' onclick='assign("+count+")'>修改</button></td>" +
		"</tr>"
		);
						break;
					case "军阀":
						$("#table").append("" +
		"<tr class='info'>" +
			"<td id='username'>"+ele.name+"</td>" +
			"<td id='power'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>军阀</button></td>" +
			"<td id='control'><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2'>删除</button>" +
				"<button class='btn btn-success' data-toggle='modal' data-target='#myModal' onclick='assign("+count+")'>修改</button></td>" +
	"</tr>"
		);
						break;
					default:
						$("#table").append("" +
		"<tr class='warning'>" +
			"<td id='username'>"+ele.name+"</td>" +
			"<td id='power'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>平民</button></td>" +
			"<td id='control'><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2'>删除</button>" +
				"<button class='btn btn-success' data-toggle='modal' data-target='#myModal' onclick='assign("+count+")'>修改</button></td>" +
	"</tr>"
		);
						break;
				}
				count++;
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

$(document).ready(function() {
	//table
	$.ajax({
			url: 'getuser.in',
			type: 'POST',
			success: function(json){
				count=0
				$.each(JSON.parse(json),function(index, ele){
					username[count]=ele.name;
					switch (ele.power) {
						case "总统":
							$("#table #title").after("" +
			"<tr class='danger'>" +
				"<td id='username'>"+ele.name+"</td>" +
				"<td id='power'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>总统</button></td>" +
				"<td id='control'><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2' onclick='assignD("+count+")'>删除</button>" +
					"<button class='btn btn-success' data-toggle='modal' data-target='#myModal' onclick='assign("+count+")'>修改</button></td>" +
			"</tr>"
			);
							break;
						case "军阀":
							$("#table").append("" +
			"<tr class='info'>" +
				"<td id='username'>"+ele.name+"</td>" +
				"<td id='power'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>军阀</button></td>" +
				"<td id='control'><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2' onclick='assignD("+count+")'>删除</button>" +
					"<button class='btn btn-success' data-toggle='modal' data-target='#myModal' onclick='assign("+count+")'>修改</button></td>" +
		"</tr>"
			);
							break;
						default:
							$("#table").append("" +
			"<tr class='warning'>" +
				"<td id='username'>"+ele.name+"</td>" +
				"<td id='power'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>平民</button></td>" +
				"<td id='control'><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2' onclick='assignD("+count+")'>删除</button>" +
					"<button class='btn btn-success' data-toggle='modal' data-target='#myModal' onclick='assign("+count+")'>修改</button></td>" +
		"</tr>"
			);
							break;
					}
					count++;
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


	//table2
	$.ajax({
			url: 'getpower.in',
			type: 'POST',
			success: function(json){
				powercount=0;
				$.each(JSON.parse(json),function(index, ele){
					powername[countpower]=ele.power;
					switch (ele.power) {
						case "总统":
							$("#table2").append("" +
			"<tr class='danger'>" +
				"<td id='username'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+ele.power+"</button></td>" +
				"<td >" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"修改用户信息"+ele.changeuser+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除动态"+ele.deletedynamic+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除文章"+ele.deleteeassy+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除用户"+ele.deleteuser+"</button>" +
				"</td>" +
				"<td ><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2'>删除</button>" +
					"<button class='btn btn-success' data-toggle='modal' data-target='#myModal4' onclick='assign2("+countpower+")'>修改</button></td>" +
			"</tr>"
			);
							break;
						case "军阀":
							$("#table2").append("" +
			"<tr class='info'>" +
				"<td id='username'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+ele.power+"</button></td>" +
				"<td >" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"修改用户信息"+ele.changeuser+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除动态"+ele.deletedynamic+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除文章"+ele.deleteeassy+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除用户"+ele.deleteuser+"</button>" +
				"</td>" +
				"<td ><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2'>删除</button>" +
					"<button class='btn btn-success' data-toggle='modal' data-target='#myModal4' onclick='assign2("+countpower+")'>修改</button></td>" +
		"</tr>"
			);
							break;
						default:
							$("#table2").append("" +
			"<tr class='warning'>" +
				"<td id='username'><button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>平民</button></td>" +
				"<td >" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"修改用户信息"+ele.changeuser+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除动态"+ele.deletedynamic+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除文章"+ele.deleteeassy+"</button>" +
				"<button class='btn btn-default' data-toggle='modal' data-target='#myModal3'>"+"删除用户"+ele.deleteuser+"</button>" +
				"</td>" +
				"<td ><button class='btn btn-warning' data-toggle='modal' data-target='#myModal2'>删除</button>" +
					"<button class='btn btn-success' data-toggle='modal' data-target='#myModal4' onclick='assign2("+countpower+")'>修改</button></td>" +
		"</tr>"
			);
							break;
					}
					countpower++;
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
	
});
function assign2(count){
	$("#myModal4").attr('name',powername[count]);
} 
function commit2(){
	var power=$("#myModal4").attr('name');
	var changeuser=$("#myModal4 #changeuser input").is(':checked');
	var deletedynamic=$("#myModal4 #deletedynamic input").is(':checked');
	var deleteeassy=$("#myModal4 #deleteeassy input").is(':checked');
	var deleteuser=$("#myModal4 #deleteuser input").is(':checked');
	$.ajax({
		url: 'changepoweritems.in',
		type: 'POST',
		data: {
			power:power,
			changeuser: changeuser,
			deletedynamic: deletedynamic,
			deleteeassy: deleteeassy,
			deleteuser: deleteuser
		},
		success : function(json){
			var data =JSON.parse(json);
			if(data.result=="complete"){
				//alert("修改成功");
			}else{
				//alert("发生未知错误");
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
function OutToPDF(){
	$.ajax({
		url: 'OutToPDF.in',
		type: 'POST',
		success : function(message){
			if(message=="1"){
				//alert("导出成功");
			}else{
				//alert("发生未知错误");
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