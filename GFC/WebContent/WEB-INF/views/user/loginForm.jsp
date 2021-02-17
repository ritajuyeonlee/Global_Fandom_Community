<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Custom styles for this template -->
<link href="css/loginForm.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<title>Login Form</title>
<script>
	var msg = '${msg}';
	if (msg === "fail") {
		alert("Login Fail. Check your ID or PASSWORD.")
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
					<form class="box" action="loginUser" method="post">
						<h1>Login</h1>
						<p class="text-muted">Hello K-pop fan</p><br>
						<input type="text" name="userid" placeholder="Enter ID" id="userid" value="" required="required"> <br>
						<input type="password" id="userpw" name="userpw" value="" required="required" placeholder="Enter Password"><br> 
						<input type="submit" value="Login"> <a class="forgot text-muted" href="addUserForm">JOIN HERE</a>
					</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>