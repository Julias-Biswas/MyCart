<%@page import="com.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Sign In</title>

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
<%@include file="components/link.jsp"%>

</head>
<body>

	<!--  Scroll Button Start  -->
	<i onclick="topFunction()" id="myBtn" title="Go to Top"
		class="fa-solid fa-angle-up"></i>
	<!--  Scroll Button End  -->

	<!-- Navbar Before Sign in -->
	<%@include file="../components/navbar.jsp"%>

	<main class="d-flex align-items-center mt-5">
		<div class="container">
			<!-- Creating Sign In form -->
			<div class="row mt-5">
				<div class="col-md-6 offset-md-3">

					<div class="card">
						<div class="card-header bg-primary text-white">
							<h2 class="text-center">
								<img alt="Sign Up" src="img/signin.png" height="70">
							</h2>
							<h2 class="text-center my-1">Sign In Here !!</h2>
						</div>

						<!-- For Show Message -->
						<%@include file="../components/message.jsp"%>
						<%@include file="../components/error.jsp"%>

						<div class="card-body">
							<form class="needs-validation" novalidate action="LoginServlet"
								method="POST">
								<div class="form-row">
									<div class="col-md-12 mb-3">
										<label for="userEmail">Email</label><span class="text-danger">
											*</span> <input type="email" class="form-control" id="userEmail"
											placeholder="name@example.com" aria-describedby="emailHelp"
											name="userEmail" required> <small id="emailHelp"
											class="form-text text-muted">We'll never share your
											email with anyone else.</small>
										<div class="valid-feedback">Looks good!</div>
										<div class="invalid-feedback">Please enter valid email</div>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-12 mb-3">
										<label for="userPassword">Password</label><span
											class="text-danger"> *</span> <input type="password"
											class="form-control" id="userPassword"
											placeholder="Your Password" name="userPassword" required>
										<div class="valid-feedback">Looks good!</div>
										<div class="invalid-feedback">Please enter valid
											password</div>
									</div>
								</div>
								<div class="form-group">
									<div class="form-check text-center">
										<input class="form-check-input" type="checkbox" value=""
											id="invalidCheck" required> <label
											class="form-check-label" for="invalidCheck"> Check
											Email and Password </label>
										<div class="invalid-feedback">You must check before sign
											in.</div>
									</div>
								</div>
								<div class="container text-center my-2">
									<button class="btn btn-success" type="submit">Sign In</button>
									<button class="btn btn-danger" type="reset">Reset</button>
								</div>
								<div class="container text-center my-2">
									<a href="#" class="footer-hoperlink d-block">Forgot
										Password ?</a>
								</div>
								<p class="text-center">
									If Not Register ? <span class="text-uppercase"><a
										href="reg" class="footer-hoperlink">Click Here</a></span>
								</p>
							</form>
						</div>
						<div class="card-footer bg-primary"></div>
					</div>
				</div>
			</div>
		</div>
	</main>

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