<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    This is my JSP page. <br>
    <button id="ajax">1</button>
    <c:forEach var="i" begin="1" end="5">
    item<c:out value="${i }"></c:out>
    </c:forEach>
    <div></div>
  </body>

  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function() {
  		var j= {username: 'HEYUHENG',password:'HYH123'};
		$("#ajax").click(function(event) {
			/* Act on the event */
			$.ajax({
				url: 'login.do',
				type: 'POST',
				data: {username: 'HEYUHENG',password:'HYH123'},
				success : function(data){
					alert(data.username);
					alert(data.password);
				}
			})
			.done(function() {
				console.log("success");
			})
			.fail(function() {
				console.log("error");
			})
			.always(function() {
				console.log("complete");
			});
		});
		
		/*$.post(
			"abc",
			{username: 'HEYUHENG',password:'HYH123'},
			function(data){
				console.log(data)
			}
		)*/
	});
  </script>
</html>
