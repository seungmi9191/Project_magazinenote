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
                       <div class="row m-t-30">
                            <div class="col-md-12">
                                <!-- DATA TABLE-->
                                <h2 class="title-1 m-b-25">지원 상세 내용</h2>
                                <!-- <div class="table-responsive m-b-40"> -->
                                    <table class="table table-borderless table-data3">
                                        <thead>
                                            <tr>
                                            	<c:if test="${vo.authState eq '1'}">
                                                	<th class="text-left"><span class="status--denied">대기중</span></th>
                                                </c:if>
                                                 <c:if test="${vo.authState eq '2'}">
                                                	<th class="text-center"><span class="status--process">승인완료</span></th>
                                                </c:if>
                                                <th colspan="2" class="text-center">아이디 <b>[${vo.id}]</b>님의 지원 상세 내용입니다. </th>
                                              
                                                <th>
                                                <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/admin/permit">
                                                  <input type="hidden" class="form-control" name="userNo" id="userNo" value="${vo.userNo}">
                                                  <input type="hidden" class="form-control" name="id" id="id" value="${vo.id}">
                                                  <input type="hidden" class="form-control" name="name" id="name" value="${vo.name}">
                                                  <input type="hidden" class="form-control" name="authority" id="authority" value="ROLE_PUBLISHER">
                                                  <input type="hidden" class="form-control" name="authState" id="authState" value="2">
                                                 <c:if test="${vo.authState eq '1'}"> 
                                                  <input type="submit" class="btn btn-success btn-sm"value="승인">
                                                 </c:if>
                                                 <c:if test="${vo.authState eq '2'}">
                                                 
                                                 </c:if>
                                           		</form>
                                                </th>
                                                
	                                        </thead>
	                                        <tbody>
	                                        	<tr>
	                                        		<td colspan="4" class="text-left"><b>1. 매거진 소개</b></td>
	                                        	</tr>
	                                            <tr>
	                                                <td colspan="4" class="text-left">
	                                                	${vo.mnIntro}
	                                           		</tr>
	                                            
	                                            <tr>
	                                        		<td colspan="4" class="text-left"><b>2. 발행인 소개</b></td>
	                                        	</tr>
	                                             <tr>
	                                                <td colspan="4" class="text-left">
	                                                	${vo.auther}
	                                                </td>
	                                            </tr>
	                                            
	                                             <tr>
	                                        		<td colspan="4" class="text-left"><b>3. 계정/주소출처</b></td>
	                                        	</tr>	
	                                              <tr>
	                                                <td colspan="4" class="text-left">
	                                                	${vo.urlOrigin}
	                                                </td>
	                                            </tr>
	                                            
	                                             <tr>
	                                        		<td colspan="4" class="text-left"><b>4. 계정/주소</b></td>
	                                        	</tr>
	                                              <tr>
	                                                <td colspan="4" class="text-left">
	                                                	${vo.url}
	                                                </td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                    <br/>
	                                    <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/admin/applylist'">목록으로</button>
	                                    
	                                </div>
	                          </div>
	                          </div>
	                          </div>
	                          </div>
	                          </div>
	                                <!-- END DATA TABLE-->
        
                     
        	
        </div>

    </div>
     <c:import url="/WEB-INF/views/includes/admin/admin-script.jsp"></c:import>
 </body>
 </html>
 