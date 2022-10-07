<%@page import="com.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("error", "You are not logged in !! Login first");

	response.sendRedirect("login");

	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Checkout Now</title>

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

	<br>
	<br>

	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-8">
				<!-- Cart -->
				<div class="cart">
					<h2 class="text-center text-info mb-3">Your Selected Items</h2>

					<div class="cart-body" style="border: 0.5px dotted #454545;"></div>
				</div>
			</div>
			<div class="col-md-4">
				<!-- Show Price with discount -->
				<div class="cart">
					<h2 class="text-center text-success mb-3">Your details for
						order</h2>

					<!-- For Show Message -->
					<%@include file="../components/message.jsp"%>
					<%@include file="../components/error.jsp"%>

					<div class="card-body" style="border: 0.5px dotted #454545;">
						<form class="needs-validation" novalidate action="" method="POST">
							<div class="form-row">
								<div class="col-md-12 mb-3">
									<label for="userName">Your Name</label><span
										class="text-danger"> *</span> <input type="text"
										class="form-control" id="userName" placeholder="Your Name"
										name="userName" value="<%=user.getUserName()%>" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Please enter valid name</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-12 mb-3">
									<label for="userEmail">Your Email</label><span
										class="text-danger"> *</span> <input type="email"
										class="form-control" id="userEmail"
										placeholder="name@example.com" aria-describedby="emailHelp"
										name="userEmail" value="<%=user.getUserEmail()%>" required
										readonly> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Please enter valid email</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-12 mb-3">
									<label for="userPhone">Your Phone No</label><span
										class="text-danger"> *</span> <input type="number"
										class="form-control" id="userPhone" placeholder="Your Phone"
										name="userPhone" value="<%=user.getUserPhone()%>" required>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Please enter valid phone</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col-md-12 mb-3">
									<label for="userAddress">Your Shipping Address</label><span
										class="text-danger"> *</span>
									<textarea class="form-control" id="userAddress"
										placeholder="Your Shipping Address" name="userAddress"
										rows="num" cols="num" style="resize: none" required><%=user.getUserAddress()%></textarea>
									<div class="valid-feedback">Looks good!</div>
									<div class="invalid-feedback">Please enter valid address</div>
								</div>
							</div>
							<div class="form-group">
								<div class="form-check text-center">
									<input class="form-check-input" type="checkbox" value=""
										id="invalidCheck" required> <label
										class="form-check-label" for="invalidCheck"> Agree to
										terms and conditions </label>
									<div class="invalid-feedback">You must agree before
										order.</div>
								</div>
							</div>
							<div class="container text-center my-4">
								<button class="btn btn-success border-0" type="submit">Order
									Now</button>
								<a href="home" class="btn btn-info border-0" type="reset">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

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