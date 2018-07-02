<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
	<c:import url="/WEB-INF/views/includes/library-header.jsp"></c:import>

	  <!--Post container-->
	  
	  <div class="container">
	    <div class="row wow fdeInUp"> 
	      <!--blog posts container-->
	     <br/><br/>
	      <div class="col-md-8 col-sm-12 single-post">
	        <article class="post">
	      	<!-- line -->
	
	      	<c:if test="${not empty postVo}">
			<h1>${postVo.postTitle}</h1>
	
			 <!--publisher-info -->
	        <div class="publisher-info">
	          <h6>by ${blogVo.name}
	          		<c:if test="${authUser.userNo eq blogVo.userNo}">
	          			<span class="date-article">&nbsp;&nbsp;&nbsp;  |  
	          			<a href="${pageContext.request.contextPath}/${blogVo.id}/admin/postDelete?postNo=${postVo.postNo}" class = "publisher-info" id="btnBtnPostDel">삭제하기</a></span>
	          		</c:if>
	          </h6>
	        <%--   <c:forEach items="${postList}" var="postVo">
	         	<span class="date-article">&nbsp;&nbsp; ${postVo.regDate}</span> 
	          </c:forEach></h6> --%>
	        </div>
	        
			<hr class="hr2">
			<div class="clearfix"></div>
	        <!-- contents -->
	         <figure >
	          <img src="${pageContext.request.contextPath}/upload/post/${postVo.postImage}" class="img-responsive">
	         </figure>
	         <p> 
	         	<%-- ${fn:replace(postVo.postContent, newLine, "<br/>") } --%>
	         	${postVo.postContent}
	         </p>
	         </c:if>
	         
	        <c:if test="${empty postVo}">
	        <h1>등록된 글이 없습니다.</h1>
	        
	        </c:if>
	        
	         </article>
	      
	        <div class="clearfix"></div>
			
	         <hr class="hr2">
	        
	        <!--posts navigation-->
	      <!--   <nav class="navigation posts-navigation"  role="navigation">
	          <ul>
	            <li class="pull-left">
	              <div class="nav-previous"><a href="http://localhost/wordpress/page/2/"><i class="fa fa-chevron-left"></i> 이전글</a></div>
	            </li>
	            <li class="pull-right">
	              <div class="nav-next"><a href="http://localhost/wordpress/page/2/">다음글 <i class="fa fa-chevron-right"></i></a></div>
	            </li>
	          </ul>
	        </nav> 
	        <!--/posts navigation-->
	        
	        <!-- <div class="clearfix"></div> -->
	        
	        <!--comment-->
	        <div id="comments" class="comments-area text-left">
	          <h2 class="comments-title"> 댓글 </h2>
	          
	          <!--댓글시작  - 글쓴이/답글,수정,삭제-->
	         <!--  <ol class="comment-list">
	            <li id="comment-1" class="comment even thread-even depth-1 parent"> -->
	              <!-- <article id="div-comment-1" class="comment-body"> -->
	                <!-- <footer class="comment-meta"> -->
	                  <!-- <div class="comment-author vcard">  -->
	                   
	                 <table id="cmtList">
	              <%--    <tbody>
	       
	                  <tr>
	                  <td class="test">이름ㅇㅇㅇㅇㅇㅇ</td>
	                  <td class="test">얼른 잡지보고싶네요 To delete a comment,omment,omment,omment,ommnt,omment,ommnt,omment, justnt, nt, nt,  log in and view the post's</td>
	                  <td class="test"><a href="#"><img src="${pageContext.request.contextPath}/assets/main/img/delete.png"></a></td>
	                  </tr>
	                  
	                  
	                  </tbody> --%>
	                  </table>
	                  <br/><!-- </div> -->
	                  <%-- <img alt="" src="${pageContext.request.contextPath}/assets/main/img/like.png" class="avatar avatar-42 photo avatar-default img-circle" height="20" width="20">
	                   <b class="fn"><a href="#">안녕하세요</a></b><span class="date-article">&nbsp;&nbsp;JULY 13 2017</span> </div>
	                   <div class="reply">
	                   <!-- <a href="#">답글</a>
	                   <a href="#">수정</a> -->
	                   <a href="#">삭제</a></div> --%>
	                <!-- </footer> -->
	                
	                <!-- 댓글내용 -->
	               
	                  
	                
	           <!--    </article>
	               -->
	              <!-- 답글 -->
	              <!-- .comment-body -->
	             <%--  <ol class="children">
	                <li id="comment-2" class="comment byuser comment-author-admin bypostauthor odd alt depth-2">
	                  <article id="div-comment-2" class="comment-body">
	                   <footer class="comment-meta">
	                  <div class="comment-author vcard"> 
	                  <img alt="" src="${pageContext.request.contextPath}/assets/main/img/kriri.jpg"  class="avatar avatar-42 photo avatar-default img-circle" height="20" width="20">
	                   <b class="fn"><a href="#">안녕하세요</a></b><span class="date-article">&nbsp;&nbsp;JULY 13 2017</span> </div>
	                   <div class="reply">
	                   <a href="#">답글</a>
	                   <a href="#">수정</a>
	                   <a href="#">삭제</a></div>
	                   </footer>
	                 
	                 <!-- 댓글내용 -->    
	                <div class="comment-content">
	                  <p>관심가져주셔서 감사합니다!</p>
	                </div>
	              </article> --%>
	              
	                  <!-- .comment-body --> 
	               <!--  </li>
	                #comment-##
	              </ol> -->
	              <!-- .children --> 
	         <!--    </li>
	          </ol> -->
	          <!-- .comment-list -->
	        
	          <div id="respond" class="comment-respond">
	            <form action="#" method="post" name="cmtinsert" id="commentform" class="comment-form">
	          	
	          	<c:choose>
	          		<c:when test="${!empty authUser.id && !empty postVo}">
		          		<label for="comment">댓글달기</label>
		              		<p class="comment-form-comment">
		              		   <input type="text" id="name" value="${authUser.name}" readonly>
		             		</p>
		              		<p class="comment-form-comment">
		                       <textarea id="cmtContent" name="cmtContent" cols="45" rows="8" maxlength="65525" aria-required="true"></textarea>
		                    </p>
		                    <p class="form-submit">
		                       <input type="submit" id="btnAddCmt" class="submit" value="댓글등록">
		                       <!-- data-userno="${authUser.userNo}" data-postno="${postVo.postNo}"  -->
		                    </p>
	          		</c:when>
	          		
	          		<c:when test="${empty postVo}">
	          			  작성된 글이 없어 댓글을 달 수 없습니다.
	          		</c:when>
	          		
	          		<c:otherwise>
	          			 로그인해주세요.
	          		</c:otherwise>
	          	</c:choose>
	            </form>
	          </div>
	          <!-- #respond --> 
	          
	        </div>
	        <!--/comment--> 
	        
	      </div>
	      <!--blog posts container--> 
	      
	      <!--aside-->
	      <aside class="col-md-4 col-sm-12" > 
	      <!--   
	        Search
	        <section class="widget widget_search  wow fadeInUp">
	          <h2 class="widget-title">search</h2>
	          <form>
	            <div class="input-group">
	              <input class="form-control" type="text" placeholder="Search what you need....">
	              <span class="input-group-btn">
	              <button  type="button"><i class="fa  fa-search"></i></button>
	              </span> </div>
	          </form>
	        </section>
	        /Search  -->
	        
	               
	        <!--categories start-->
	        
	        <section class="widget widget_categories  wow fadeInUp">
	          <h2 class="widget-title">카테고리</h2>
	          <ul>
	          <c:forEach items="${cateList}" var="cateVo">
					<li><a href="${pageContext.request.contextPath}/${blogVo.id}?cateNo=${cateVo.cateNo}">${cateVo.cateName}</a></li>
			  </c:forEach>
	          </ul>
	        </section>
	        
	        <!--categories  end--> 
	        
	           
	        <!--Recent posts start-->
	        
	        <section  class="widget  widget_recent_entries  wow fadeInUp ">
	          <h2 class="widget-title">글목록</h2>
	           <ul>
	          <c:forEach items="${postList}" var="postVo">
	            <li> <a href="${pageContext.request.contextPath}/${blogVo.id}?cateNo=${param.cateNo}&postNo=${postVo.postNo}">${postVo.postTitle}</a> 
	            <span class="post-date">${postVo.regDate}</span> </li>
	          </c:forEach>
	          </ul>
	        </section>
	        
	        <!--Recent posts end--> 
	        
	        
	        <!--Recent Comments-->
	        
	     <!--    <section class="widget widget_recent_comments  wow fadeInUp">
	          <h2 class="widget-title">Recent Comments</h2>
	          <ul >
	            <li ><span class="comment-author-link"><a href="#">Steeve</a></span> on <a href="http://localhost/wordpress/potato-cakes-with-smoked-salmon-cream-cheese/comment-page-1/#comment-18">Tips For Designing a Business</a></li>
	            <li ><span class="comment-author-link"><a href="#">Steeve</a></span> on <a href="http://localhost/wordpress/potato-cakes-with-smoked-salmon-cream-cheese/comment-page-1/#comment-17">Barbecue Sauce Barbeque</a></li>
	            <li ><span class="comment-author-link"><a href="#">Steeve</a></span> on <a href="http://localhost/wordpress/potato-cakes-with-smoked-salmon-cream-cheese/comment-page-1/#comment-16">What Makes A Hotel Boutique</a></li>
	          </ul>
	        </section>
	         -->
	        <!--Recent Comments end--> 
	            
	      </aside>
	      <!--aside-->
	      <div class="clearfix"></div>
	    </div>
	  </div>
	  
	  <!--/Post container-->
	  
	  <br/><br/>
		
	  <!-- footer -->
	  <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	  </div>
	  <c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	
