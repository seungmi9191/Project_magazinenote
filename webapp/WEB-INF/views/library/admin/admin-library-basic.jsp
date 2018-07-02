<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/views/includes/head.jsp"></c:import>
</head>
<body class="single with-sidebar">
	<!--Top Nav content-->
	<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
	<!--Top Nav content-->

	<div id="main-block"> 
	<!-- Header section for center the head items add id "top-header-centre" -->
	<c:import url="/WEB-INF/views/includes/top-library-header.jsp"></c:import>
	<!-- /Header section --> 
	
	<div class="entry-header_title2">
			<!-- Introduction -->
			<section class="container ">
				<div class="spotlight2">
					<div class="major">
						<h2>내 서재 설정</h2>
						<p><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic"><b class="b">기본설정</b> </a> &nbsp; | &nbsp; 
						<a href="${pageContext.request.contextPath}/${authUser.id}/admin/cate"> 카테고리관리 </a> &nbsp; | &nbsp; 
						<a href="${pageContext.request.contextPath}/${authUser.id}/admin/write"> 글 작성 </a></p>
					</div>
				</div>
			</section>
				</div>
				
			<div id="join-a-b">
			<div id="setting">
			 	<div class="center-content-setting">
			 	<form name="basicSetting" action="${pageContext.request.contextPath}/${blogVo.id}/admin/basicModify" method="POST" enctype="multipart/form-data">
			 	<div class="form-group admin-config">
			 		<div class="col-md-3"></div>
			 		<c:if test="${blogVo.logoFile eq 'blog_logo.jpg'}">
						<img src="${pageContext.request.contextPath}/assets/main/img/profile/blog_logo.jpg" >
					</c:if>
					<c:if test="${blogVo.logoFile ne 'blog_logo.jpg'}">
						<img src="${pageContext.request.contextPath}/upload/${blogVo.logoFile}" >
					</c:if><br/><br/>
					<div class="col-md-2"></div><input type="file" name="file"><br/>
			 		<div class="col-md-2"></div><label for="logoFile">프로필 사진 (정사각형 600 X 600 이상의 사진)</label><br/>
			 	</div>
			 	
			 	<div class="form-group admin-config">
			 		<label for="blogTitle">서재이름</label><br/>
			 		<input type="text" class="form-control" name="blogTitle" id="blogTitle" value="${blogVo.blogTitle}">
			 	</div>	
			 	
			 	<div class="form-group admin-config">
			 		<label for="name">퍼블리셔이름</label><br/>
			 		<input type="text" class="form-control" name="name" id="name" value="${blogVo.name}">
			 	</div>
			 	
			 	<div class="form-group admin-config">
			 		<label for="explanation">서재소개</label><br/>
			 		<input type="text" class="form-control" name="explanation" id="explanation" value="${blogVo.explanation}">
			 	</div>	
			 	<div class="form-group admin-config">
			 		<input type="hidden" class="form-control" name="userNo" value="${blogVo.userNo}">
			 	</div>	
			 	<div class="row row"></div><br/>
		      		<input type="submit" id="btn-submit" class="btn btn-success" value="서재정보수정">	
			 	
			 	</form>
			 	</div>	
			 	</div>
			</div>
			
			

	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	</body>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	

</html>