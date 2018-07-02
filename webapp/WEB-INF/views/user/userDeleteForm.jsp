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
	  	<p class="text-center h33">매거진니트 탈퇴</p><br/>
	  	<div class="row wow"> 
	  	<p class="text-center h34">탈퇴하시면 운영하시던 서재가 폐쇄되며, <br/>
		<font color="red">모든데이터는 복구가 불가능합니다.</font><br/>
		아래 사항을 확인하신 후에 신중하게 결정해주세요.<br/>
		</p>
		<hr>	 			
		<p class="text-center h35">	 	
		- 모든 첨부파일, 글, 댓글이 삭제됩니다.<br/>
		- 매거진노트의 프로필 및 정보가 모두 삭제됩니다.</p>
			<div class="col-md-8 col-md-offset-2 col-sm-12 single-post">
		<br/><br/>
			<form name="deleteForm" id="deleteForm" action="${pageContext.servletContext.contextPath}/user/delete" method="POST">
			<div class="col-md-3"></div>
		      				<div class="form-group checkbox checkbox-success">
		        			<input type="checkbox" id="agreedelete" value="">
		        			<label>안내사항을 모두 확인하으며, 이에 동의합니다.</label>
		      			</div>
		      			<div class="row row"></div>
		      			<!-- <div class="col-md-5"></div> <button type="submit" class="btn btn-success">가입하기</button> -->
		      			<input type="hidden"  class="form-control" name="userNo" value="${authUser.userNo}"> 
		      			<input type="submit" class="btn btn-success" value="탈퇴하기">
			</form>
			</div>
		</div>
		
		</div>
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
	
	</body>
	
	<script type="text/javascript">
	//submit 버튼을 눌렀을 경우 유효성 체크
	$("#deleteForm").on("submit", function(){
		if(validation() == true) {
			return true;
		} else {
			return false;
		}
	});
	
	function validation() {
		
		//약관동의
		if($("#agreedelete").prop('checked') == false) {
			alert("안내사항을 확인해주세요!");
			return false;
		}
		return true;
	}
		
	</script>
</html>		