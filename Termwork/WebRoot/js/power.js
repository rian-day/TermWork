var username=new Array([10000]);;
var count=0;
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
			alert(data.result);
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
	alert("delete");
}
function assign(count){
	$("#myModal").attr('name',username[count]);
} 
function road(){
	$("#table").html('<tr class="active" id="title"><td id="username">用户名:</td><td id="power"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">地位</button></td><td id="control"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">操作</button></td></tr>');
	$.ajax({
		url: 'getuser.in',
		type: 'POST',
		success: function(json){
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
	$.ajax({
			url: 'getuser.in',
			type: 'POST',
			success: function(json){
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
	
});