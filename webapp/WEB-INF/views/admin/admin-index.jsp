<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <c:import url="/WEB-INF/views/includes/admin/admin-header.jsp"></c:import>
</head>

<body class="animsition">
    <div class="page-wrapper">
   		<c:import url="/WEB-INF/views/includes/admin/admin-navigation.jsp"></c:import>
   		
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <div class="content">
                                    
                                            <c:choose>
												<c:when test="${authUser eq null}">	
												
												</c:when>
												
												<c:otherwise>
													 <label class="js-acc-btn" >${authUser.name}님! 접속을 환영합니다.</label>
                                           			 &nbsp;&nbsp;&nbsp;
	                                           		 <button type="button" class="btn btn-default btn-xs" onclick="location.href='${pageContext.request.contextPath}/'">메인홈으로</button>
	                                           		 &nbsp;&nbsp;
                                           			 <button type="button" class="btn btn-xs" onclick="location.href='${pageContext.request.contextPath}/user/logout'">로그아웃</button>
												</c:otherwise>
											</c:choose>		
                                        </div>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                   
                        <div class="row">
                            <div class="col-lg-9">
                                <h2 class="title-1 m-b-25">매거진 퍼블리셔 지원자관리</h2>
                                
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                           <tr>
                                                <th>회원번호</th>
                                                <th>아이디</th>
                                                <th>이름</th>
                                                <th>접수일</th>
                                                <th>승인여부</th>
                                                <th>내용보기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${aList}" var="list">
                                            <tr class="tr-shadow">
                                                <td class="text-center">${list.userNo}</td>
                                                <td class="text-center">${list.id}</td>
                                                <td class="text-center">${list.name}</td>
                                                <td class="text-center">${list.applyDate}</td>
                                                <c:if test="${list.authState eq '1'}">
                                                	<td class="text-center"><span class="status--denied">대기중</span></td>
                                                </c:if>
                                                <c:if test="${list.authState eq '2'}">
                                                	<td class="text-center"><span class="status--process">승인완료</span></td>
                                                </c:if>
                                                <td><button class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/view?id=${list.id}'">내용보기</button></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
                        
                        <!-- 
                         <ul>
								<li><a href="">◀</a></li>
								<li><a href="">1</a></li>
								<li><a href="">2</a></li>
								<li class="selected">3</li>
								<li><a href="">4</a></li>
								<li><a href="">5</a></li>
								<li><a href="">▶</a></li>
						</ul>
                          -->
                         </div>
                           </div>
                        </div>
                   </div>
                </div>
           </div>
         </div>
         
         <!-- footer -->
         <!--  <div class="row">
            <div class="col-md-12">
               <div class="copyright">
                     <p>Copyright © 2018 WOOSEUNGMI</p>
                </div>
           </div>
                    -->  
        </div>
        </div>

     <c:import url="/WEB-INF/views/includes/admin/admin-script.jsp"></c:import>
 </body>
 </html>
 