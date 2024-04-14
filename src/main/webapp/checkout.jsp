<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@include file="assets/styles.jsp"%>
</head>

<style>
.alert {
	padding: 8px 5px;
}
</style>
<body>
	<%
	User userObj = (User) session.getAttribute("user");
	
	%>
	<%@include file="components/navbar.jsp"%>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<c:if test="${ not empty cart_removed}">
					<div
						class="alert alert-success text-center alert-dismissible fade show mt-2"
						role="alert">
						<p>${cart_removed }</p>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<c:remove var="cart_removed" scope="session" />
				</c:if>
				<c:if test="${ not empty cart_failed}">
					<div
						class="alert alert-danger text-center alert-dismissible fade show"
						role="alert">
						<p>${cart_failed }</p>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<c:remove var="cart_failed" scope="session" />
				</c:if>
				<div class="card bg-white mt-3 mb-3">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
								CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
								List<Cart> carts = dao.getCartByUserId(userObj.getId());
								double total = 0;
								for (Cart cart : carts) {
									total = cart.getTotalPrice();
								%>
								<tr>
									<td><%=cart.getBookName()%></td>
									<td><%=cart.getAuthor()%></td>
									<td><i class="fa-solid fa-indian-rupee-sign"></i><%=cart.getPrice()%></td>
									<td><a href="remove?bookId=<%=cart.getBookId()%>"
										class="btn btn-danger btn-sm">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<th>Total Price</th>
									<th></th>
									<th></th>
									<th><%=total%></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card bg-white mt-3 mb-3">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for order</h3>
						<form>
							<div class="form-row d-flex gap-1">
								<div class="form-group col-md-6">
									<label for="name">Name</label> <input type="text"
										class="form-control" name="name"
										value="<%=userObj.getName()%>" id="name" placeholder="Name" />
								</div>
								<div class="form-group col-md-6">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" placeholder="Email"
										disabled="disabled" value="<%=userObj.getEmail()%>" />
								</div>
							</div>
							<div class="form-group  col-md-12 mb-2 mt-2">
								<label for="address">Address</label><br />
								<textarea class="form-control" rows="" cols=""></textarea>

							</div>

							<div class="form-row d-flex gap-1">
								<div class="form-group col-md-6">
									<label for="city">City</label> <input type="text"
										class="form-control" id="city" />
								</div>
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark"
										placeholder="Apartment, studio, or floor" />
								</div>
							</div>
							<div class="form-row d-flex gap-1 mb-2 mt-2">
								<div class="form-group col-md-6">
									<label for="state">State</label> <input class="form-control"
										type="text" id="state" name="state" />
								</div>
								<div class="form-group col-md-6">
									<label for="zipcode">Pincode</label> <input type="text"
										class="form-control" id="zipcode">
								</div>
							</div>
							<div class="form-group mb-2 mt-2">
								<label for="paymentMode" class="">Payment Mode</label> <select
									class="form-control" id="paymentMode" name="paymentMode">
									<option>---Select---</option>
									<option value="COD">Cash on Delivery</option>
									<option value="DebitCard">Debit Card</option>
								</select>
							</div>
							<div class="button-group text-center mt-3">
								<button type="submit" class="btn btn-primary btn-sm">Order
									Now</button>
								<a href="index.jsp" class="btn btn-success btn-sm">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>