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
<%@include file="assets/styles.jsp"%>
<body style="background: #f0f1f2; height: 100vh;">
	<%@include file="components/navbar.jsp"%>
	<div class="container m-2" style="min-height: 530px;">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration</h4>
						<c:if test="${not empty success_message}">
							<p class="text-center text-success">${success_message}</p>
							<c:remove var="success_message" scope="session" />
						</c:if>
						<c:if test="${not empty failed_message}">
							<p class="text-center text-danger">${failed_message}</p>
							<c:remove var="failed_message" scope="session" />
						</c:if>
						<form class="" method="post" action="register">
							<div class="form-group mb-2">
								<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" id="name" placeholder="Name"
									name="name" required autocomplete="false"/>
							</div>
							<div class="form-group mb-2">
								<label for="email" class="form-label">Email address</label> <input
									type="email" class="form-control" id="email"
									aria-describedby="email" required placeholder="Email" 
									name="email" autocomplete="false"/>
								<div id="email" class="form-text">We'll never share
									your email with anyone else.</div> 
							</div>
							<div class="form-group mb-2">
								<label for="contact" class="form-label">Contact No</label> <input
									type="text" class="form-control" id="contact"
									placeholder="Contact No" required name="contact" autocomplete="false" />
							</div>
							<div class="form-group mb-2">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password" required
									placeholder="Password" name="password" autocomplete="false"/>
							</div>
							<div class="form-group form-check mb-3 mt-1">
								<input type="checkbox" class="form-check-input" id="checkbox"
									name="check_condition" /> <label class="form-check-label"
									for="checkbox">Accept terms & condition</label>
							</div>
							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>