<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/list.css">
<style type="text/css">

table, th, tr, td, h1,div {
	text-align: center;
}

</style>
<title>User List</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">

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
</div>
    </div>
</div>
</body>
</html>