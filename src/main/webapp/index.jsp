<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart - Home</title>

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


	<%
	/*get category name and category id*/
	String categoryName = request.getParameter("q");
	String categoryId = request.getParameter("pid");

	ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

	List<Product> list = null;

	if (categoryName == null || categoryId == null) {

		list = productDao.getAllProducts();

	} else {

		if ((categoryName.trim().equals("all")) && (categoryId.trim().equals("all"))) {

			list = productDao.getAllProducts();

		} else {

			int catId = Integer.parseInt(categoryId.trim());

			list = productDao.getProductByCategoryIdAndName(catId, categoryName);

		}

	}

	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

	List<Category> list2 = categoryDao.getAllCategory();
	%>

	<br>
	<br>
	<br>
	<br>

	<div class="container-fluid">
		<div class="row mx-2">
			<!-- show category -->
			<div class="col-md-2">
				<div class="list-group">
					<a
						href="home?q=all&otracker=search&otracker1=search&pid=all&marketplace=MyCart&ppt=sp&ppn=sp&ssid=d2ykeuft0w0000001664901652541&qH=03f00e8e9d0d0847"
						class="c-link list-group-item list-group-item-action active">
						All Products </a>
					<%
					for (Category category : list2) {
					%>
					<a
						href="home?q=<%=category.getCategoryTitle()%>&otracker=search&otracker1=search&pid=<%=category.getCategoryId()%>&marketplace=MyCart&ppt=sp&ppn=sp&ssid=d2ykeuft0w0000001664901652541&qH=03f00e8e9d0d0847"
						class="c-link list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>
			</div>
			<!-- show products -->
			<div class="col-md-10">
				<%
				if (list.isEmpty()) {
				%>
				<div class="card point-card p-3">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12 text-center">
								<i class="fa-solid fa-face-sad-cry fa-5x text-success"></i>
								<h1 class="text-success">Sorry !! Products are not found !!</h1>
								<h3 class="text-success">We are sorry, this category
									products are not available in our store!</h3>
							</div>
						</div>
					</div>
				</div>
				<%
				} else {
				%>

				<div class="row">
					<%
					for (Product product : list) {
					%>
					<div class="card point-card m-2" style="width: 18rem;">
						<img class="card-img-top p-3"
							src="img/products/<%=product.getProductPhoto()%>"
							alt="Card image cap"
							style="max-height: 250px; max-width: 100%; width: auto;">
						<div class="card-body">
							<h6 class="card-title"><%=Helper.getTenWords(product.getProductName())%></h6>
							<p class="card-subtitle">
								<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <b><%=Helper.getDiscount(product.getProductPrice(), product.getProductDiscount())%></b>
								<del class="text-muted">
									<span class="text-muted ml-1"> <i
										class="fa-solid fa-indian-rupee-sign"></i> <%=product.getProductPrice()%>
									</span>
								</del>
								<b class="ml-2 text-success"><%=product.getProductDiscount()%>%
									off</b>
							</p>
						</div>
						<div class="card-footer text-center">
							<button class="btn custom-bg text-white"
								onclick="addToCart(<%=product.getProductId()%> , '<%=product.getProductName()%>' , <%=Helper.getDiscount(product.getProductPrice(), product.getProductDiscount())%> , <%=product.getProductQuantity()%>)">Add
								to Cart</button>
							<button class="btn btn-success">Buy Now</button>
						</div>
					</div>
					<%
					}
					%>
				</div>

				<%
				}
				%>
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
	
	<%@include file="../components/common_modals.jsp" %>

</body>
</html>