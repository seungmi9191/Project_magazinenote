<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/views/includes/head.jsp"></c:import>

<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

 <script>
    var editor;
    CKEDITOR.on( 'instanceReady', function( ev ) {
        editor = ev.editor;
        document.getElementById( 'readOnlyOn' ).style.display = '';
        editor.on( 'readOnly', function() {
            document.getElementById( 'readOnlyOn' ).style.display = this.readOnly ? 'none' : '';
            document.getElementById( 'readOnlyOff' ).style.display = this.readOnly ? '' : 'none';
        });
    });
   
    function toggleReadOnly( isReadOnly ) {
        editor.setReadOnly( isReadOnly );
    }
    
    function toggleReadOnly( isReadOnly ) {
        editor.setReadOnly( isReadOnly );
    }

</script>
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
						<a href="${pageContext.request.contextPath}/${authUser.id}/admin/cate">카테고리관리</a> &nbsp; | &nbsp; 
						<a href="${pageContext.request.contextPath}/${authUser.id}/admin/write"> <b class="b">글 작성</b></a></p>
					</div>
				</div>
			</section>
	 </div>
		
	  <div id="join-a-c">
	  <div class="container">			
	   <form id="writeSetting" name="writeSetting" action="${pageContext.request.contextPath}/${authUser.id}/admin/write" method="POST" enctype="multipart/form-data">
                  <table class="admin-cat-write">
                     <tr>
                        <td class="t">제목</td>
                        <td class="text-left">
                           <input type="text" size="60" name="postTitle" id="postTitle" value="${postVo.postTitle}">
                           <select name="cateNo" id="cateNo">
                           	 
                              		<option value="${postVo.cateNo}"></option>
                             
                           </select>
                        </td>
                     </tr>
                     
                     <tr>
                        <td class="t">내용</td>
             			 <td><textarea rows="10" cols="80" name="postContent" id="postContent">${postVo.postContent}</textarea>
             			 
             			 <script>
                  			CKEDITOR.replace('postContent',{
                     		toolbar: 'Full',
                 			 });
             		</script>
             			 
                        </td>
                     </tr>
                     <tr>
                        <td></td>
                        <td class="text-left">
                           <input type="file" name="file" id="file"><br/>
                        </td>
                     </tr>
                     
                     <tr>
                          <td><input type="hidden" name="blogNo" id="blogNo" value="${blogVo.blogNo}"><br/></td>
                          <td><input type="hidden" name="postImage" id="postImage" value="default"><br/></td>
                     </tr>
                     
                     <tr>
                        <td>&nbsp;<br/></td>
                        <td class="text-right">
                        <input type="submit" class="btn btn-success" id="btn-submit" value="포스트 등록" ><br/><br/></td>
                     </tr>
               </table>
       </form> 
	</div>
	</div>
	<!-- footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	</div>
	<c:import url="/WEB-INF/views/includes/main-script.jsp"></c:import>	

</body>

<script type="text/javascript">

 $("#writeSetting").on("submit", function(){
		console.log("안녕");
		if(validation() == true) {
			return true;
		} else {
			return false;
		}
	});
		
	function validation() {
		
		//제목
		/* if(!$("#postTitle").val()) {
			alert('제목을 입력해주세요!');
			$("#postTitle").focus();
			return false;
		} */
		
		//내용입력
		/* if(!$("#postContent").val()) {
			alert('내용을 입력해주세요!');
			return false;
		} */
		
		//사진
		/* if(!$("#file").val()) {
			alert('파일을 첨부해주세요!');
			return false;
		} */
		
		alert("글이 수정되었습니다!");
		return true;		
	}

</script>
</html>