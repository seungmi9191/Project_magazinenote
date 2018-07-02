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
		
		
		<div id="publish">
			<div id="publish2">
		    <img src="${pageContext.request.contextPath}/assets/main/img/22.png">
			<div class="col-md-3"></div><button class="btn btn-primary btn-lg btn-half-block" type="button" onclick="location.href='${pageContext.request.contextPath}/publisher/apply/?id=${authUser.id}'">매거진 퍼블리셔 등록하기</button>
		    </div>
	    </div> 
	  </div>
		
	
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
</body>
</html>