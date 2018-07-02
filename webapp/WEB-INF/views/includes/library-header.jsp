<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="entry-header_title">
			<!-- Introduction -->
			<section class="container ">
				<div class="spotlight">
					<span class="image">
					<c:if test="${blogVo.logoFile eq 'blog_logo.jpg'}">
						<img src="${pageContext.request.contextPath}/assets/main/img/profile/blog_logo.jpg" >
					</c:if>
					<c:if test="${blogVo.logoFile ne 'blog_logo.jpg'}">
						<img src="${pageContext.request.contextPath}/upload/${blogVo.logoFile}" >
					</c:if>
					</span>
					<br/>
					
					
					<!-- 서재 주인일 때 -->
					
					<%-- <a href="${pageContext.request.contextPath}/${id}/admin/basic"><i class="fa fa-cog"></i> 설정</a></span> --%>
					<div class="major">
						<%-- <c:choose>
							<c:when test="${id eq authUser.id}"> --%>
								<h2>${blogVo.blogTitle}</h2>
								<p>글 ${postNum} &nbsp; <!-- | &nbsp; 관심메이트 10 &nbsp; | &nbsp; 내 관심 4 --></p>
								<p>${blogVo.explanation}</p>
							<%-- </c:when>
						    <c:otherwise> --%>
						   		<%-- <h2>${blogVo.blogTitle}</h2>
								<p>글 ${postNum} &nbsp; <!-- | &nbsp; 관심메이트 14 &nbsp; | &nbsp; 내 관심 4 --></p>
								<p>${blogVo.explanation}</p> --%>
						    <%-- </c:otherwise>
					   </c:choose> --%>
					</div>
					<div class="content">
					<c:choose>
						<c:when test="${id eq authUser.id || authUser.id eq 'admin'}">
							<!-- 서재 주인 -->
								<br/>
								<div class="col-md-11"><button class="btn btn-success btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/${authUser.id}/admin/write'">
								<i class="fa fa-edit"></i> 글 작성</button></div>
								<br/>
								<br/>
								<div class="col-md-11"><a href="${pageContext.request.contextPath}/${id}/admin/basic"><i class="fa fa-cog"></i> 설정</a></div>
						</c:when>
						
						<c:otherwise>
								<br/>
								
								<%--  <c:forEach items="${sList}" var="slist">
								 	<c:if test="${slist.userNo ne authUser.id}"> --%>
								<%-- <button class="btn btn-success btn-sm" type="button" onclick="location.href='${pageContext.request.contextPath}/${authUser.id}/storage?userNo=${authUser.userNo}&blogNo=${blogVo.blogNo}'">
								<i class="fa fa-heartbeat"></i> 관심메이트 추가</button> --%>
								 	<%-- </c:if>
								 	<c:if test="${slist.userNo eq authUser.id}">
								 	테스트
								 	</c:if>
								 </c:forEach> --%>
						</c:otherwise>
					
					</c:choose>
					</div>
					
				</div>
			</section>
		</div>