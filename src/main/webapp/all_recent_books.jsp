<%@page import="com.DB.DBConnection"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All_recent_book</title>
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
</style>
<body>
	<%@include file="components/navbar.jsp"%>
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
							<a class="btn btn-outline-danger btn-sm rounded-pill "
								style="border-radius: 5px;"><i class="fa-solid fa-cart-plus"></i>
								Add to Cart</a> <a href="book_details.jsp?id=<%=book.getId() %>"
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
			<!-- <div class="text-center mt-3">
				<a href="all_recent_books.jsp"><button class="btn btn-outline-danger btn-sm rounded-pill">View
					All</button></a>
			</div> -->
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>