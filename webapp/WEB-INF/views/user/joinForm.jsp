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

		<div id="join-a">
	    <div class="center-content-join">
		    <br/><br/><br/>
		     <p class="text-center h23">매거진니트 회원가입</p>
	    	   <div class="row wow"> 
				 <div class="col-md-offset-2 col-sm-12 single-post">
				  <br/><br/>
					 <form name="joinForm" id="joinForm" method="POST" action="${pageContext.servletContext.contextPath}/user/join">
		      			<div class="form-group">
					        <label for="id">아이디</label><br/>
					        <input type="text" class="form-control_btn" name="id" id="id">
					        <input type="button" id="btn-checkid" value="id 중복체크" class="btn btn-success">
					        <input type="hidden" id="isIdCheck" value="false">
					        
					        <p id="email-check" class="ajax-message">
					          <!-- 이미 가입된 이메일입니다. -->
					        </p>
		      			</div>
		      			
		      			<div class="form-group">
		        			<label for="passwoxwrd">비밀번호</label><br/>
		       				<input type="password" class="form-control" name="password" id="password">
		       				<p id="pw-check" class="ajax-message">
					          
					        </p>
		      			</div>
		      			<div class="form-group">
		        			<label for="name">이름 또는 닉네임</label><br/>
		       				<input type="text" class="form-control_btn" name="name" id="name">
		       				 <input type="button" id="btn-checkname" value="이름 중복체크" class="btn btn-success">
		       				 <input type="hidden" id="isNameCheck" value="false">
		       				<p id="name-check" class="ajax-message">
					           
					        </p>
		      			</div>
		      			<div></div>
		      			<div class="col-md-3"></div>
		      				<div class="form-group checkbox checkbox-success">
		        			<input type="checkbox" id="agreeProv" value="">
		        			<label>매거진노트 <a><b>이용약관</b></a>에 동의합니다.</label>
		        			<p id="agree-check" class="agree-check">
					           
					        </p>
		      			</div>
		      			<div class="row row"></div>
		      			<!-- <div class="col-md-5"></div> <button type="submit" class="btn btn-success">가입하기</button> -->
		      			<input type="hidden" class="form-control" name="authority" id="authority" value="ROLE_USER">
		      			<input type="submit" class="btn btn-success" value="가입하기">
		      		</form>
				</div>
	    	   </div>
	    	<!-- line -->
			<section id="line-type-a">
			</section>
			<br/><br/>
			<div class="content">
				<p id="notice">이미 계정이 있으신가요? </p>
				<div class="col-md-4"></div>&nbsp;&nbsp;&nbsp;<a href="${pageContext.servletContext.contextPath}/user/login" class="login">기존계정으로 로그인하기</a>
			</div>
		</div>
		</div>
		
	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
	
	</body>
	
	<!-- ajax 아이디 -->
	<script type="text/javascript">
	
	$("#btn-checkid").on("click", function(){
		
		var pattern1 =  /^[a-z]{1}[a-zA-Z0-9_]{3,21}$/g; //시작은 영문으로만,영문,숫자,'_'로만 이루어진 4~20자 이하
		var id = $("#id").val(); //ajax체크
		
		//check시 내용이 없으면 리턴
		if(!id) {
			$("#email-check").html("아이디를 입력해주세요.");
			$("#email-check").css("color", "red");
			$("#id").focus();
			return false;
		}
		
		//id 영문,숫자 
		if(!pattern1.test($("#id").val())){
			$("#email-check").html("아이디는 영문,숫자,'_'로만 이루어진 4~20자 이하로 작성해주세요.");
			$("#email-check").css("color", "red");
			$("#id").focus();
			return false;
		}

		$.ajax({
	 		
	 		url : "${pageContext.request.contextPath}/api/user/idcheck",		
	 		type : "post",
	 		data : {id:id}, //파라미터값 : 넘어갈 때 담아뒀던 이름
	 		
	 		dataType : "json",
	 		success : function(isCheckOk){
	 		console.log(isCheckOk);
	 			
	 			/*ajax 성공시 처리*/
	 			if(isCheckOk==true) {
	 				$("#email-check").html("사용할 수 있는 아이디 입니다.");
	 				$("#email-check").css("color","blue");
	 				$("#isIdCheck").val("true");
	 			}else {
	 				$("#email-check").html("이미 가입되어있는 아이디 입니다.");
	 				$("#email-check").css("color","red");
	 			}
	 			console.log(isCheckOk);	 			
	 		},
	 		error : function(XHR, status, error) {
	 			console.error(status + " : " + error);
	 		}
	 	}); //end ajax	
	}); //end on
	
	/* ajax 이름 */
	$("#btn-checkname").on("click", function(){
		
		var pattern3 =  /^[가-힣]{2,6}|[a-zA-Z]{2,10}$/; //시작은 영문으로만,영문,숫자,'_'로만 이루어진 4~20자 이하
		var name = $("#name").val(); //ajax체크
		
		//check시 내용이 없으면 리턴
		if(!name) {
			$("#name-check").html("이름을 입력해주세요.");
			$("#name-check").css("color", "red");
			$("#name").focus();
			return false;
		}
		
		//이름 한글,영문
		if(!pattern3.test($("#name").val())){
			$("#name-check").html("이름은 한글,영문만 가능하며 2~20자 이하로 작성해주세요.");
			$("#name-check").css("color", "red");
			$("#name").focus();
			return false;
		}

		$.ajax({
	 		
	 		url : "${pageContext.request.contextPath}/api/user/namecheck",		
	 		type : "post",
	 		data : {name:name}, //파라미터값 : 넘어갈 때 담아뒀던 이름
	 		
	 		dataType : "json",
	 		success : function(isCheckOk){
	 		console.log(isCheckOk);
	 			
	 			/*ajax 성공시 처리*/
	 			if(isCheckOk==true) {
	 				$("#name-check").html("사용할 수 있는 이름(닉네임) 입니다.");
	 				$("#name-check").css("color","blue");
	 				$("#isNameCheck").val("true");
	 			}else {
	 				$("#name-check").html("중복된 이름(닉네임)이 존재합니다.");
	 				$("#name-check").css("color","red");
	 			}
	 			console.log(isCheckOk);	 			
	 		},
	 		error : function(XHR, status, error) {
	 			console.error(status + " : " + error);
	 		}
	 	}); //end ajax	
	}); //end blur
	
	
	//submit 버튼을 눌렀을 경우 유효성 체크
	$("#joinForm").on("submit", function(){
		if(validation() == true) {
			return true;
		} else {
			return false;
		}
	});
	
	function validation() {
		
		var pattern1 =  /^[a-z]{1}[a-zA-Z0-9_]{3,21}$/g; //시작은 영문으로만,영문,숫자,'_'로만 이루어진 4~20자 이하
		var pattern2 =  /^[가-힣]{2,6}|[a-zA-Z]{2,10}$/; //한글,영문 모두 가능

		//아이디
		if(!$("#id").val()) {
			$("#email-check").html("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		} 
		
		//아이디 중복체크
		if($("#isIdCheck").val() == "false") {
	 		$("#email-check").html("아이디 중복체크를 해주세요.");
	 	}
		
		//비밀번호
		if(!$("#password").val()) {
			$("#pw-check").html("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
			
		//이름
		if(!$("#name").val()) {
			$("#name-check").html("이름을 입력해주세요.");
			$("#password").focus();
			return false;
		}
		
		//이름
		if(!pattern2.test($("#name").val())){
			$("#name-check").html("이름은 한글,영문만 가능하며 2~20자 이하로 작성해주세요.");
			$("#name").focus();
			return false;
		}
		
		//이름 중복체크
		if($("#isNameCheck").val() == "false") {
	 		$("#name-check").html("이름 중복체크를 해주세요.");
	 	}
		
		//약관동의
		if($("#agreeProv").prop('checked') == false) {
			$("#agree-check").html("이용약관에 동의해주세요.");
			return false;
		}
		return true;
	}
	
	</script>
	
</html>