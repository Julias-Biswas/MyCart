/**
 * 
 */

//product add to cart on client side
function addToCart(productId, productName, productPrice, productQuantity) {

	let cart = localStorage.getItem("cart");

	if (productQuantity > 0) {

		if (cart == null) {

			//no cart yet
			let products = [];
			let product = { productId: productId, productName: productName, productPrice: productPrice, productQuantity: 1 };

			products.push(product);

			localStorage.setItem("cart", JSON.stringify(products));

			//console.log("Product is added first time !!");

			showToast("Item added to cart successfully");

		} else {

			//cart is already present
			let productCart = JSON.parse(cart);

			let oldProduct = productCart.find((item) => item.productId == productId);

			if (oldProduct) {

				//we have to increase the quantity
				oldProduct.productQuantity = oldProduct.productQuantity + 1;

				if (productQuantity >= oldProduct.productQuantity) {

					productCart.map((item) => {
						if (item.productId == oldProduct.productId) {

							item.productQuantity = oldProduct.productQuantity;

						}
					})

					localStorage.setItem("cart", JSON.stringify(productCart));

					//console.log("Product quantity is increased !!");

					showToast("Item quantity increased successfully, Quantity = " + oldProduct.productQuantity);

				} else {

					//console.log("You can't increase quantity of this product");

					showToast("Item quantity increased failed");

				}

			} else {

				//we have to add the product
				let product = { productId: productId, productName: productName, productPrice: productPrice, productQuantity: 1 };

				productCart.push(product);

				localStorage.setItem("cart", JSON.stringify(productCart));

				//console.log("New Product is added !!");

				showToast("Item added to cart successfully");

			}

		}

	} else {

		//console.log("Sorry, Product Quantity is not available right now !!");

		showToast("Item quantity not available right now !!");

	}

	updateCart();

}

//update cart
function updateCart() {

	let cartString = localStorage.getItem("cart");

	let cart = JSON.parse(cartString);

	if (cart == null || cart.length == 0) {

		console.log("Cart is empty !!");

		$(".cart-items").html("(0)");
		$(".cart-body").html("<h2 class='text-danger text-center'>Cart does not have any items !!</h2>");
		$(".checkout-btn").addClass('disabled');
		//$(".checkout-btn").attr('disabled', true);

	} else {

		//there is some in cart to show
		console.log(cart);

		$(".cart-items").html(`(${cart.length})`);

		let table = `
			
			<table class='table'>
				<thead class='thead-light'>
					<tr>
						<th>Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
					</tr>
				</thead>
				
		`;

		let totalPrice = 0;

		cart.map((item) => {

			table += `
			
				<tr>
					<td>${item.productName}</td>
					<td>${(item.productPrice).toFixed(2)}</td>
					<td>${item.productQuantity}</td>
					<td>${(item.productPrice * item.productQuantity).toFixed(2)}</td>
					<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger'>REMOVE</button></td>
				</tr>
			
			`

			totalPrice += item.productPrice * item.productQuantity;

		})


		table = table + `
		
			
			<tr>
				<td colspan='5' class='text-success text-right m-5'><h4>Total Amount : ${(totalPrice).toFixed(2)}</h4></td>
			</tr>
			
		</table>`;

		$(".cart-body").html(table);

		$(".checkout-btn").removeClass('disabled');
		//$(".checkout-btn").attr('disabled', false);

	}


}

//delete item from cart
function deleteItemFromCart(productId) {

	let cart = JSON.parse(localStorage.getItem("cart"));

	let newCart = cart.filter((item) => item.productId != productId);

	localStorage.setItem('cart', JSON.stringify(newCart));

	updateCart();

	showToast("Item remove from cart successfully !!");

}


$(document).ready(function() {

	updateCart();

})

//toast
function showToast(content) {

	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 3000);

}

