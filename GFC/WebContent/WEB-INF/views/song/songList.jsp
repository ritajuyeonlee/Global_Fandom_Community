<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>



<link rel="stylesheet" href="css/list.css">

<title>Song List</title>
</head>
<body>
	<h1>노래목록보기</h1>
	<c:choose>
		<c:when test="${empty songList}">
			<p>No Song</p>
		</c:when>
		<c:otherwise>
			<table class="table table-striped table-sm" border="1px solid black">
				<tr>
					<td >노래코드</td>
					<td>제목</td>
					<td>가수명</td>
					<td class=writer>작곡가</td>
					<td class=writer>작사가</td>
					<td>발매일</td>
					<td>앨범</td>
					<td>앨범이미지</td>

				</tr>



				<c:forEach var="song" items="${songList}">
					<tr>
						<td><a href="/GFC/songDetail?scode=${song.scode}">${song.scode}</a></td>
						<td><a href="${song.stitle}">${song.stitle}</a></td>
						<td>${song.artist.aname}</td>
						<td>${song.swriter}</td>
						<td>${song.slyricist}</td>
						<td>${song.sdate}</td>
						<td>${song.salbum}</td>
						<td><img alt="" src="${song.simage}"></td>

					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>