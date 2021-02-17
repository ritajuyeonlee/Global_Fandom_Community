<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
</style>
<!-- Custom styles for this template -->
<link href="css/loginForm.css" rel="stylesheet">

<title>MyWeb Home</title>
</head>
<body class="text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<form class="box" action="loginUser" method="post">
						<h1>Login</h1>
						<p class="text-muted">Hello K-pop fan</p>
						<input type="text" name="userid" placeholder="Enter ID" id="userid" value="" required="required"> 
						<input type="password" id="userpw" name="userpw" value=""
							required="required" placeholder="Enter Password"> 
							<input type="submit"  value="Login">
							<a class="forgot text-muted" href="addUserForm">JOIN HERE</a> 
							

					</form>
				</div>
			</div>
		</div>
	</div>

	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>