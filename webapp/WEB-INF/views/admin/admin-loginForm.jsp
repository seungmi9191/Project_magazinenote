<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
   <c:import url="/WEB-INF/views/includes/admin/admin-header.jsp"></c:import>
</head>

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/assets/admin/images/mn_logo_admin.png"  alt="magazineAdmin">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="${pageContext.servletContext.contextPath}/master/" method="post" id="masterLogin">
                                <div class="form-group">
                                    <label>아이디</label>
                                    <input class="au-input au-input--full" type="text" name="id" id="id">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input class="au-input au-input--full" type="password" name="password" id="password">
                                </div>
                                
                                <!-- 아이디/비밀번호 불일치 -->	
		       					<c:if test="${param.result eq 'fail'}">
		       					<p id="form-error" class="form-error">
					    			  아이디 또는 비밀번호를 다시 확인하세요.
								</p> 
								</c:if>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" id="btn-submit" type="submit">로그인</button>
                            
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

   <c:import url="/WEB-INF/views/includes/admin/admin-script.jsp"></c:import>


	<!--필드체크 -->
	<script type="text/javascript">
	
	$("#masterLogin").on("submit", function(){
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
			alert("아이디를 입력해주세요!");
			$("#id").focus();
			return false;
		}
		
		//비밀번호
		if(!$("#password").val()) {
			alert("패스워드를 입력해주세요!");
			$("#password").focus();
			return false;
		}
		return true;		
	}

	</script> 
</body>
</html>
<!-- end document-->