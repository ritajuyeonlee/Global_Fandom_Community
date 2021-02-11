<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyWeb Home</title>
<style type="text/css">
</style>

</head>
<body>

	<div id="output">
		<section>
			<h3>login form</h3>
			<form action="login" method="post">
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
							type="reset" value="취소"> <a href="addUserForm"> 회원가입
						</a></td>
					</tr>
				</table>
			</form>
		</section>
	</div>

</body>
</html>