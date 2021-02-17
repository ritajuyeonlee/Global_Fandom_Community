<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Artist List</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
	<h1>가수목록보기</h1>

	<table border="1px solid black">
		<tr>
			<td>가수코드</td>
			<td>가수명</td>
		</tr>
		<c:forEach var="artist" items="${artistList}">
			<tr>
				<td>${artist.acode}</td>
				<td>${artist.aname}</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	</div>
    </div>
</div>
</body>
</html>