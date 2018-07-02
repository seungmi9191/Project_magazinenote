<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header id="top-header_blog">
	<div class="container">
		<div class="row">
			<!-- top header --> 
			<div class="col-md-1 header-col-1">
			<a href="${pageContext.request.contextPath}/" class="company-logo"> 
				<img src="${pageContext.request.contextPath}/assets/main/img/mn_logo.png" class="pull-left logo"></a>
			</div>
			
			<c:choose>
				<c:when test="${authUser eq null}">
					<div class="col-md-10  header-col-2">
					<span class="company-name"><a href="${pageContext.request.contextPath}/user/login">로그인</a>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/user/join'">회원가입</button></span>
					</div>
				</c:when>
				
				<c:when test="${authUser.authority eq 'ROLE_USER'}">
					<div class="col-md-10  header-col-2">
					<span class="company-name">${authUser.name}님
					&nbsp;&nbsp;
					<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/user/logout'">로그아웃</button></span>
					<%-- <button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/user/join'">내 관심</button></span> --%>
					</div>
				</c:when>
				
				<c:otherwise>
					<c:if test="${authUser.authority eq 'ROLE_PUBLISHER'}">
						<div class="col-md-10  header-col-2">
						<span class="company-name">${authUser.name}님
						&nbsp;&nbsp;
						<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/${authUser.id}'">내 서재</button></span>
						</div>
					</c:if>
					
					<c:if test="${authUser.authority eq 'ROLE_ADMIN'}">
						<div class="col-md-10  header-col-2">
						<span class="company-name">${authUser.name}님
						&nbsp;&nbsp;
						<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/admin/applylist'">관리자</button></span>
						</div>
					</c:if>	
				</c:otherwise>
			</c:choose>
			
			<div class="col-md-1 header-col-3">
				<span class="pull-right openmenu-nav" onclick="openNav()"> 
				<i class="fa fa-bars"></i></span>
			</div>
			
		</div>
	</div>
</header>