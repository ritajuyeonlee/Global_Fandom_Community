<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<title>Artist List</title>
</head>
<body>
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

</body>
</html>