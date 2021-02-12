<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add User Form</title>
</head>
<body>
	<form action="addUser" method="post">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="userid"></td>
			</tr>

			<tr>
				<td>닉네임 :</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="userpw"></td>
			</tr>
			<tr>
				<td>최애 :</td>
				<td><select name="acode">
						<!-- db에서 가져오기 -->
						<option value="1">아이유</option>
						<option value="2">블랙핑크</option>
						<option value="3">방탄소년단</option>
				</select></td>
			</tr>

			<tr>
				<td>키워드 (3개) :</td>
				<td><input type="checkbox" name="ukeyword" value="1">봄
					<input type="checkbox" name="ukeyword" value="2">여름 <input
					type="checkbox" name="ukeyword" value="3">가을 <input
					type="checkbox" name="ukeyword" value="4">겨울</td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>


</body>
</html>