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
     
     
<sql:query dataSource="${snapshot}" var="result">
SELECT * from eassy
ORDER BY eassyid DESC
Limit 0,10;
</sql:query>
<c:choose>
	<c:when test="${empty sessionScope.username}"></c:when>
	<c:otherwise>
		<sql:query var="power" dataSource="${snapshot}">
			SELECT * 
			From power
			Where power in
			(
				Select power
				From user
				Where name='<c:out value="${sessionScope.username}"/>'
			);
		</sql:query>
	</c:otherwise>
</c:choose>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inde_eassy.jsp' starting page</title>
    
		<link rel="stylesheet" href="css/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="css/base.css">
		<link rel="stylesheet" type="text/css" href="css/index_eassy.css">
		<link rel="stylesheet" href="css/tip.css">
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
    <a href="index.jsp"><div id="items">Home <span class="glyphicon glyphicon-map-marker"></span></div></a>
    <a href="Food.html"><div id="items">我的主页 <span class="glyphicon glyphicon-fire"></span></div></a>
    <a href="scene.html"><div id="items">博文广场 <span class="glyphicon glyphicon-leaf"></span></div></a>
    <a href="Policy.html"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
    <a href="page/write/index.html"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
    <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
  </div>

  <!-- __________________一条华丽丽的分隔线__________________-->
	<div id="content">
    <div id="box-top">
      
    </div>
		<div id="box-left">
      <div id="lunbo" class="items">
              <div id="myCarousel" class="carousel slide">
                  <!-- 轮播（Carousel）指标 -->
                  <ol class="carousel-indicators">
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#myCarousel" data-slide-to="1"></li>
                      <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>   
                  <!-- 轮播（Carousel）项目 -->
                  <div class="carousel-inner">
                      <div class="item active">
                          <img src="img/img/1.jpg" alt="First slide">
                          <div class="carousel-caption">标题 1</div>
                      </div>
                      <div class="item">
                          <img src="img/img/2.jpg" alt="Second slide">
                          <div class="carousel-caption">标题 2</div>
                      </div>
                      <div class="item">
                          <img src="img/img/3.jpg" alt="Third slide">
                          <div class="carousel-caption">标题 3</div>
                      </div>
                  </div>
                  <!-- 轮播（Carousel）导航 -->
                  <a class="carousel-control left" href="#myCarousel" 
                      data-slide="prev">&lsaquo;
                  </a>
                  <a class="carousel-control right" href="#myCarousel" 
                      data-slide="next">&rsaquo;
                  </a>
          </div>
      </div>

      <div class="items" id="nav">
        <div id="public">最新更新</div>
        <div id="person">我的关注</div>
      </div>
			<div class="items" id="eassy-box">
				<c:forEach var="row" items="${result.rows}">
			 	<div id="eassy">
			 		<c:choose>
	    				<c:when test="${empty power}"></c:when>
						<c:otherwise>
							<c:forEach var="powerrows" items="${power.rows}">
								<c:if test="${powerrows.deleteeassy == 1}">
		    						<div class="toolbar"><span class="glyphicon glyphicon-remove" onclick='deleteeassy(this,<c:out value="${row.eassyid}"></c:out>)'></span></div>
		    					</c:if>
							</c:forEach>
						</c:otherwise>
	    			</c:choose>
	          		<div id="person-info">
		            	<div id="person-head">
		            	</div>
		            	<c:out value="${row.username }"></c:out>
	          		</div>
	          <div id="person-content">
	            <div id="eassy-name"><c:out value="${row.eassytitle }"></c:out></div>
	              	<div id="eassy-content">
						<c:choose>
		            		<c:when test="${fn:length(row.content)>80}"><c:out value="${fn:substring(row.content, 0, 80)}" />  ......</c:when>
		            		<c:otherwise><c:out value="${row.content}" escapeXml="false"></c:out> </c:otherwise>
		            	</c:choose>
					</div>
	              <div id="eassy-foot">
	                <ul>
	                  <li><span class="glyphicon glyphicon-time"><c:out value="${row.time }"></c:out></span></li>
	                  <li><span class="glyphicon glyphicon-comment"></span></li>
	                  <li><span class="glyphicon glyphicon-heart-empty"><c:out value="${row.good }"></c:out> </span></li>
	                </ul>
	              </div>
	          </div>
	        </div>
		</c:forEach>
      	

      </div>
    </div>

    <div id="box-right">
      <div id="type-box" class="items">
        <div id="type">
          生活
        </div>
        <div id="type">
          科技
        </div>
        <div id="type">
          娱乐
        </div>
        <div id="type">
          游戏
        </div>
      </div>
      	<div id="person-box">
	        <div id="person-rec">
	          <div id="person-head"><img src="img/img/cat1.jpg"> </div>
	          <div id="person-name">何宇亨</div>
	          <div id="person-tag"><span class="label label-info">13213</span></div>
	        </div>
	    </div>
    </div>

	</div>
</body>
</html>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index-nav.js"></script>
<script type="text/javascript" src="js/index_eassy.js"></script>
<script type="text/javascript" src="js/tip.js"></script>