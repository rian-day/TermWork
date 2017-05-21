<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <script type="text/javascript">
	</script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<title>我的主页</title>
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/my_index.css">
</head>
<body>
<!-- 遮罩层 -->
	<!-- <div id="tip">wrong</div> -->
	<div id="mask-top"></div>
	<div id="mask-bottom"></div>
	<div id="mask-main">
		
	</div>
	<!-- 第一个版本 -->
	<!-- <div id="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-6" id="h1-box"><h1>HEAD|<small>COUNTRY-SIDE</small></h1></div>
					<div class="col-xs-2" id="nav-first"><img src="img/index/nav.png"></div>
					<div class="col-xs-2" id="nav-second">
					<a href="#"><img src="img/index/heart-red.png"></a>
					</div>
					<div class="col-xs-2" id="nav-third"><img src="img/index/person.png"></div>
			</div>
		</div>
	</div> -->
	<!-- 第二个版本 -->
	<div id="header">
		<div id="box-left">
			<div id="item1">
				<img src="../img/img/index/nav.png" th:src="@{http://optpqehds.bkt.clouddn.com/bc/images/navbar/nav.png}"><span>MENU</span>
			</div>
		</div>
		<div id="box-right">
			<input type="text" name="" placeholder="Search Someting" id="text"><button id="do" class="glyphicon glyphicon-search"></button>
			<div class="search-items">
				<ul>
					<!-- 此处添加搜索列表 -->
					
					
				</ul>
			</div>
		</div>
		<div id="item4"><span class="glyphicon glyphicon-search"></span></div>
    <c:choose>
    	<c:when test="${sessionScope.username==null }"><a href="page/login.html"><div id="item3">REGISTER/LOG IN</div></a></c:when>
    	<c:when test="${sessionScope.username!=null }"><a href="page/my_index.jsp"><div id="item3">Hi:<c:out value="${sessionScope.username }"></c:out></div></a></c:when>
    </c:choose> 
		<div id="logo">
			<img src="../img/logo/logo.png">
		</div>
	</div>

	<div id="header-static">
		<div id="logo">Boke</div>
		<div id="menu-box">Menu</div>
		<div id="login-box"><a href="#">Login</a></div>
		<div id="search-box">
			<div id="search">
				<span class="glyphicon glyphicon-search"></span><input type="text" name="search" class="form-control" placeholder="search">
			</div>
		</div>
	</div>
	<!-- 左侧导航条 -->
	<div id="header-left">
		<div id="head">
			<a href="#">ENGLISH</a><span id="text">close <span class="glyphicon glyphicon-remove"></span></span>
		</div>
		<a href="index.html" th:href="@{/}"><div id="items">Home <span class="glyphicon glyphicon-map-marker"></span></div></a>
		<a href="Food.html" th:href="@{/food}"><div id="items">Food <span class="glyphicon glyphicon-fire"></span></div></a>
		<a href="scene.html" th:href="@{/scene}"><div id="items">Scenery <span class="glyphicon glyphicon-leaf"></span></div></a>
		<a href="Policy.html" th:href="@{/policy}"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
		<a href="Black-board.html" th:href="@{/blackboard?pageNum=1}"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
		<div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
	</div>

	<!-- __________________一条华丽丽的分隔线__________________-->
	<div class="body">
		<div class="container-fuild" id="content">
			<div class="row" id="body1">
				<div class="col-xs-9">
					<div id="person_info">
						<div class="row">
							<div class="col-xs-2"><img src="img/img/cat1.jpg"></span></div>
							<div class="col-xs-2"><span class="glyphicon glyphicon-font" id="text"></span></div>
							<div class="col-xs-2"><span class="glyphicon glyphicon-text-width" ></span></div>
							<div class="col-xs-2"><span class="glyphicon glyphicon-facetime-video" ></span></div>
							<div class="col-xs-2"><span class="glyphicon glyphicon-headphones" ></span></div>
							<div class="col-xs-2"><span class="glyphicon glyphicon-eye-open" ></span></div>
						</div>
						<div class="row">
							<div id="input-box">
								<textarea></textarea>
								<div id="box-bottom">
									<button class="btn btn-success">发布</button>
									<button class="btn btn-default">表情</button>
								</div>
							</div>
						</div>
					</div>
	
					<div class="goods">
						<div class="row">
							<div class="col-xs-2">
								<div id="user-head"></div>
							</div>
							<div class="col-xs-10">
								<div id="details">
									<!-- Single button -->
									<div class="btn-group">
									  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
									  <div class="glyphicon glyphicon-chevron-down"></div>
									  </button>
									  <ul class="dropdown-menu dropdown-menu-right">
									    <li><a href="#">删除</a></li>
									  </ul>
									</div>
								</div>
								<div id="content">
									
								</div>
								<div id="bottom">
									<ul>
										<li><span class="glyphicon glyphicon-tag"></span> 1 2 3</li>
										<li>热度</li>
										<li>评论</li>
										<li>分享</li>
										<li>推荐</li>
										<li><span class="glyphicon glyphicon-heart"></span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-3">
					<div id="nav">
						<ul>
	<!-- 						<li id="items">
								username
								<div class="dropdown">
								  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" 	aria-haspopup="true" aria-expanded="true">
								    <span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1" id="">
								    <li class="dropdown-header">dropdown</li>
								    <li><a href="#">Something else here</a></li>
								    <li role="separator" class="divider"></li>
								    <li><a href="#">Separated link</a></li>
								  </ul>
								</div>
							</li> -->
							<li id="items">我的文章</li>
							<li id="items">关注</li>
							<li id="items">通知</li>
							<li id="items">私信</li>
							<li id="items">个人信息设置</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index-nav.js"></script>
<script type="text/javascript" src="js/person_index.js"></script>