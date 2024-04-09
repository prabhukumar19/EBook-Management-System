<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin || Home</title>
<%@include file="styles.jsp"%>
</head>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.class {
	min-height: 450px;
}
</style>
<body class="class">
	<%@include file="navbar.jsp"%>
	<c:if test="${not empty user }">
		<h3 class="text-center text-xl p-2 m-3">Welcome, ${user.name }</h3>
	</c:if>

	<div class="container class">
		<div class="row d-flex justify-content-center align-items-center p-5">
			<div class="col-md-2">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<i class="fa-solid fa-plus fa-3x text-primary mb-1"></i>
							<h6>Add Book</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2">
				<a href="show_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book fa-3x text-warning mb-1"></i>
							<h6>All Books</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-danger mb-1"></i>
							<h6>Orders</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-2">

				<a href="#">
					<div class="card">
						<div class="card-body text-center ">
							<i class="fa-solid fa-sign-out-alt fa-3x text-primary mb-1"></i>
							<h6>Log out</h6>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>