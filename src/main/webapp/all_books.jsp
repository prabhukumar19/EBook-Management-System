<%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Books</title>
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

#snackbar {
	visibility: hidden;
	min-width: 180px;
	margin-left: -125px;
	background-color: green;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 8px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 17px;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<body>
	<%
	User user = (User) session.getAttribute("user");
	%>
	<c:if test="${not empty cart_success }">
		<div id="snackbar" class="text-success">${cart_success }</div>
		<c:remove var="cart_success" scope="session" />
		<script>
			toast();
			function toast() {
				var x = document.getElementById("snackbar");
				x.className = "show";
				setTimeout(function() {
					x.className = x.className.replace("show", "");
				}, 3000);
			}
		</script>
	</c:if>

	<c:if test="${not empty cart_failed }">
		<div id="snackbar">${cart_failed }</div>
		<c:remove var="cart_failed" scope="session" />
		<script>
			toast();
			function toast() {
				var x = document.getElementById("snackbar");
				x.className = "show";
				setTimeout(function() {
					x.className = x.className.replace("show", "");
				}, 3000);
			}
		</script>
	</c:if>
	<%@include file="components/navbar.jsp"%>
	<!-- All Recent Books -->
	<div class="container mb-3">
		<h3 class="text-center m-3">
			<i class="fa-solid fa-book"></i> Recent Books
		</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			List<Book> recentBooks = dao.getAllRecentBooks();
			for (Book book : recentBooks) {
			%>
			<div class="col-md-3">
				<div class="card mt-4">
					<div class="card-body text-center">
						<img src="assets/images/<%=book.getImage()%>" class="img-thumblin"
							alt="" style="width: 150px; height: 200px;" />
						<p class="mt-2"><%=book.getName()%></p>
						<p>
							Category :
							<%=book.getCategory().toUpperCase()%></p>
						<p>
							Author:
							<%=book.getAuthor_name()%></p>
						<div class="btn-group gap-2">
							<%
							if (user == null) {
							%>
							<a href="login.jsp"
								class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a>

							<%
							} else {
							%>
							<a href="cart?bookId=<%=book.getId()%>&&userId=<%=user.getId()%>"
								class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a>
							<%
							}
							%>
							<a href="book_details.jsp?id=<%=book.getId()%>"
								class="btn btn-outline-success btn-sm rounded-pill"
								style="border-radius: 5px;"><i class="fa-solid fa-eye"></i>
								View</a> <a class="btn btn-outline-primary btn-sm rounded-pill"
								style="border-radius: 5px;"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!-- All New Books -->
	<div class="container mb-3">
		<h3 class="text-center m-3">
			<i class="fa-solid fa-book"></i> New Books
		</h3>
		<div class="row">
			<%
			List<Book> AllNewBooks = dao.getAllNewBooks();
			for (Book book : AllNewBooks) {
			%>
			<div class="col-md-3">
				<div class="card mt-4">
					<div class="card-body text-center">
						<img src="assets/images/<%=book.getImage()%>" class="img-thumblin"
							alt="" style="width: 150px; height: 200px;" />
						<p class="mt-2"><%=book.getName()%></p>
						<p>
							Category :
							<%=book.getCategory().toUpperCase()%></p>
						<p>
							Author:
							<%=book.getAuthor_name()%></p>
						<div class="btn-group gap-2">
						<%
							if (user == null) {
							%>
							<a href="login.jsp"
								class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a>

							<%
							} else {
							%>
							<a href="cart?bookId=<%=book.getId()%>&&userId=<%=user.getId()%>"
								class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a>
							<%
							}
							%>
							<a href="book_details.jsp?id=<%=book.getId()%>"
								class="btn btn-outline-success btn-sm rounded-pill"
								style="border-radius: 5px;"><i class="fa-solid fa-eye"></i>
								View</a> <a class="btn btn-outline-primary btn-sm rounded-pill"
								style="border-radius: 5px;"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<!-- Old Books -->
	<div class="container mb-3">
		<h3 class="text-center m-3">
			<i class="fa-solid fa-book"></i> Old Books
		</h3>
		<div class="row">
			<%
			List<Book> allOldBooks = dao.getAllOldBooks();
			for (Book book : allOldBooks) {
			%>
			<div class="col-md-3">
				<div class="card mt-4">
					<div class="card-body text-center">
						<img src="assets/images/<%=book.getImage()%>" class="img-thumblin"
							alt="" style="width: 150px; height: 200px;" />
						<p class="mt-2"><%=book.getName()%></p>
						<p>
							Category :
							<%=book.getCategory().toUpperCase()%></p>
						<p>
							Author:
							<%=book.getAuthor_name()%></p>
						<div class="btn-group gap-2">
						<%
							if (user == null) {
							%>
							<a href="login.jsp"
								class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a>

							<%
							} else {
							%>
							<a href="cart?bookId=<%=book.getId()%>&&userId=<%=user.getId()%>"
								class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a>
							<%
							}
							%>
							<a href="book_details.jsp?id=<%=book.getId()%>"
								class="btn btn-outline-success btn-sm rounded-pill"
								style="border-radius: 5px;"><i class="fa-solid fa-eye"></i>
								View</a> <a class="btn btn-outline-primary btn-sm rounded-pill"
								style="border-radius: 5px;"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>