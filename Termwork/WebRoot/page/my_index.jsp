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
	<!-- <div id="header">
		<div id="daohang">
			<div id="logo"><h3>My<small>boke</small></h3></div>
			<ul>
				<li>动态广场</li>
				<li>我的主页</li>
				<li>我的博文</li>
				<li>博文广场</li>
			</ul>
			<div id="search"><span class="glyphicon glyphicon-search"></span></div>
		</div>
	</div> -->
  <!-- 遮罩层 -->
    <div id="mask-top"></div>
    <div id="mask-bottom"></div>
    <div id="mask-main">
    </div>

    <div id="header">
      <div id="box-left">
        <div id="item1">
          <img src="img/index/nav.png"><span>MENU</span>
        </div>
      </div>
      <div id="item1"><span class="glyphicon glyphicon-search"></span></div>
      <a href="page/login.html"><div id="item3"><c:choose>
      <c:when test="${sessionScope.username==null }"> LOG IN</c:when>
      <c:otherwise>Hi:<c:out value="${sessionScope.username }"></c:out></c:otherwise>
      </c:choose></div></a>
      <div id="item2"><a href="#"><img src="img/index/heart-red.png"></a>/ do you like our web?</div>
      <div id="logo">
        Boke
      </div>
    </div>
    <!-- 左侧导航条 -->
    <div id="header-left">
      <div id="head">
        <a href="#">Menu</a><span id="text">close <span class="glyphicon glyphicon-remove"></span></span>
      </div>
      <div id="items"><a href="../index.html">Home</a></div>
      <div id="items"><a href="my_index.html">动态广场</a> </div>
      <div id="items"><a href="person_index.html">我的博文</a> </div>
      <div id="items"><a href="index_eassy.html">博文广场</a> </div>
      <div id="items"><a href="#"><span class="glyphicon glyphicon-pencil"></span> 写文章</a> </div>
      <div id="items"><a href="#"><span class="glyphicon glyphicon-comment"></span> 提问题</a> </div>
      <div id="items">About Us <span class="glyphicon glyphicon-align-right"></span></div>
    </div>
<!--   一条华丽丽的分隔线 -->
	<div class="container-fuild" id="content">
		<div class="row" id="body1">
			<div class="col-xs-9">
				<div id="person_info">
					<div class="row">
						<div class="col-xs-2"><img src="../img/img/cat1.jpg"></span></div>
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
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/index-nav.js"></script>
	<script type="text/javascript" src="js/person_index.js"></script>
</body>
</html>