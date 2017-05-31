<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/termwork?useUnicode=true&characterEncoding=utf-8&useSSL=false"
     user="root"  password="hyh1051333460"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'eassy.jsp' starting page</title>
    
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" type="text/css" href="css/eassy.css">
</head>
<body>
	<c:choose>
		<c:when test="${empty param.eassyid}">
		</c:when>
		<c:otherwise>
			<sql:query dataSource="${snapshot}" var="result">
				SELECT * from eassy
				Where eassyid='<c:out value="${param.eassyid}"/>';
			</sql:query>
		</c:otherwise>
	</c:choose>
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
    <div id="login-box">
		<c:choose>
    		<c:when test="${sessionScope.username==null }"><a href="page/login.html"><div id="item3">Login</div></a></c:when>
    		<c:when test="${sessionScope.username!=null }"><a href="page/my_index.jsp"><div id="item3">Hi:<c:out value="${sessionScope.username }"></c:out></div></a></c:when>
    	</c:choose> 
	</div>
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
    <a href="index.jsp"><div id="items">Home <span class="glyphicon glyphicon-map-marker"></span></div></a>
    <a href="Food.html"><div id="items">我的主页 <span class="glyphicon glyphicon-fire"></span></div></a>
    <a href="scene.html"><div id="items">博文广场 <span class="glyphicon glyphicon-leaf"></span></div></a>
    <a href="Policy.html"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
    <a href="page/write/index.html"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
    <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
  </div>

  <!-- __________________一条华丽丽的分隔线__________________-->
	   <div id="body1">
        <div id="top">一些顶部</div>
        <div id="content">
       		<c:forEach var="row" items="${result.rows}">
          		<div id="user-info">
	           		 <a href='page/person_index.jsp?username=<c:out value="${row.username}"/>'><div id="user-head" margin="auto"><img src="img/img/cat1.jpg" width="80%"></div></a> 
	            	<br><c:out value="${row.username}"/>
	            	<br>tag
          		</div>
          		<div id="eassy-content">
            		<div id="title"><h1><c:out value="${row.eassytitle}"></c:out> </h1></div>
            		<c:out value="${row.content}" escapeXml="false"></c:out>
          		</div>
          </c:forEach>
        </div>
     </div>
</body>
</html>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index-nav.js"></script>