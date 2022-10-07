<%@page import="java.util.Map"%>
<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.dao.CategoryDao"%>
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

	if (user.getUserType().equals("normal")) {

		session.setAttribute("error", "You are not admin !! Do not access this page");

		response.sendRedirect("login");

		return;
	}

}
%>

<%
CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

List<Category> list = categoryDao.getAllCategory();

ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

List<Product> list2 = productDao.getAllProducts();

//getting count
Map<String, Long> map = Helper.getCounts(FactoryProvider.getFactory());

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Admin Panel (<%=user.getUserName()%>)
</title>

<style type="text/css">
/*  For Box Shadow Start  */
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
/*  For Box Shadow End  */

/*  Card Hover Start  */
.card {
	transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s
		box-shadow, .3s -webkit-transform
		cubic-bezier(.155, 1.105, .295, 1.12);
	cursor: pointer;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
}

/*  For Responsive All Pages  */
@media ( max-width : 990px) {
	.card {
		margin: 20px;
	}
}
/*  Card Hover End  */
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
	<!-- For Show Message -->
	<%@include file="../components/message.jsp"%>
	<%@include file="../components/error.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-4">
				<div class="card point-card mb-2">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded" alt="User Icon"
								src="img/users.png" style="max-width: 100px;">
						</div>
						<h1 class="text-success"><%= map.get("userCount") %></h1>
						<h1 class="card-title text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card point-card mb-2">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded" alt="User Icon"
								src="img/category.png" style="max-width: 100px;">
						</div>
						<h1 class="text-info"><%=list.size()%></h1>
						<h1 class="card-title text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card point-card mb-2">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded" alt="User Icon"
								src="img/products.png" style="max-width: 100px;">
						</div>
						<h1 class="text-warning"><%=map.get("productCount")%></h1>
						<h1 class="card-title text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card point-card mb-2" data-toggle="modal"
					data-target="#addCategoryModal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded mb-3" alt="User Icon"
								src="img/add-category.png" style="max-width: 100px;">
						</div>
						<p class="text-primary">Click here to add new category</p>
						<h1 class="card-title text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card point-card mb-2" data-toggle="modal"
					data-target="#addProductModal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded mb-3" alt="User Icon"
								src="img/add-products.png" style="max-width: 100px;">
						</div>
						<p class="text-warning">Click here to add new product</p>
						<h1 class="card-title text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div class="mt-5">
		<%@include file="../components/footer.jsp"%>
	</div>


	<!-- Add Category Modal Start -->
	<!-- Modal -->
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title text-white" id="exampleModalLabel">Add
						Category</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" novalidate
						action="ProductOperationServlet" method="POST">
						<input type="text" name="operationName" value="AddCategory"
							style="display: none;">
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="categoryTitle">Category Title</label><span
									class="text-danger"> *</span> <input type="text"
									class="form-control" id="categoryTitle"
									placeholder="Category Title" aria-describedby="emailHelp"
									name="categoryTitle" required>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid category
									title</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="categoryDescription">Category Description</label>
								<textarea class="form-control" id="categoryDescription"
									placeholder="Category Description" name="categoryDescription"
									style="height: 150px; resize: none;"></textarea>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid category
									description</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-check text-center">
								<input class="form-check-input" type="checkbox" value=""
									id="invalidCheck" required> <label
									class="form-check-label" for="invalidCheck"> Check
									category title and category description </label>
								<div class="invalid-feedback">You must check before
									submit.</div>
							</div>
						</div>
						<div class="container text-center my-2">
							<button class="btn btn-success" type="submit">Add
								Category</button>
							<button class="btn btn-danger" type="reset">Reset</button>
						</div>
					</form>
				</div>
				<div class="modal-footer bg-primary"></div>
			</div>
		</div>
	</div>
	<!-- Add Category Modal End -->

	<!-- Add Product Modal Start -->
	<!-- Modal -->
	<div class="modal fade" id="addProductModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" novalidate
						action="ProductOperationServlet" method="POST"
						enctype="multipart/form-data">
						<input type="text" name="operationName" value="AddProduct"
							style="display: none;">
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productTitle">Product Title</label><span
									class="text-danger"> *</span> <input type="text"
									class="form-control" id="productTitle"
									placeholder="Product Title" aria-describedby="emailHelp"
									name="productTitle" required>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid product
									title</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productDescription">Product Description</label>
								<textarea class="form-control" id="productDescription"
									placeholder="Product Description" name="productDescription"
									style="height: 150px; resize: none;"></textarea>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid product
									description</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productPrice">Product Price</label><span
									class="text-danger"> *</span> <input type="text"
									class="form-control" id="productPrice"
									placeholder="Product Price" aria-describedby="emailHelp"
									name="productPrice" required>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid product
									price</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productDiscount">Product Discount</label><span
									class="text-danger"> *</span> <input type="text"
									class="form-control" id="productDiscount"
									placeholder="Product Discount" aria-describedby="emailHelp"
									name="productDiscount" required>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid product
									discount</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productQuantity">Product Quantity</label><span
									class="text-danger"> *</span> <input type="text"
									class="form-control" id="productQuantity"
									placeholder="Product Quantity" aria-describedby="emailHelp"
									name="productQuantity" required>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please enter valid product
									quantity</div>
							</div>
						</div>



						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productCategoryId">Product Category</label><span
									class="text-danger"> *</span> <select class="custom-select"
									name="productCategoryId" required>
									<option value="">---Select Product Category---</option>
									<%
									for (Category category : list) {
									%>

									<option value="<%=category.getCategoryId()%>"><%=category.getCategoryTitle()%></option>

									<%
									}
									%>
								</select>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please choose valid product
									category</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12 mb-3">
								<label for="productImage">Product Image</label><span
									class="text-danger"> *</span> <input type="file"
									class="form-control" id="productImage"
									placeholder="Product Image" aria-describedby="emailHelp"
									name="productImage" required>
								<div class="valid-feedback">Looks good!</div>
								<div class="invalid-feedback">Please upload product image</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-check text-center">
								<input class="form-check-input" type="checkbox" value=""
									id="invalidCheck" required> <label
									class="form-check-label" for="invalidCheck"> Check
									product details before submit </label>
								<div class="invalid-feedback">You must check before
									submit.</div>
							</div>
						</div>
						<div class="container text-center my-2">
							<button class="btn btn-success" type="submit">Add
								Product</button>
							<button class="btn btn-danger" type="reset">Reset</button>
						</div>
					</form>
				</div>
				<div class="modal-footer bg-primary"></div>
			</div>
		</div>
	</div>
	<!-- Add Product Modal End -->


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