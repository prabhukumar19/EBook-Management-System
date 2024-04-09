<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<table class="table table-striped text-center">
				<thead class="table-dark">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Contact No</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author Name</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
						<th scope="col">Order Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">OR123456</th>
						<td>Prabhu Kumar</td>
						<td>prabhukumar636@gmail.com</td>
						<td>C-20 Extension New Ashok Nagar</td>
						<td>1234567890</td>
						<td>Java Programming</td>
						<td>Prabhu Aryan</td>
						<td>299</td>
						<td>COD</td>
						<td>Delivered</td>
					</tr>
					<tr>
						<th scope="row">OR123456</th>
						<td>Prabhu Kumar</td>
						<td>prabhukumar636@gmail.com</td>
						<td>C-20 Extension New Ashok Nagar</td>
						<td>1234567890</td>
						<td>Java Programming</td>
						<td>Prabhu Aryan</td>
						<td>299</td>
						<td>COD</td>
						<td>Delivered</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>