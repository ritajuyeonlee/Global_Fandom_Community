<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<title>User List</title>
</head>
<body>
	<h1>회원목록보기</h1>

	<table>
		<tr>
			<td>회원코드 </td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>최애</td>
		</tr>
		<c:forEach var="user" items="${userList}">
		<tr>
			<td>${user.ucode}</td>
			<td>${user.userid}</td>
			<td>${user.userpw}</td>
			<td>${user.uname}</td>
			<td>${user.acode}</td>
		</tr>
		</c:forEach>
	</table>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>