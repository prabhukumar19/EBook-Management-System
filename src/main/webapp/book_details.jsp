<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
</head>
<%@include file="assets/styles.jsp"%>
<style>
.background-image {
	background: url("assets/images/background.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.minHeight {
	min-height: 530px;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container mt-2">
		<div class="row">
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			Book bookDetails = dao.getBookById(id);
			%>
			<div class="col-md-6 text-center p-5 border bg-white mb-3 ">
				<img src="assets/images/<%=bookDetails.getImage()%>"
					alt="book_image" height="200px" width="200px" />
				<p class="mt-3">
					Book Name :- <span class="text-success"><%=bookDetails.getName()%></span>
				</p>
				<p>
					Price :- <span class="text-success"><i class="fa-solid fa-indian-rupee-sign"></i> <%=bookDetails.getPrice()%></span>
				</p>
				<p>
					Author name :- <span class="text-success"><%=bookDetails.getAuthor_name()%></span>
				</p>
				<p>
					Book Category :- <span class="text-success"><%=bookDetails.getCategory().toUpperCase()%>
					</span>
				</p>
				<p>
					Stock :- <span class="text-success">Available</span>
				</p>
			</div>

			<div class="col-md-6 text-center p-5  border bg-white mb-3">
				<h2 class="mb-4"><%=bookDetails.getName()%></h2>
				<%
				if ("old".equals(bookDetails.getCategory())) {
				%>
				<h5 class="text-primary">
					<i class="fa-solid fa-user"></i> Contact to Seller
				</h5>
				<h5 class="text-primary" style="cursor: pointer;" >
					<i class="fa-solid fa-envelope"></i> Email :-
					<%=bookDetails.getUser_email()%></h5>
				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<%
				if ("old".equals(bookDetails.getCategory())) {
				%>
				<div class="text-center mx-auto">
					<a href="index.jsp" class="btn btn-success btn-sm p-2 rounded-pill"><i
						class="fa fa-cart-plus"></i> Continue Shopping</a> <a
						class="btn btn-danger btn-sm p-2 rounded-pill" href=""><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center mx-auto">
					<a href="" class="btn btn-primary btn-sm p-2 rounded-pill"><i
						class="fa fa-cart-plus"></i> Add to Cart</a> <a
						class="btn btn-danger btn-sm p-2 rounded-pill" href=""><i
						class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>
				<%
				}
				%>
			</div>

		</div>

	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>