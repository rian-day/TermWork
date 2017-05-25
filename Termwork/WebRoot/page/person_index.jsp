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
  <!-- <div id="tip">wrong</div> -->
  <div id="mask-top"></div>
  <div id="mask-bottom"></div>
  <div id="mask-main">
    
  </div>
  <!-- 第二个版本 -->
  <div id="header">
    <div id="box-left">
      <div id="item1">
        <img src="img/img/index/nav.png"><span>MENU</span>
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
      <img src="img/logo/logo.png">
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
    <a href="index.html"><div id="items">Home <span class="glyphicon glyphicon-map-marker"></span></div></a>
    <a href="Food.html"><div id="items">Food <span class="glyphicon glyphicon-fire"></span></div></a>
    <a href="scene.html"><div id="items">Scenery <span class="glyphicon glyphicon-leaf"></span></div></a>
    <a href="Policy.html"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
    <a href="Black-board.html"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
    <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
  </div>

  <!-- __________________一条华丽丽的分隔线__________________-->
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
