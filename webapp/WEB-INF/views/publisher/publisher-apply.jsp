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
		<div class="center-content-apply">
		<p class="h24">매거진 퍼블리셔 신청서</p>
		<br/>
		<div class="row wow"> 
			<div class="col-md-8 col-md-offset-2 col-sm-12 single-post">
			<form name="applyForm" id="applyForm" action="${pageContext.servletContext.contextPath}/publisher/apply" method="POST">
		      		<div class="form-group">
					     <label for="mnIntro" class="h11">매거진소개(아래 예시와 동일하게 입력해주세요.)</label>
					     <label> 매거진이름/발행년도/매거진주제/간략한 매거진소개</label>
					      <textarea name="mnIntro"></textarea>
		      		</div>
		      			
		      		<div class="form-group">
					     <label for="auther" class="h11">발행인소개(발행인분의 간략한 소개 부탁드립니다.)</label>
						<textarea name="auther"></textarea>
					</div>
					
					<div class="form-group">
					     <label for="url" class="h11">매거진 관련 URL(활동 중인 홈페이지나 SNS)</label><br/>
					     <label>계정/주소출처(홈페이지/페이스북/인스타그램/트위터)</label>
					     <select name="urlOrigin">     	
					     	<option value="홈페이지">홈페이지</option>
					     	<option value="페이스북">페이스북</option>
					     	<option value="인스타그램">인스타그램</option>
					     	<option value="트위터">트위터</option>
					     	<option value="블로그">블로그</option>
					     </select><br/>
					    <!--  <input type="text" class="form-control" name="urlOrigin" id="urlOrigin"> -->
					      <label>계정/주소</label>
					     <input type="text" class="form-control" name="url" id="url">
					</div> 
					<br/>
		       		<div class="row row"></div>
		       		<input type="hidden" name="userNo" value="${authUser.userNo}">
		       		<input type="hidden" name="authState" value="1"> <!-- 신청상태를 대기중으로 넣어줌 -->
		      		<input type="submit" id="btn-submit" class="btn btn-success" value="신청하기">
		      	</form>
			</div>
			</div>
		</div>
		</div>
		<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
		</div>
		<%-- <c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	 --%>
		</body>
	<script type="text/javascript">
	
	$("#applyForm").on("submit", function(){
		console.log("안녕");
		if(validation() == true) {
			return true;
		} else {
			return false;
		}
	});
		
	function validation() {
		
		//소개
		if(!$("[name=mnIntro]").val()) {
			alert("소개를 입력해주세요!");
			$("[name=mnIntro]").focus();
			return false;
		}
		
		//발행인소개
		if(!$("[name=auther]").val()) {
			alert("발행인 소개를 입력해주세요!");
			$("[name=auther]").focus();
			return false;
		}
		
		//발행인소개
		/* if(!$("#urlOrigin").val()) {
			alert("주소출처를 입력해주세요!");
			$("#urlOrigin").focus();
			return false;
		} */
		
		//발행인소개
		if(!$("#url").val()) {
			alert("주소를 입력해주세요!");
			$("#url").focus();
			return false;
		}
		return true;
	}

	</script> 
</html>