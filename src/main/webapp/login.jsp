<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
.class {
	min-height: 520px;
}
</style>
<%@include file="assets/styles.jsp"%>
<body style="background: #f0f1f2;">
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid m-2 class mx-auto">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<h4 class="text-center mt-2" style="font-size: 20px;">Login</h4>
					<c:if test="${not empty loginFailed}">
						<p class="text-center text-danger">${loginFailed}</p>
						<c:remove var="loginFailed" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="login" method="post">
							<div class="form-group mb-2">
								<label for="email" class="form-label">Email address</label> <input
									type="email" class="form-control" id="email"
									placeholder="Email" required aria-describedby="email"
									name="email" />
								<!-- <div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div> -->
							</div>
							<div class="form-group mb-2">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									placeholder="Password" required name="password" />
							</div>
							<button type="submit" class="btn btn-primary mt-2">Login</button>
							<p class="mt-2">
								<a href="register.jsp" style="text-decoration: none;" class="">Create
									an Account</a>
							</p>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>