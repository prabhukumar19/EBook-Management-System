<%@page import="com.DB.DBConnection"%>
<%@page import="com.entity.Book"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin || Edit Book</title>
</head>
<%@include file="styles.jsp"%>

<style>
.class {
	min-height: 450px;
}
</style>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container class p-2 pb-3">
		<div class="row ">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class=" container d-flex align-items-center justify-content-between mt-2">
						<h5 class="">Edit Book</h5>
						<a href="show_books.jsp">
							<button class="btn btn-outline-primary btn-sm rounded-pill">Back</button>
						</a>
					</div>

					<div class="card-body">

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
						Book book = dao.getBookById(id);
						%>

						<form action="../edit" method="post">

							<input type="hidden" name="id" id="id" value="<%=book.getId()%>" />
							<div class="mb-3">
								<label for="name" class="form-label">Book Name<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="name" name="name" placeholder="Name"
									value="<%=book.getName()%>" />
							</div>
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="authorName" name="authorName"
									placeholder="Author Name" value="<%=book.getAuthor_name()%>" />
							</div>
							<div class="mb-3">
								<label for="price" class="form-label">Price<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="price" name="price"
									placeholder="Price" value="<%=book.getPrice()%>" />
							</div>
							<div class="mb-2">
								<label for="book_category" class="form-label">Book
									Category<span class="text-danger">*</span>
								</label> <select class="form-select" aria-label="Select Category"
									id="book_category" name="book_category">
									<%
									if ("new".equals(book.getCategory())) {
									%>
									<option value="new">New</option>
									<option value="old">Old</option>
									<%
									} else {
									%>
									<option value="old">Old</option>
									<option value="new">New</option>
									<%
									}
									%>


								</select>
							</div>
							<div class="mb-2">
								<label for="book_status" class="form-label">Book Status<span
									class="text-danger">*</span>
								</label> <select class="form-select" aria-label="Select Status"
									id="book_status" name="book_status">
									<%
									if ("active".equals(book.getStatus())) {
									%>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="inactive">Inactive</option>
									<option value="active">Active</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label for="book_image" class="form-label">Upload Photo
								</label> <input class="form-control" type="file" id="book_image"
									name="book_image">
							</div>
							<div class="mb-3">
								<img src="../assets/images/<%=book.getImage()%>"
									style="width: 100%; height: 150px;" alt="<%=book.getImage()%>" />
							</div>
							<button type="submit"
								class="btn btn-outline-primary rounded-pill">Update
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>