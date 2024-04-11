<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin || Add Book</title>
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
					<div class="card-body">
						<h6 class="text-center">Add Book</h6>
						<c:if test="${empty user }">
							<c:redirect url="../login.jsp"></c:redirect>
						</c:if>

						<c:if test="${not empty success_message}">
							<p class="text-center text-success">${success_message}</p>
							<c:remove var="success_message" scope="session" />
						</c:if>
						<c:if test="${not empty failed_message}">
							<p class="text-center text-danger">${failed_message}</p>
							<c:remove var="failed_message" scope="session" />
						</c:if>
						<form action="../add" method="post" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="name" class="form-label">Book Name<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="name" name="name" placeholder="Name" />
							</div>
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name <span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="authorName" name="authorName"
									placeholder="Author Name" />
							</div>
							<div class="mb-3">
								<label for="price" class="form-label">Price<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" id="price" name="price"
									placeholder="Price" />
							</div>
							<div class="mb-2">
								<label for="book_category" class="form-label">Book
									Category<span class="text-danger">*</span>
								</label> <select class="form-select" aria-label="Select Category"
									id="book_category" name="book_category">
									<option>---Select---</option>
									<option value="new">New</option>
									<option value="old">Old</option>
								</select>
							</div>
							<div class="mb-2">
								<label for="book_status" class="form-label">Book Status<span
									class="text-danger">*</span>
								</label> <select class="form-select" aria-label="Select Status"
									id="book_status" name="book_status">
									<option>---Select---</option>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="book_image" class="form-label">Upload Photo
								</label> <input class="form-control" type="file" id="book_image"
									name="book_image">
							</div>
							<button type="submit"
								class="btn btn-outline-primary rounded-pill">Add Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>