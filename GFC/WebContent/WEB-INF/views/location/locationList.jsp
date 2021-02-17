<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location List</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
tr.r:hover {
	cursor: pointer;
	background-color: #ece3f4;
}

table, th, tr, td, h1 {
	text-align: center;
}
</style>

<link rel="stylesheet" href="css/list.css">
</head>
<body>
	<h1>장소목록보기</h1>

	<table border="1px solid black">
		<tr>
			<td>장소코드</td>
			<td>가수(코드)</td>
			<td>장소이름</td>
			<td>주소</td>
			<td>경도</td>
			<td>위도</td>
			<td>설명</td>
			<td>회원코드</td>
		</tr>
		<c:forEach var="location" items="${locationList}">
			<tr>
				<td>${location.lcode}</td>
				<td>${location.acode}</td>
				<td>${location.lname}</td>
				<td>${location.laddress}</td>
				<td>${location.llat}</td>
				<td>${location.llong}</td>
				<td>${location.ldesc}</td>
				<td>${location.ucode}</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>