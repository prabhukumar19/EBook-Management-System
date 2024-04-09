
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("../login.jsp");

}
%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User || Home</title>
</head>
<body>
	<h1>Home :User</h1>
	<c:if test="${not empty user }">
		<p>Name : ${user.name }</p>
	</c:if>
</body>
</html>