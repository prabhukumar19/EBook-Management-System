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
<title>Admin || Show Book</title>
</head>
<style>
.class {
	min-height: 450px;
}
</style>
<%@include file="styles.jsp"%>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid class p-2">
		<div class="row">
			<c:if test="${empty user }">
				<c:redirect url="../login.jsp"></c:redirect>
			</c:if>

			<c:if test="${not empty user }">
				<h4 class="text-center text-xl p-2 mt-2">Welcome, ${user.name }</h4>
			</c:if>
			<c:if test="${not empty success_message}">
				<div
					class="mt-2 alert alert-success alert-dismissible fade show mx-auto "
					role="alert" style="width: 50%;">
					${ success_message}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<c:remove var="success_message" scope="session" />
			</c:if>
			<c:if test="${not empty failed_message}">
				<p class="text-center text-danger">${failed_message}</p>
				<c:remove var="failed_message" scope="session" />
			</c:if>
			<table class="table table-striped text-center">
				<thead class="table-dark">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Book Image</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author Name</th>
						<th scope="col">Price</th>
						<th scope="col">Category</th>
						<th scope="col">Status</th>
						<th scope="col" colspan="2">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
					List<Book> books = dao.getBooks();
					for (Book book : books) {
					%>
					<tr>
						<th scope="row"><%=book.getId()%></th>
						<td><img src="../assets/images/<%=book.getImage()%>"
							style="width: 50px; height: 50px;" alt="<%=book.getImage()%>" /></td>
						<td><%=book.getName()%></td>
						<td><%=book.getAuthor_name()%></td>
						<td><span>&#8377;</span> <%=book.getPrice()%></td>
						<td><%=book.getCategory().toUpperCase()%></td>
						<td><%=book.getStatus().toUpperCase()%></td>
						<td><a href="edit_book.jsp?id=<%=book.getId()%>"
							class="btn btn-primary btn-sm rounded-pill">Edit</a> <a
							href="../delete?id=<%=book.getId()%>"
							class="btn btn-danger btn-sm rounded-pill">Delete</a></td>
					</tr>
					<%
					}
					%>


				</tbody>
			</table>
		</div>
	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>