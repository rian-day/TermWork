<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/termwork?useUnicode=true&characterEncoding=utf-8&useSSL=false"
     user="root"  password="hyh1051333460"/>
     <c:choose>
		<c:when test="${empty param.first}">
			<c:set var="first" scope="page" value="0" />
			<c:set var="last" scope="page" value="6" />
		</c:when>
		<c:otherwise>
			<c:set var="first" scope="page" value="${param.first}"></c:set>
			<c:set var="last" scope="page" value="${param.last}"></c:set>
		</c:otherwise>
	</c:choose>
     
     <c:choose>
		<c:when test="${empty param.username}">
		</c:when>
		<c:otherwise>
			<sql:query dataSource="${snapshot}" var="result">
				SELECT * from user
				Where name='<c:out value="${param.username}"/>';
			</sql:query>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty param.username}"></c:when>
		<c:otherwise>
			<sql:query dataSource="${snapshot}" var="eassy">
				SELECT * from eassy
				Where username='<c:out value="${param.username}"/>'
				ORDER BY eassyid DESC
				Limit <c:out value="${first}" />,<c:out value="${last}"/>;
			</sql:query>
		</c:otherwise>
	</c:choose>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>person_index</title>
    
		<link rel="stylesheet" href="css/bootstrap.min.css">
      	<link rel="stylesheet" type="text/css" href="css/base.css">
		<link rel="stylesheet" type="text/css" href="css/person_index.css">
		<link rel="stylesheet" type="text/css" href="css/tip.css">
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
	<c:forEach var="row" items="${result.rows}">
		<div id="content">
			<div id="user-head"><img src="img/img/cat1.jpg" width="100%"> </div>
			<div id="user-info">
				<h3>
				<c:out value="${row.name }"></c:out>
				<c:choose>
					<c:when test="${row.sex!='女'}"><img src="img/smalllogo/male.png"></c:when>
					<c:otherwise><img src="img/smalllogo/female.png"></c:otherwise>
				</c:choose>
				</h3>
	      <span id="tag">火星人</span><br>
				文章数 ：<c:out value="${row.eassynum}"/> <button class="btn btn-default">关注</button>
				<div id="kind-box">
					<a href="#">HTML</a>
					<a href="#">JSP</a>
					<a href="#">HTML</a>
					<a href="#">JSP</a>
					<a href="#">HTML</a>
					<a href="#">JSP</a>
				</div>
			</div>
		<c:forEach var="eassyrow" items="${eassy.rows }">
			<fmt:parseNumber var="count" integerOnly="true" 
                       type="number" value="${count+1}" />
			<div id="items">
				<div id="easy-name">
					<a href='page/eassy.jsp?eassyid=<c:out value="${eassyrow.eassyid}"/>'>
						<b><c:out value="${eassyrow.eassytitle}"></c:out> </b>
					</a> 
					<span class="glyphicon glyphicon-leaf">标签</span>
					<span class="glyphicon glyphicon-remove" id="remove" onclick='deleteeassy(this,<c:out value="${eassyrow.eassyid}"></c:out>)'></span>
				</div>
				<div id="easy-box"> 
					<c:choose>
		            	<c:when test="${fn:length(eassyrow.content)>100}"><c:out value="${fn:substring(eassyrow.content, 0, 100)}" />  ......</c:when>
		            	<c:otherwise><c:out value="${eassyrow.content}" escapeXml="false"></c:out> </c:otherwise>
		            </c:choose>
		        </div>
				<div id="easy-foot">
					<ul>
						<li><span class="glyphicon glyphicon-time"><c:out value="${eassyrow.time}"/></span></li>
						<li><span class="glyphicon glyphicon-comment"></span></li>
						<li><span class="glyphicon glyphicon-heart-empty"><c:out value="${eassyrow.good}"/></span></li>
					</ul>
				</div>
			</div>
		</c:forEach>
	    <!-- <div id="items">
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
	    </div> -->
	
			<nav aria-label="...">
	        	<ul class="pager">
	          		<fmt:parseNumber var="nf" integerOnly="true" 
                       type="number" value="${first+6}" />
                 	<fmt:parseNumber var="nl" integerOnly="true" 
                       type="number" value="${last+6}" />
                    <fmt:parseNumber var="pf" integerOnly="true" 
                       type="number" value="${first-6}" />
                 	<fmt:parseNumber var="pl" integerOnly="true" 
                       type="number" value="${last-6}" />
		          	<c:url var="Previous" value="page/person_index.jsp">
		          		<c:param name="username" value="${param.username}"/>
						<c:param name="first" value="${pf}"/>
						<c:param name="last" value="${pl}"/>
					</c:url>
		            <c:choose>
		            	<c:when test="${first==0}"></c:when>
		            	<c:otherwise><li><a href="<c:out value='${Previous}'/>">Previous</a></li></c:otherwise>
		            </c:choose>
		            <c:url var="Next" value="page/person_index.jsp">
		            	<c:param name="username" value="${param.username}"/>
						<c:param name="first" value="${nf}"/>
						<c:param name="last" value="${nl}"/>
					</c:url>
		            <c:choose>
		            	<c:when test="${count<6}"></c:when>
		            	<c:otherwise><li><a href="<c:out value='${Next}'/>">Next</a></li></c:otherwise>
		            </c:choose>
	        	</ul>
	      	</nav>
	
		</div>
	</c:forEach>
</body>
</html>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index-nav.js"></script>
<script type="text/javascript" src="js/removebutton.js"></script>
<script type="text/javascript" src="js/tip.js"></script>
