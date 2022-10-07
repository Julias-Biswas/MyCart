
<%@page import="com.mycart.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg"
	style="width: 100%; top: 0px; left: 0px; position: fixed; z-index: 100;">
	<div class="container">
		<a class="navbar-brand" href="home">MyCart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Mobile</a> <a
							class="dropdown-item" href="#">Laptop</a> <a
							class="dropdown-item" href="#">Book</a> <a class="dropdown-item"
							href="#">Pen</a>
					</div></li>
			</ul>

			<ul class="navbar-nav ml-auto">

				<li class="nav-item active"><a class="nav-link" href="mycart"
					data-toggle="modal" data-target="#cartModal"> <i
						class="fa-solid fa-cart-shopping fa-1x"></i> <span
						class="cart-items">(0)</span> Cart
				</a></li>

				<%
				if (user1 == null) {
				%>

				<li class="nav-item active"><a class="nav-link" href="login">Sign
						In </a></li>
				<li class="nav-item active"><a class="nav-link" href="reg">Sign
						Up </a></li>

				<%
				} else {

				if (user1.getUserType().equals("admin")) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="seller-profile"> <%=user1.getUserName()%></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">Logout</a></li>

				<%
				} else if (user1.getUserType().equals("normal")) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="user-profile"> <%=user1.getUserName()%></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">Logout</a></li>

				<%
				} else {
				%>

				<li class="nav-item active"><a class="nav-link" href="login">Sign
						In </a></li>
				<li class="nav-item active"><a class="nav-link" href="reg">Sign
						Up </a></li>

				<%
				}
				}
				%>


			</ul>
		</div>
	</div>
</nav>