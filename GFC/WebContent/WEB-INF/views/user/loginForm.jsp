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
						<p class="text-muted">케이팝 팬 방가방가~~</p>
						<input type="text" name="userid" placeholder="아이디를 입력하세요" id="userid" value="" required="required"> 
						<input type="password" id="userpw" name="userpw" value=""
							required="required" placeholder="비밀번호를 입력하세요"> 
							<input type="submit"  value="Login">
							<a class="forgot text-muted" href="addUserForm">플루토의 회원이 아니신가요?</a> 
							

					</form>
				</div>
			</div>
		</div>
	</div>

	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>