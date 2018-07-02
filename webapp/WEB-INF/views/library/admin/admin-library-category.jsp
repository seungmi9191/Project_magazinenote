<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/views/includes/head.jsp"></c:import>
</head>
<body class="single with-sidebar">
	<!--Top Nav content-->
	<c:import url="/WEB-INF/views/includes/navigation.jsp"></c:import>
	<!--Top Nav content-->

	<div id="main-block"> 
	<!-- Header section for center the head items add id "top-header-centre" -->
	<c:import url="/WEB-INF/views/includes/top-library-header.jsp"></c:import>
	<!-- /Header section --> 
	
	<div class="entry-header_title2">
			<!-- Introduction -->
			<section class="container ">
				<div class="spotlight2">
					<div class="major">
						<h2>내 서재 설정</h2>
						<p><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">기본설정</a> &nbsp; | &nbsp; 
						<a href="${pageContext.request.contextPath}/${authUser.id}/admin/cate"><b class="b">카테고리관리</b> </a> &nbsp; | &nbsp; 
						<a href="${pageContext.request.contextPath}/${authUser.id}/admin/write"> 글 작성 </a></p>
					</div>
				</div>
			</section>
				</div>
				
			<div id="join-a-c">
				<div class="container">
			 		<table>
				 		<thead class="text-center">
					 		<tr>
					 			<th>번호</th>
					 			<th>카테고리명</th>
					 			<th>포스트 수</th>
					 			<th>카테고리 설명</th>
					 			<th>삭제</th>
					 		</tr>
				 		</thead>
				 		<!-- <tr>
				 			<td>1</td>
				 			<td>공지사항</td>
				 			<td>2</td>
				 			<td>자유공간 공지사항</td>
				 			<td><a href="#"><i class="fa fa-times-circle"></i></a></td>
				 		</tr>	 -->
				 		
				 		 <!--리스트가 들어가서 반복됨 -->
				 	
			      		<tbody id=cateList>
							<!-- 리스트 들어가서 반복 -->
				 		</tbody>
					</table>
				</div>
			</div>
			
			<hr>
			<div class="container">
				<br/>
			 	<form name="categorySetting" action="#" method="POST" > 
			 	<div class="form-group admin-config">
			 	<label class="h55">새로운 카테고리 추가</label>
			 	</div><br/>
			 	
			 	<div class="form-group admin-config">
			 		<input type="hidden" name="blogNo" value="${blogVo.blogNo}">
			 	</div>
			 	
			 	<div class="form-group admin-config">
			 		<label for="cateName">카테고리 이름</label><br/>
			 		<input type="text" class="form-control" name="cateName" id="cateName">
			 	</div>
			 	
			 	<div class="form-group admin-config">
			 		<label for="description">카테고리 설명</label><br/>
			 		<input type="text" class="form-control" name="description" id="description">
			 	</div>	
			 	
			 	<div class="row row"></div><br/>
		      		<input id="btnAddCate" type="submit" class="btn btn-primary" value="카테고리 추가"> 
			 	</form> 

			 	<%-- <table>
			 		<tr>
			 			<td><label class="h55">새로운 카테고리 추가</label></td>
			 		</tr>
				 	<tr>
				 		<td><input type="hidden" name="blogNo" value="${blogVo.blogNo}"></td>
				 	</tr>
				 	<tr>
				 		<td><label for="cateName">카테고리 이름</label><br/>
				 		<input type="text" class="form-control" name="cateName" id="cateName"></td>
				 	</tr>
				 	<tr>
				 		<td><label for="description">카테고리 설명</label><br/>
				 		<input type="text" class="form-control" name="desc"></td>
				 	</tr>
				 	<tr>
				 		<td><input id="btnAddCate" type="submit" class="btn btn-primary" value="카테고리 추가"></td>
				 	</tr>
			 	
			 	</table> --%>
			</div>
			<br/><br/><br/>
	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
	
</body>

	<!-- ajax 처리-->
	
<script type="text/javascript">
	
//객체화 한 다음 리스트 그릴 준비 됐다고 알림
$(document).ready(function() {
	 fetchList();
});	


function fetchList() {
	$.ajax({
		url : "${pageContext.request.contextPath}/api/cate/list",
		type : "post",
			
		dataType : "json",
		success : function(cateList) {
			/*성공시 처리*/
			console.log(cateList)
			for(var i=0; i<cateList.length; i++) {
				render(cateList[i], "down");
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}
		
//리스트 그려주기
function render(cateVo, updown) {
		
	var str ="";
		//str += "		<tr id ='" + cateVo.cateNo + "'>";
		str += "		<tr id ='cate' class='text-center'>";
		str += "			<td class='text-center'>" + cateVo.cateNo + "</td>";
		str += "			<td>" + cateVo.cateName +  "</td>";
		str += "			<td>" + cateVo.postNum + "</td>";
		str += "			<td>" + cateVo.description + "</td>";
		str += "			<td><input type='image' src='${pageContext.request.contextPath}/assets/main/img/delete.png' id='btnDel' data-cateno='"+cateVo.cateNo+"' data-postno='"+cateVo.postNum+"'></td>";
		str += "       </tr>";
		
	if(updown == "up") {
		$("#cateList").prepend(str);
	} else if(updown == "down") {
		$("#cateList").append(str);
	} else {
		console.log("error!");
	}
}

		
//카테고리 등록
$("#btnAddCate").on("click",function(){
	event.preventDefault();
	console.log("click btnAdd");
	
	var cateName = $("#cateName").val();
	var description = $("#description").val();
	var blogNo = "${blogVo.blogNo}";
	
	console.log(cateName);
	console.log(description);
	console.log(blogNo);
	
	if(cateName == "" || description == "") {
		alert("내용을 입력해주세요!");
		return;
	}; 
	
	//카테고리 Vo에 입력된 정보 저장
	cateVo = {  cateName: cateName,
				description: description,
			 	blogNo: blogNo };
	console.log(cateVo);
	
		//카테고리 등록 ajax
		//contentType : "application/json",일 경우 stringify를 꼭 넣어주기
		$.ajax({
			url : "${pageContext.request.contextPath}/api/cate/add",
			type : "post",
			/* contentType : "application/json", */
			/* data : JSON.stringify(cateVo), */
			data : cateVo,
			
			dataType : "json",
			success : function(cateVo) {
						
					/* if(cateVo.result != "success"){
						return ;
					} */
				
					console.log(cateVo);
					alert('카테고리가 추가되었습니다.');
					
					render(cateVo, "up");
					$("#cateName").val("");
					$("#description").val(""); 
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});	 
	
	
//카테고리 삭제
$("#cateList").on("click","input", function(){
	var cateNo = $(this).data("cateno"); 	
	console.log(cateNo);
	
	var postNum = $(this).data("postno");
	if(postNum>0) {
		alert("작성된 글이 있어 카테고리 삭제가 불가능합니다.");
		return false;
	} else  {
		console.log("글이 없어 삭제가능합니다.");
	}
	$.ajax({
		url : "${pageContext.request.contextPath }/api/cate/remove",		
		type : "post",
		data : {cateNo: cateNo},
		dataType : "json",
		success : function(result) {
			if(result==true) {
				
				$("#cate").remove();//result가 true면 하단 tr의 id값을 지우렴.
				
				alert("삭제되었습니다!");
				console.log(result);
				console.log("삭제성공");
			} else {
				console.log(result);
				console.log("삭제실패");
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});

</script>
</html>