</body>

<!-- 댓글 ajax -->

<script type="text/javascript">

$(document).ready(function() {
	 fetchList();
});	

//댓글 리스트 
function fetchList() {
	$.ajax({
		url : "${pageContext.request.contextPath}/${blogVo.id}/listCmt/${postVo.postNo}",
		type : "post",
			
		dataType : "json",
		success : function(cmtList) {
			/*성공시 처리*/
			console.log(cmtList)
			for(var i=0; i<cmtList.length; i++) {
				render(cmtList[i], "down");
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}

//render
function render(cmtVo, updown){
	
	var str ="";
	    //str +="		<tr id='"+cmtVo.cmtNo+"'>";
	    str += "	<tr id ='cmt'>";
	    str +="     	<td class='text-center'><b>" + cmtVo.name + "</b></td><br/>"
	    str +="     	<td>" + cmtVo.cmtContent + "</td><br/>"
	    str +="     	<td>" + cmtVo.regDate + "</td><br/>"
      	str +="     	<td><input type='image' src='${pageContext.request.contextPath}/assets/main/img/delete.png' id='btnDel' data-cmtno='"+cmtVo.cmtNo+"' data-test='"+cmtVo.userNo+"'></td><br/>"
	    str +="	    </tr>";
	    
	    if(updown=="up"){
	    	$("#cmtList").prepend(str);
	    }else if(updown=="down"){
	    	$("#cmtList").append(str);
	    }else{
	    	console.log("error!");
	    }
}

//댓글 입력
$("#btnAddCmt").on("click",function(){
	event.preventDefault();
	console.log("click btnAdd");
	
	var name = $("#name").val();
	var cmtContent = $("#cmtContent").val();
	var postNo = "${postVo.postNo}";
	var userNo = "${authUser.userNo}";
	
	console.log(name);
	console.log(cmtContent);
	console.log(postNo);
	console.log(userNo);
	
	if(cmtContent == "") {
		alert("내용을 입력해주세요!");
		return;
	};
	
	cmtVo = {   name: name,
				cmtContent: cmtContent,
				postNo: postNo, 
				userNo: userNo
			};
	console.log(cmtVo);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/${authUser.id}/add",
		type : "post",
		/* contentType : "application/json", */
		/* data : JSON.stringify(cateVo), */
		data : cmtVo,
		
		dataType : "json",
		success : function(cmtVo) {
					
				/* if(cateVo.result != "success"){
					return ;
				} */
			
				console.log(cmtVo);
				alert('댓글이 추가되었습니다.');
				
				render(cmtVo, "up");
				$("#name").val("");
				$("#cmtContent").val(""); 
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});	 

//댓글 삭제
$("#cmtList").on("click","input", function(){
	var cmtNo = $(this).data("cmtno"); 		
	console.log(cmtNo);
	
	var userNo = "${authUser.userNo}";
	var cmtUserNo = $(this).data("test"); 	
	
	console.log(userNo);
	console.log(cmtUserNo);
	
	if(userNo != cmtUserNo) {
		alert("본인이 쓴 글이 아니므로 삭제가 불가능합니다!");
		return;
	}  else {
		console.log("삭제가능");
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath }/${authUser.id}/remove",		
		type : "post",
		data : {cmtNo: cmtNo},
		dataType : "json",
		success : function(result) {
			if(result==true) {
				$("#cmt").remove();//result가 true면 하단 tr의 id값을 지우렴.
				
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


$("#btnBtnPostDel").on("click",function(){
	
	if(confirm("정말 삭제하시겠습니까?") == true) {
		alert("글이 삭제되었습니다!");
	}else {
		return false;
	}
	
});
</script>

</html>