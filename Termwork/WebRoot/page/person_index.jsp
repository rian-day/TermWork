<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>person_index</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="../css/bootstrap.min.css">
      	<link rel="stylesheet" type="text/css" href="../css/base.css">
		<link rel="stylesheet" type="text/css" href="../css/person_index.css">
</head>
<body>
      <!-- 遮罩层 -->
    <div id="mask-top"></div>
    <div id="mask-bottom"></div>
    <div id="mask-main">
    </div>

    <div id="header">
      <div id="box-left">
        <div id="item1">
          <img src="../img/index/nav.png"><span>MENU</span>
        </div>
      </div>
      <div id="item1"><span class="glyphicon glyphicon-search"></span></div>
      <a href="page/login.html"><div id="item3">REGISTER/LOG IN</div></a>
      <div id="item2"><a href="#"><img src="../img/index/heart-red.png"></a>/ do you like our web?</div>
      <div id="logo">
        Boke
      </div>
    </div>
    <!-- 左侧导航条 -->
    <div id="header-left">
      <div id="head">
        <a href="#">ENGLISH</a><span id="text">close <span class="glyphicon glyphicon-remove"></span></span>
      </div>
      <div id="items"><a href="index.html">Home</a></div>
      <div id="items"><a href="Food.html">Food</a> </div>
      <div id="items"><a href="scene.html">Scenery</a> </div>
      <div id="items"><a href="Policy.html">Policy</a> </div>
      <div id="items"><a href="Black-board.html">Blackborad</a> </div>
      <div id="items">About Us <span class="glyphicon glyphicon-align-right"></span></div>
      <div id="bottom"><img src="img/index/qr_code.png"></div>
      <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
    </div>
<!--   一条华丽丽的分隔线 -->
	<div id="content">
		<div id="user-head">user-head</div>
		<div id="user-info">
			<h3>name <img src="../img/smalllogo/male.png"></h3>
      <span id="tag">火星人</span><br>
			文章数 ：*** <span id="tag-follow">关注</span>
			<div id="kinds-box">
				<a href="#"><div id="kind">HTML</div></a>
				<a href="#"><div id="kind">JSP</div></a>
				<a href="#"><div id="kind">HTML</div></a>
				<a href="#"><div id="kind">JSP</div></a>
				<a href="#"><div id="kind">HTML</div></a>
				<a href="#"><div id="kind">JSP</div></a>
			</div>
		</div>
		<div id="items">
			<div id="easy-name">easy-name <span class="glyphicon glyphicon-leaf">标签</span><span class="glyphicon glyphicon-remove" id="remove"></span></div>
			<div id="easy-box"><p>easy easy easy easy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easy</p></div>
			<div id="easy-foot">
				<ul>
					<li><span class="glyphicon glyphicon-time"></span></li>
					<li><span class="glyphicon glyphicon-comment"></span></li>
					<li><span class="glyphicon glyphicon-heart-empty"></span></li>
				</ul>
			</div>
		</div>
    <div id="items">
      <div id="easy-name">easy-name <span class="glyphicon glyphicon-leaf">标签</span><span class="glyphicon glyphicon-remove" id="remove"></span></div>
      <div id="easy-box"><p>easy easy easy easy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easy</p></div>
      <div id="easy-foot">
        <ul>
          <li><span class="glyphicon glyphicon-time"></span></li>
          <li><span class="glyphicon glyphicon-comment"></span></li>
          <li><span class="glyphicon glyphicon-heart-empty"></span></li>
        </ul>
      </div>
    </div>
    <div id="items">
      <div id="easy-name">easy-name <span class="glyphicon glyphicon-leaf">标签</span><span class="glyphicon glyphicon-remove" id="remove"></span></div>
      <div id="easy-box"><p>easy easy easy easy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easyeasy easy easy</p></div>
      <div id="easy-foot">
        <ul>
          <li><span class="glyphicon glyphicon-time"></span></li>
          <li><span class="glyphicon glyphicon-comment"></span></li>
          <li><span class="glyphicon glyphicon-heart-empty"></span></li>
        </ul>
      </div>
    </div>

		<nav aria-label="...">
        <ul class="pager">
          <li><a href="#">Previous</a></li>
          <li><a href="#">Next</a></li>
        </ul>
      </nav>

	</div>
</body>
</html>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/index-nav.js"></script>
<script type="text/javascript" src="../js/removebutton.js"></script>
