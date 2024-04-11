<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.height {
min-height: 530px;
}
</style> 
<body class="">
<%@include file="components/navbar.jsp"%>
<div class="height text-center mt-2">About us Page</div>
<%@include file="components/footer.jsp"%>
</body>
</html>