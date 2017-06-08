<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://115.159.181.30:3306/termwork?useUnicode=true&characterEncoding=utf-8&useSSL=false"
     user="root"  password="Qcj330616153!"/>
<sql:query dataSource="${snapshot}" var="result">
SELECT * 
from follow
Where username = '<c:out value="${sessionScope.username}"></c:out>'
ORDER BY followid;
</sql:query>
<html>
  <head>
    
    <title>follow.jsp</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/base.css">
	<link rel="stylesheet" type="text/css" href="../css/follow.css">
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
        <img src="../img/img/index/nav.png"><span>MENU</span>
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
	<a href="login.html"><div id="item3">REGISTER/LOG IN</div></a>
    <div id="logo">
      <img src="../img/logo/logo.png">
    </div>
  </div>

  <div id="header-static">
    <div id="logo">Boke</div>
    <div id="menu-box">Menu</div>
    <div id="login-box"><a href="login.html">Login</a></div>
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
    <a href="../index.html"><div id="items">Home <span class="glyphicon glyphicon-map-marker"></span></div></a>
    <a href="my_index.html"><div id="items">我的主页 <span class="glyphicon glyphicon-fire"></span></div></a>
    <a href="index_eassy.html"><div id="items">博文广场 <span class="glyphicon glyphicon-leaf"></span></div></a>
    <a href="#"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
    <a href="write/index.html"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
    <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
  </div>

  <!-- __________________一条华丽丽的分隔线__________________-->
  <div class="body">
    <div class="content">
      <div class="title">我关注的人</div>
      <c:forEach var="row" items="${result.rows}">
      	<div class="items">
	        <a href="person_index.jsp?username=<c:out value='${row.followername}'></c:out>"><img src="../img/img/cat1.jpg"></a>
	        <div class="person-info"><c:out value="${row.followername}"></c:out>
	        <div class="button-box">
	          <div id="button">
	              <div id="line-top"></div>
	              <div id="line-left"></div>
	              <div id="line-right"></div>
	              <div id="line-bottom"></div>
	              取消关注
	          </div>
	        </div>
	        </div>
	      </div>
      </c:forEach>
      

      <!-- <div class="items">
        <img src="../img/img/cat1.jpg">
        <div class="person-info">heyuheng
        <div class="button-box">
          <div id="button">
              <div id="line-top"></div>
              <div id="line-left"></div>
              <div id="line-right"></div>
              <div id="line-bottom"></div>
              取消关注
          </div>
        </div>
        </div>
      </div>

      <div class="items">
        <img src="../img/img/cat1.jpg">
        <div class="person-info">heyuheng
        <div class="button-box">
          <div id="button">
              <div id="line-top"></div>
              <div id="line-left"></div>
              <div id="line-right"></div>
              <div id="line-bottom"></div>
              取消关注
          </div>
        </div>
        </div>
      </div>
      
      <div class="items">
        <img src="../img/img/cat1.jpg">
        <div class="person-info">heyuheng
        <div class="button-box">
          <div id="button">
              <div id="line-top"></div>
              <div id="line-left"></div>
              <div id="line-right"></div>
              <div id="line-bottom"></div>
              取消关注
          </div>
        </div>
        </div>
      </div>
      <div class="items">
        <img src="../img/img/cat1.jpg">
        <div class="person-info">heyuheng
        <div class="button-box">
          <div id="button">
              <div id="line-top"></div>
              <div id="line-left"></div>
              <div id="line-right"></div>
              <div id="line-bottom"></div>
              取消关注
          </div>
        </div>
        </div>
      </div>
      <div class="items">
        <img src="../img/img/cat1.jpg">
        <div class="person-info">heyuheng
        <div class="button-box">
          <div id="button">
              <div id="line-top"></div>
              <div id="line-left"></div>
              <div id="line-right"></div>
              <div id="line-bottom"></div>
              取消关注
          </div>
        </div>
        </div>
      </div> -->
	
    </div>
  </div>
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
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/index-nav.js"></script>