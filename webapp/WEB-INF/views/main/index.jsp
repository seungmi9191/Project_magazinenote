<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
		<!-- /Header section -->

		<!-- line -->
		<section id="portfolio-type-b">
		</section>
		
		<!-- Portfolio(blog) Section  ==========================================-->
		<section id="portfolio-type-a">
			<div class="container ">
				<!-- Container -->

				<div class="categories">
					<p class="head-content4"> ALL ABOUT MAGAZINE LIBRARY </p>
					<p class="head-content5"> 모든 독립잡지 서재 만나기 </p>
					<div class="clearfix"></div>
					<!-- <ul class="cat">
						<li>
							<ol class="type">
								<li><a href="#" data-filter="*" class="active">즐겨찾기</a></li>
								<li><a href="#" data-filter=".web">전체</a></li>
							</ol>
						</li>
					</ul> -->
				</div>
				<div id="lightbox" class="row">
					<c:forEach items="${blogList}" var="blogList">
					<div class="col-sm-6 col-md-4 col-lg-4 col-xs-12">
						<div class="portfolio-item">
							<div class="hover-bg">
								<a href="${pageContext.request.contextPath}/${blogList.id}">
									<div class="hover-text">
										<small>${blogList.name}</small>
										<h2>${blogList.blogTitle}</h2>
										<div class="clearfix"></div>
										<span>${blogList.explanation}</span> </div> 
										<img src="${pageContext.request.contextPath}/upload/${blogList.logoFile}" class="img-responsive" alt="...">
							
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
					
			 <!--page nav-->
		    <!-- <nav class="navigation posts-navigation wow fdeInUp" role="navigation" >
		      <ul>
		        <li class="pull-left">
		          <div class="nav-previous"><a href="http://localhost/wordpress/page/2/"><i class="fa fa-chevron-left"></i></a></div>
		        </li>
		        <li><a href="#" class="active">1</a></li>
		        <li><a href="#">2</a></li>
		        <li><a href="#">3</a></li>
		        <li><a href="#">4</a></li>
		        <li><a href="#">5</a></li>
		        <li class="pull-right">
		          <div class="nav-next"><a href="http://localhost/wordpress/page/2/"><i class="fa fa-chevron-right"></i></a></div>
		        </li>
		      </ul>
		    </nav>-->
		    <!--page nav--> 
		</section>
		
		<!-- publisher -->
		<section id="publisher-type-a">
			
			<div class="categories2">
			<c:choose>
				<c:when test="${authUser eq null}">
					<p class="head-content5"> 매거진니트에 등록을 원하시는 독립잡지 발행인 분들을 모집합니다!</p><br/>
					<button class="btn btn-success btn-lg btn-half-block" type="button" onclick="location.href='${pageContext.request.contextPath}/user/login'">매거진 퍼블리셔 등록하기</button>
					
				</c:when>
			
			<c:otherwise>
				<c:if test="${authUser.authority eq 'ROLE_USER'}">
					<p class="head-content5"> 매거진니트에 등록을 원하시는 독립잡지 발행인 분들을 모집합니다!</p><br/>
					<button class="btn btn-success btn-lg btn-half-block" type="button" onclick="location.href='${pageContext.request.contextPath}/publisher/'">매거진 퍼블리셔 등록하기</button>
				</c:if>
				
				<c:if test="${authUser.authority eq 'ROLE_PUBLISHER'}">
					<label class="h24">오늘도 나의 서재에 매거진 이야기를 담아보세요!</label>
				</c:if>
			</c:otherwise>
			</c:choose>
			</div>
		</section>
	   
	    <!-- footer -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		</div>
		</body>
		<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	

</html>
