<%@page import="com.DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book Management System</title>
<%@include file="assets/styles.jsp"%>
</head>
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
	<div class="contaner-fluid background-image">
		<h2 class="text-center text-white p-4">
			<i class="fa-solid fa-book"></i> E-Book Management System
		</h2>
	</div>

	<%@include file="components/recentbook.jsp"%>
	<%@include file="components/newbook.jsp"%>
	<%@include file="components/oldbook.jsp"%>
	<%@include file="components/footer.jsp"%>
</body>
</html>