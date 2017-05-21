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
    
    <title>index</title>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="css/base.css">
      <link rel="stylesheet" type="text/css" href="css/index.css">
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
        <img src="img/img/index/nav.png" th:src="@{http://optpqehds.bkt.clouddn.com/bc/images/navbar/nav.png}"><span>MENU</span>
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
    <a href="index.html" th:href="@{/}"><div id="items">Home <span class="glyphicon glyphicon-map-marker"></span></div></a>
    <a href="Food.html" th:href="@{/food}"><div id="items">Food <span class="glyphicon glyphicon-fire"></span></div></a>
    <a href="scene.html" th:href="@{/scene}"><div id="items">Scenery <span class="glyphicon glyphicon-leaf"></span></div></a>
    <a href="Policy.html" th:href="@{/policy}"><div id="items">提问 <span class="glyphicon glyphicon-comment"></span></div></a>
    <a href="Black-board.html" th:href="@{/blackboard?pageNum=1}"><div id="items">写文章 <span class="glyphicon glyphicon-edit"></span></div></a>
    <div id="change">Did your eye tired ?<span class="glyphicon glyphicon-off"></span><!-- 此处点击后整个网页变成护眼模式 --></div>
  </div>

  <!-- __________________一条华丽丽的分隔线__________________-->
    <div id="view-back"></div>
    <div id="view">
      <div id="content">
        <h1>Hi! Welcome To My Page<br><small>Contributor: HYH</small></h1>
        <div class="input-group" id="search">
          <input type="text" name="" class="form-control" placeholder="Find Something" id="search-content">
          <span class="input-group-addon" id="img-box" onclick="search()"><span class="glyphicon glyphicon-search" id="img"></span></span>
        </div>
        <h3><small>Email: 1051333460@qq.com</small></h3>
      </div>
    </div>

    <div id="body1" class="container-fluid">
          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/6.jpg">
            <h4><a href="#"><b>不仅仅是写代码，而是完成作品 </b></a></h4>
            <p>近来有人问起，现在似乎真得变成了码农，日出而作，日落而息。整天不停的写代码，开发业务需求，周而复始，日子长了，感到厌倦。有时回想，应该在过去的某个时期我也曾陷入过这样的循环中，后来又是如何脱离的呢？</p>

            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>
          

          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/2.jpg">
            <p><b>乐乎印品·手机壳定制   上线啦！</b></p>
            <p>定制你的日常私物，从手机壳开始。</p>
            <p>上新体验价 ￥38</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>
          
          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/1.jpg">
            <p>礼物，承载着祝福与爱意，在人生的重要时刻，为你镌刻最温暖的时光。而每一个此时此刻——眼前，大自然和煦的春意；身边，爱人暖暖的怀抱；手中，冬日里的一杯热茶……皆是时光赋予的，最好的礼物。</p>
            <p>开年之际,与大家一起分享“最OMEGA的礼物“：Ω是希腊文最后一个字母，象征卓越与完美。秒针敲打着丁酉年的旋律，分针轻踏着春天的气息，时针共享快乐和甜蜜。快来分享你最有爱的礼物吧！</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>
          

          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/1.png">
            <img src="img/img/2.png">
            <p><b>Android 7.1.1 之实现 3D Touch </b></p>
            <p>Shortcut 是Android-25（Android 7.1）新增的一项类似iOS的 3D Touch 功能的快捷方式组件，但是有着不同的表现形式，因为Android在硬件上不支持触摸压力感应，所以表现形式为长按，而iOS须用力长按。</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>

          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/4.jpg">
            <p><b>「福利市集」第一位电商合伙人，金浩森。</b></p>
            <p>他，内心居住着一位少年。看他拍的照片，仿佛脑海中那段青春记忆，被生动地展现在眼前。</p>
            <p>“高颜值摄影师”金浩森笑称自己是“老腊肉金十八”，对他来说，拍照做甜品煮咖啡下厨房“那都不是事儿”，如此会生活的可人儿，必须是LOFTER福利市集的第一位电商合伙人。</p>
            <p>这一次，他带来了笔记本&明信片，在福利市集，用最诚意的价格发售。</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>
          
          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <p><b>创建后台任务的两种代码模式</b></p>
            <p>后台任务是每个App都需要的一些行为，毕竟主线程是大爷，拖不起，伤不起，脏活累活都只能在不见天日的后台去做。
最简单的后台任务，可以说是直接开一个线程就可以了，或者说来个Service，再开个线程。但这些并不是官方认证的最佳实践，实际上，Google早就考虑到了这一点，并把这些需求进行了封装，给我们提供了非常好的后台任务解决方案，并在Training上进行了讲解：</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>
          
          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/3.jpg">
            <p><b>最美中秋月生活好物大推荐</b></p>
            <p>好物几时有？把酒问今天。值此佳节，福利市集、乐乎印品联袂为大家诚挚推荐9组生活好物。中秋期间，满赠满赠满就赠！每笔订单满60元就送19元乐乎印品手机壳优惠券！</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>

          <div id="essay_box" class="col-md-6 col-lg-4 col-xs-6">
            <img src="img/img/5.jpg">
              <p><b>来南京，听讲座，再许个新年愿望吧~</b></p>
              <p>一起旅行:</p>
              <p>《南京线下沙龙 | 旅行摄影师镜头中的世界》，12月31日，听叽喳姐来讲述她镜头里的世界，然后许一个环球旅行的愿望，或许这便是跨年的最佳姿势。</p>
            <div id="link_box">
              <span class="glyphicon glyphicon-time">&nbsp;2017-4-5</span>
              <span class="glyphicon glyphicon-edit">&nbsp;0</span>
              <span class="glyphicon glyphicon-heart-empty">&nbsp;0</span>
            </div>
          </div>

      <div class="col-xs-12">
        <div class="page-change">
          <ul class="pager">
            <li><a href="#">Previous</a></li>
            <li><a href="#">Next</a></li>
          </ul>
        </div>
      </div>

    </div>
   </body>
</html>
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/index-nav.js"></script>
      <script type="text/javascript" src="js/search.js"></script>