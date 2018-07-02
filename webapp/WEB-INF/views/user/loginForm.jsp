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
	
	<div id="login-a">
	<div class="center-content-login">
		<br/><br/><br/>
	  	<p class="text-center h33">매거진니트 로그인</p>
	  		<div class="row wow"> 
			<div class="col-md-8 col-md-offset-2 col-sm-12 single-post">
			<br/><br/>
				<form name="loginForm" id="loginForm" action="${pageContext.servletContext.contextPath}/user/login" method="POST">
		      		<div class="form-group">
					     <label for="id">아이디</label><br/>
					     <input type="text" class="form-control" name="id" id="id">
					     <p id="email-check" class="ajax-message">
					        
					     </p>
		      			</div>
		      		<div class="form-group">
		        		<label for="password">비밀번호</label><br/>
		       			<input type="password" class="form-control" name="password" id="password">
		       			<p id="pw-check" class="ajax-message">
					       
					     </p>
		       		</div>
		       		
		       		<!-- 아이디/비밀번호 불일치 -->	
		       		<c:if test="${param.result eq 'fail'}">
		       		<p id="form-error" class="form-error">
					      아이디 또는 비밀번호를 다시 확인하세요.
					</p> 
					</c:if>
		       		<div class="row row"></div>
		      		<input type="submit" id="btn-submit" class="btn btn-primary" value="로그인">
		      	</form>
			</div>
		</div>
		<!-- line -->
		<section id="line-type-a">
		</section>
		<br/><br/>
		<div class="content">
			<p id="notice">아직 계정이 없으신가요?</p>
			<div class="col-md-4"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.servletContext.contextPath}/user/join" class="join">매거진니트 가입하기</a>
		</div>
	</div>
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
	</body>
	
	<!--필드체크 -->
	<script type="text/javascript">
	
	$("#loginForm").on("submit", function(){
		console.log("안녕");
		if(validation() == true) {
			return true;
		} else {
			return false;
		}
	});
		
	function validation() {
		
		//아이디
		if(!$("#id").val()) {
			$("#email-check").html("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		
		//비밀번호
		if(!$("#password").val()) {
			$("#pw-check").html("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		return true;		
	}

	</script> 
		
</html>