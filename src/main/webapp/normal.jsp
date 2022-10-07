<%@page import="com.mycart.entities.User"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("error", "You are not logged in !! Login first");

	response.sendRedirect("login");

	return;
} else {

	if (user.getUserType().equals("admin")) {

		session.setAttribute("error", "You are not user !! Do not access this page");

		response.sendRedirect("login");

		return;
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - User Panel</title>

<style type="text/css">
/*  Scroll Button Design Start  */
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 25px;
	z-index: 99;
	font-size: 24px;
	font-weight: 800;
	border: 0px solid #ebebfb;
	outline: none;
	color: #666666;
	cursor: pointer;
	padding: 15px;
	border-radius: 50%;
}

#myBtn:hover {
	color: #000000;
}
/*  Scroll Button Design End  */
</style>

<!-- set all links  -->
<%@include file="../components/link.jsp"%>

</head>
<body>

	<!--  Scroll Button Start  -->
	<i onclick="topFunction()" id="myBtn" title="Go to Top"
		class="fa-solid fa-angle-up"></i>
	<!--  Scroll Button End  -->

	<!-- Navbar Before Sign in -->
	<%@include file="../components/navbar.jsp"%>

	<br>
	<br>
	<br>
	<br>

	

	<br>
	<br>
	<br>
	<br>

	<!-- Footer -->
	<div class="mt-5">
		<%@include file="../components/footer.jsp"%>
	</div>


	<!--  Go To Top in the Page Start  -->
	<script>
		//Get the button
		var mybutton = document.getElementById("myBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction();
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>
	<!--  Go To Top in the Page End  -->

	<!-- Sign Up from Validation Start -->
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>
	<!-- Sign Up from Validation End -->

	<%@include file="../components/common_modals.jsp"%>

</body>
</html>