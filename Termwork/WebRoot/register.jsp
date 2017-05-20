<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	<div id="view">
		<div id="box-top">
				<div class="item" id="register">注册</div>
				<div class="item" id="login">登录</div>
			</div>
		<div id="box-left">
			<form action="register.do" method="POST" name="form">
				<div class="input-group">
					<span class=" input-group-addon">用户名</span>
					<input type="text" name="username" class="form-control">
				</div>
				<div class="input-group">
					<span class=" input-group-addon">邮箱</span>
					<input type="text" name="email" class="form-control">
				</div>
				<div class="input-group">
					<span class=" input-group-addon">密码</span>
					<input type="password" name="password" class="form-control">
				</div>
				<div class="input-group">
					<span class=" input-group-addon">确认密码</span>
					<input type="password" name="password-confirm" class="form-control">
				</div>
				<input type="submit" name="submit" 登入 class="btn btn-success" value="注册" id="in">
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
