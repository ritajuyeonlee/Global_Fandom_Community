<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/loginForm.css">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<title>MyWeb Home</title>
</head>
<body>
 
	<div id="output">
		<section>
			<h3>login form</h3>
			<form action="loginUser" method="post">
				<table border="1">
					<tr>
						<td><label for="userid">ID</label></td>
						<td><input type="text" id="userid" name="userid" value=""
							required="required" /></td>
					</tr>
					<tr>
						<td><label for="userpw">PW</label></td>
						<td><input type="password" id="userpw" name="userpw" value=""
							required="required" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="로그인"> <input
							type="reset" value="취소"> 
							<a href="addUserForm"> 회원가입</a></td>
					</tr>
				</table>
			</form>
		</section>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>