<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/main/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/main/js/SmoothScroll.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/main/js/lity.js"></script>
	<script src="${pageContext.request.contextPath}/assets/main/js/owl.carousel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/main/js/jquery.isotope.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/assets/main/js/top.js"></script>
	<!-- Custom Javascripts ================================================== -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/main/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/main/js/wow.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/assets/main/js/imagesloaded.js"></script>  --%>
	<script src="${pageContext.request.contextPath}/assets/main/js/classie.js"></script> 
	<script src="${pageContext.request.contextPath}/assets/main/js/AnimOnScroll.js"></script>  
	
	
	<!-- top menu ================================================== -->
	
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "320px";
			document.getElementById("main-block").style.marginRight = "320px";
		}
	
		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main-block").style.marginRight = "0";
		}
	</script>
	<script>
	/*====================================
	 wow
	 ======================================*/
	new WOW().init();
	</script>
	<script>
		// Bind as an event handler
		$(document).on('click', '[data-lightbox]', lity);
		;
	</script>
	<script>
		new WOW().init();
	</script>
	<script>
		// Bind as an event handler
		$(document).on('click', '[data-lightbox]', lity);
	</script>