<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<!-- <nav>
		<ul>
			<li>
				<div class="input-group">
		        <input class="form-control" type="text"/>
		        <span class="input-group-btn">
		        <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>&nbsp;
		        </span></div>
			</li>
		
		</ul>
	</nav> -->
	<hr>
		<c:choose>
			<c:when test="${authUser eq null}">
			<nav>
				<ul>
				<li><span class="company-name"><a href="${pageContext.request.contextPath}/user/login">로그인</a></span></li>
				</ul>
			</nav>
			<hr>
			<!-- <ul class="other-nav">
				<li><a href="#">매거진노트 소개</a></li>
				<li><a href="#">고객센터</a></li>
			</ul> -->
			</c:when>
			
			<c:otherwise>
			<nav>
		<ul>
			<c:if test="${authUser.authority eq 'ROLE_USER' || authUser.authority eq 'ROLE_PUBLISHER'}">
			<li><span class="company-name">${authUser.name}님</span></li>
			<li><!-- <a href="${pageContext.request.contextPath}/storage/pubstorage">관심메이트 <i class="fa fa-heartbeat"></i></a></li>-->
				<c:if test="${authUser.authority eq 'ROLE_USER'}">
				<li><a href="${pageContext.request.contextPath}/publisher/">매거진 퍼블리셔 등록</a></li>
				</c:if>
				
				<c:if test="${authUser.authority eq 'ROLE_PUBLISHER'}">
				<li><a href="${pageContext.request.contextPath}/${authUser.id}">내 서재</a></li>
				<ul class="sub-menu">
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/write">글 작성</a>
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">서재 설정</a></li>
				</ul>
				</c:if>
			</c:if>
			
		 <c:if test="${authUser.authority eq 'ROLE_ADMIN'}">
		 <li><a href="${pageContext.request.contextPath}/admin/page">관리자페이지</a></li>
		 </c:if>
		</ul>
	</nav>
	<hr>
	<nav>
		<ul>
			<li><a href="${pageContext.request.contextPath}/">매거진니트 홈</a>
			<!-- <li><a href="#">피드</a> -->
		</ul>
	</nav>
	<hr>
	<nav>
		<ul>
			<c:if test="${authUser ne null}">
			<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
			</li>
			</c:if>
		</ul>
	</nav>
	<hr>
	<ul class="other-nav">
		<%-- <li><a href="${pageContext.request.contextPath}/introduce">매거진노트 소개</a></li>
		<li><a href="${pageContext.request.contextPath}/service">고객센터</a></li> --%>
		<li><a href="${pageContext.request.contextPath}/user/delete">탈퇴하기</a></li>
	</ul>
		</c:otherwise>
	</c:choose>
	 	

	<!--share -->
	<div class="share-navs">
		<ul>
			<li><i class="fa fa-share-alt"></i></li>
			<li><a href="https://github.com/seungmi9191" target="_blank"><i class="fa fa-github"></i></a></li>
		</ul>
	</div>
	<!--/share-->
</div>