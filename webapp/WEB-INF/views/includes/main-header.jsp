<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="top-header_no">
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
					<span class="company-name">${authUser.name}님 환영합니다!
					&nbsp;&nbsp;
					<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/user/logout'">로그아웃</button></span>
					<!--<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/storage/pubstorage'">내 관심</button></span>-->
					</div>
				</c:when>
				
				<c:when test="${authUser.authority eq 'ROLE_PUBLISHER'}">
						<div class="col-md-10  header-col-2">
						<span class="company-name">${authUser.name}님
						&nbsp;&nbsp;
						<button type="button" class="btn btn-primary btn-xs" onclick="location.href='${pageContext.request.contextPath}/${authUser.id}'">내 서재</button></span>
						</div>
				</c:when>
				
				<c:otherwise>
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
				<i class="fa fa-bars "></i></span>
			</div>
			
			<!-- introduce content -->
			<div class="col-md-12 ">
				<div class="clearfix"></div>
				<br/><br/><br/>
				<p class="head-content wow fadeInDown" > 시선으로부터 자유로워지는 이 곳은 : 매거진 니트(Neat)입니다.</p>
				<p class="head-content2 wow fadeInDown"> 매거진 니트에서 다양한 독립잡지 서재를 방문하다보면 </p>
				<p class="head-content3 wow fadeInDown"> 곧 마음이 맞는 독립잡지들을 만날 수 있을거예요:)</p>
			</div>
			
			<div class="col-md-12 header-col-3">
			<input class="form-control" type="hidden"/>
			<br/></div>
			
			<!-- search bar -->
			<!--  <div class="col-md-6">	
			<div class="input-group">
		        <input class="form-control" type="text" placeholder="원하는 독립잡지 서재에 방문하고 싶다면?"/>
		        <span class="input-group-btn">
		        <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
		        </span></div>
			</div>-->
		</div>
	</div>
</header>