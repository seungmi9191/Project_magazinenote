<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/views/includes/head.jsp"></c:import>
</head>

<body>
	<!--Top Nav content-->
	<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
	<!--Top Nav content-->

	<div id="main-block"> 
	<!-- Header section for center the head items add id "top-header-centre" -->
	<c:import url="/WEB-INF/views/includes/top-header.jsp"></c:import>
	<!-- /Header section -->
	
	<div id="login-a">
		<div class="center-content-login">
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	  	<p class="text-center h33"><b>403 error</b></p>
	  	<p class="text-center h33"><font color="red">잘못된 접근입니다.</font></p>
	  	</div>
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
		
</body>
</html>