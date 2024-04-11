<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
	<div class="container-fluid p-4">
		<div class="row">
			<div class="col-md-5">
				<a href="home.jsp" style="text-decoration: none;">
					<h4 class="text-primary">
						<i class="fa-solid fa-book"></i> E-Book Management System
					</h4>
				</a>
			</div>
			<div class="col-md-4">
				<form class="d-flex ">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button
						class="btn btn-outline-success rounded-pill my-2 my-sm-0 d-flex p-2 justify-content-center align-items-center gap-1 "
						type="submit">
						<i class="fa-solid fa-magnifying-glass"></i> Search
					</button>
				</form>
			</div>

			<div class="col-md-3 text-center">
				<c:if test="${not empty user}">
					<a href="#" class="btn btn-secondary rounded-pill">
						<i class="fa-solid fa-user" style="font-size: 13px;"></i>
						${user.name}
					</a>
					<a href="../logout" class="btn btn-primary rounded-pill"> <i
						class="fa-solid fa-sign-out-alt" style="font-size: 15px;"></i>
						Logout
					</a>
				</c:if>
				<c:if test="${empty user}">
					<a href="../login.jsp" class="btn btn-success rounded-pill"> <i
						class="fa-solid fa-user"></i> Login
					</a>
					<a href="../register.jsp" class="btn btn-primary rounded-pill">
						<i class="fa-solid fa-user-plus"></i> Register
					</a>
				</c:if>

			</div>
		</div>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 gap-2">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"><i
							class="fa-solid fa-house"></i> Home</a></li>
				</ul>
				<form class="d-flex gap-2">
					<button class="btn btn-light rounded-pill" type="submit">
						<i class="fa-solid fa-gear"></i> Settings
					</button>
					<button class="btn btn-light rounded-pill" type="submit">
						<i class="fa-solid fa-user-gear"></i> Contact us
					</button>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>