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
		
		<section class="portfolio-content">
			<div class="container">
			<div class="row2">
			<div class="col-md-10 col-md-offset-1">
				<h3 class="text-center h33">이 서재가 관심을 갖고있는 <font color="DimGrey"><b>13명</b></font></h3>
				<br/><br/>
         		
         		<table>
         			 <thead>
         			<tr>
         				<th>서재명</th>
         				<th>매거진 퍼블리셔명</th>
         				<th>서재설명</th>
         				<th></th>
         			</tr>
         			</thead>
         			<tbody>
         			<tr class="text-center">
         				<td><b>자유공간</b></td>
         				<td>자유공간</td>
         				<td>자유공간 설명입니다.</td>
         				<td><button type="button" class="btn btn-primary btn-xs" onclick="location.href='#'">관심메이트 해지</button></td>
         			</tr>
         			</tbody>
         		</table>
			</div>
			</div>
			</div>
		
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		</div>
		<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>		
</body>
</html>