<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://115.159.181.30:3306/termwork?useUnicode=true&characterEncoding=utf-8&useSSL=false"
     user="root"  password="Qcj330616153!"/>
<sql:query var="power" dataSource="${snapshot}">
Select *
From power
where power in (Select power
		From user
		Where name='<c:out value="${sessionScope.username}"/>');
</sql:query>
<c:forEach var="poweritem" items="power.rows">
	<c:choose>
		<c:when test="${poweritem.changeuser=='0'}">
			<c:redirect url="../welcome.jsp"></c:redirect>
		</c:when>
	</c:choose>
</c:forEach>
<sql:query var="resultPower" dataSource="${snapshot}">
	Select *
	From power;
</sql:query>
<html>
  <head>
    

  <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../css/power.css">
</head>
<body>
  <div class="content">
	<div class="OutToPDF-box">
		<button class="btn btn-info" onclick="OutToPDF()">导出User表数据到pdf</button>
    </div>
    <h1>权限管理表<br><small>Made By HYH</small></h1>
    <table class="table table-hover" id="table2">


      <tr class="active" id="title">
        <td id="username">地位名:</td>
        <td id="power"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">权限</button></td>
        <td id="control"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">操作</button></td>
      </tr>

		<c:forEach var="resultPower-items" items="resultPower.rows">
			<c:choose> 
			<c:when test="${resultPower-items.power=='平民'}">
				<tr class="warning">
		            <td id="username"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">平民</button></td>
		            <td>
		              <c:choose>
		              	<c:when test="${resultPower-items.changeuser==1}">
		              		<button class="btn btn-default" data-toggle="modal" data-target="#myModal3">修改用户信息</button>
		              	</c:when>
		              	<c:when test="${resultPower-items.deletedynamic==1}">
		              		 <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除动态</button>
		              	</c:when>
		              	<c:when test="${resultPower-items.deleteeassy==1}">
		              		<button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除文章</button>
		              	</c:when>
		              	<c:when test="${resultPower-items.deleteuser==1}">
		              		<button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除用户</button>
		              	</c:when>
		              </c:choose>
		             
		        
		              
		            </td>
		            <td>
		              <button class="btn btn-warning" data-toggle="modal" data-target="#myModal2">删除</button>
		              <button class="btn btn-success" data-toggle="modal" data-target="#myModal4">修改</button> 
		            </td>
		        </tr>
			</c:when>
			<c:when test="${resultPower-items.power=='军阀'}">
				<tr class="info">
		            <td id="username"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">军阀</button></td>
		            <td>
		              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">修改用户信息</button>
		              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除动态</button>
		              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除文章</button>
		              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除用户</button>
		            </td>
		            <td>
		              <button class="btn btn-warning" data-toggle="modal" data-target="#myModal2">删除</button>
		              <button class="btn btn-success" data-toggle="modal" data-target="#myModal4">修改</button> 
		            </td>
		        </tr>
		        
			</c:when>
			<c:otherwise>
				<tr class="danger">
			        <td id="username"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">总统</button></td>
			        <td id="userpower">
			              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">修改用户信息</button>
			              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除动态</button>
			              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除文章</button>
			              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除用户</button>
			            </td>
			            <td>
			              <button class="btn btn-warning" data-toggle="modal" data-target="#myModal2">删除</button>
			              <button class="btn btn-success" data-toggle="modal" data-target="#myModal4">修改</button> 
			            </td>
			    </tr>
			</c:otherwise>
			</c:choose>
		</c:forEach>
      <!-- <tr class="danger">
        <td id="username"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">总统</button></td>
        <td id="userpower">
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">修改用户信息</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除动态</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除文章</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除用户</button>
            </td>
            <td>
              <button class="btn btn-warning" data-toggle="modal" data-target="#myModal2">删除</button>
              <button class="btn btn-success" data-toggle="modal" data-target="#myModal4">修改</button> 
            </td>
      </tr>

          <tr class="info">
            <td id="username"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">军阀</button></td>
            <td>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">修改用户信息</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除动态</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除文章</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除用户</button>
            </td>
            <td>
              <button class="btn btn-warning" data-toggle="modal" data-target="#myModal2">删除</button>
              <button class="btn btn-success" data-toggle="modal" data-target="#myModal4">修改</button> 
            </td>
          </tr>

          <tr class="warning">
            <td id="username"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">平民</button></td>
            <td>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">修改用户信息</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除动态</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除文章</button>
              <button class="btn btn-default" data-toggle="modal" data-target="#myModal3">删除用户</button>
            </td>
            <td>
              <button class="btn btn-warning" data-toggle="modal" data-target="#myModal2">删除</button>
              <button class="btn btn-success" data-toggle="modal" data-target="#myModal4">修改</button> 
            </td>
          </tr> -->
      
    </table>

    <table class="table table-hover" id="table">
      <tr class="active" id="title">
        <td id="username">用户名:</td>
        <td id="power"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">地位</button></td>
        <td id="control"><button class="btn btn-default" data-toggle="modal" data-target="#myModal3">操作</button></td>
      </tr>
      <!-- <tr>
        <button class='btn btn-success' data-toggle='modal' data-target='#myModal'>修改</button>
      </tr> -->
    </table>
  </div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">权限:</h4>
      </div>
      <div class="modal-body">
        <div class="item-box" id="PayMethod">
          <div class="items" id="master"><span>总统</span> <input name="payMethod" type="radio" value="总统"></div>
          <div class="items" id="controller"><span>军阀</span> <input name="payMethod" type="radio" value="军阀"></div>
          <div class="items" id="people"><span>平民</span> <input name="payMethod" type="radio" value="平民"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-primary" onclick="commit()">确定</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">删除用户:</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="deleteUser()">删除</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <span>...</span>
        </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">权限:</h4>
      </div>
      <div class="modal-body">
        <div class="item-box" id="PayMethod">
          <div class="items" id="changeuser"><span>修改用户信息</span> <input type="checkbox" value="修改用户信息"></div>
          <div class="items" id="deletedynamic"><span>删除动态</span> <input type="checkbox" value="删除动态"></div>
          <div class="items" id="deleteeassy"><span>删除文章</span> <input type="checkbox" value="删除文章"></div>
          <div class="items" id="deleteuser"><span>删除用户</span> <input type="checkbox" value="删除用户"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
        <button type="button" class="btn btn-primary" onclick="commit2()">确定</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/power.js"></script>