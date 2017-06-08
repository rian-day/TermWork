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
     url="jdbc:mysql://115.159.181.30:3306/termwork?useUnicode=true&characterEncoding=utf-8&useSSL=false"
     user="root"  password="Qcj330616153!"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'eassy.jsp' starting page</title>
    
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" type="text/css" href="css/eassy.css">
    <link rel="stylesheet" type="text/css" href="css/tip.css">
</head>
<body>
	<c:choose>
		<c:when test="${empty param.eassyid}">
		</c:when>
		<c:otherwise>
			<sql:query dataSource="${snapshot }" var="result">
				SELECT * from eassy
				Where eassyid='<c:out value="${param.eassyid}"/>';
			</sql:query>
		</c:otherwise>
	</c:choose>
	<sql:query dataSource="${snapshot}" var="comment">
				SELECT * from eassycomment
				Where eassyid='<c:out value="${param.eassyid}"/>';
	</sql:query>
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
    <a href="#"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
    <a href="page/write/index.html"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
    <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
  </div>

  <!-- __________________一条华丽丽的分隔线__________________-->
  <c:forEach var="row" items="${result.rows}">
	<div id="body1">
        <div id="top">一些顶部</div>
        	<div id="content">
       		
          		<div id="user-info">
	           		 <a href='page/person_index.jsp?username=<c:out value="${row.username}"/>'><div id="user-head" margin="auto"><img src="img/img/cat1.jpg" width="80%"></div></a> 
	            	<br><c:out value="${row.username}"/>
	            	<br>tag
          		</div>
          		<div id="eassy-content">
            		<div id="title">
	            		<h1>
	            			<c:out value="${row.eassytitle}"></c:out> 
	            		</h1>
            		</div>
            		<c:out value="${row.content}" escapeXml="false"></c:out>
	     			<div class="bottom">
	                  <div class="box">
	                    <div class="left">顶<c:out value="${row.good}"/></div>
	                    <div class="right">踩</div>
	                  </div>
	                  <div class="comment-bar">
	                 		 评论区<span class="glyphicon glyphicon-chevron-down"></span>
	                  </div>
	                  	<div class="comment-box">
						  	<c:choose>
							  	<c:when test="${empty comment}">
							  		暂无人评论~~~~
							  	</c:when>
							  	<c:otherwise>
							  		<c:forEach var="commentrow" items="${comment.rows}">
					                  <div class="items">
					                    <div class="box-left">
					                      <img src="img/img/cat1.jpg">
					                      <c:out value="${commentrow.username}"></c:out>
					                    </div>
					                    <div class="box-right">
					                      <div class="toolbar-box">
					                        <div class="toolbar btn btn-default">
					                          <div class="btn-group">
					                            <span class="glyphicon glyphicon-menu-down" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></span>
					                              <ul class="dropdown-menu dropdown-menu-right">
					                                <li>举报</li>
					                                <li role="separator" class="divider"></li>
					                                <li>删除</li>
					                              </ul>
					                            </div>
					                        </div>
					                      </div>
					                      <div class="comment-content">
					                        <c:out value="${commentrow.content}"></c:out>
					                      </div>
					                      <div class="bottom-bar">
					                      	<span class="glyphicon glyphicon-time"></span> <c:out value="${commentrow.time }"></c:out>
					                      </div>
					                    </div>
					                  </div>
					                 </c:forEach>
							  	</c:otherwise>
						  	</c:choose>
						  <div class="add-comment">
		                    <div class="title">添加评论</div>
		                    <textarea id="commentcontent"></textarea>
		                    <button class="btn btn-success" onclick="addcommit('<c:out value='${sessionScope.username}'></c:out>',<c:out value='${row.eassyid}'></c:out>)">提交</button>
		                  </div>
	                  	</div>
	                </div>
            	</div>
            </div>
		</div>
     </c:forEach>
     <div class="foot">
       <div class="content">
         <div class="box-top">
           <ul>
             <li>公司简介</li>
             <li>招贤纳士</li>
             <li>广告服务</li>
             <li>联系方式</li>
             <li>版权声明</li>
             <li>法律顾问</li>
             <li>问题报告</li>
             <li>论坛反馈</li>
             <li>合作伙伴</li>
           </ul>
         </div>
         <div class="box-bottom">
           <ul>
             <li><img src="../img/smalllogo/qq.png" style="height: 20px;"> 网站客服</li>
             <li><img src="../img/smalllogo/qq.png" style="height: 20px;"> 杂志客服</li>
             <li>微博客服</li>
             <li>1051333460@qq.com</li>
             <li>400***</li>
           </ul>
         </div>
       </div>
     </div>
</body>
</html>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tip.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/index-nav.js"></script>
<script type="text/javascript" src="js/eassy.js"></script>
