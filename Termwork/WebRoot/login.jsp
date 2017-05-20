<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div id="view">
		<div id="box-top">
				<div class="item" id="register">注册</div>
				<div class="item" id="login">登录</div>
			</div>
		<div id="box-left">
			<form name="form1" action="login.do" method="POST">
				<div class="input-group">
					<span class=" input-group-addon">账号</span>
					<input type="text" name="username" class="form-control">
				</div>
				<div class="input-group">
					<span class=" input-group-addon">密码</span>
					<input type="password" name="password" class="form-control">
				</div>
				<input type="submit" name="submit" class="btn btn-success" value="登入" id="in">
				<button id="ln"></button>
			</form>
		</div>
		<div id="box-right">
			<img src="img/index/qr_code2.png"></img>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/login.js"></script>