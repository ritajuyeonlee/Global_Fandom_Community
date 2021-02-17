<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<meta charset="UTF-8">
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

<script type="text/javascript">
$(function() {
	<c:if test="${not empty msg}">
    	alert("${msg}");
	</c:if>

});
</script>


<link rel="stylesheet" href="css/list.css">

<title>Song List</title>
</head>
<body>
	<h1>Songs</h1>
	<br>
	<br>
	<c:choose>
		<c:when test="${empty songList}">
			<p>No Song</p>
		</c:when>
		<c:otherwise>

		
		<div class="container"id ="grid">
		<div class="row" >
			<div id="top" class="col-xs-12" style="border: 1px solid #ccc;">
			<table class="table table-striped table-sm" border="1px solid black">
				<tr>
					<td>Title</td>
					<td>Artist</td>
					<td>Release date</td>
					<td>Album</td>
					<td>Views</td>
				</tr>
				<c:forEach var="song" items="${songList}">
					<tr>
						<td><a href="song/songDetail?scode=${song.scode}">${song.stitle}</a></td>
						<td>${song.artist.aname}</td>
						<td>${song.sdate}</td>
						<td><img alt="" src="${song.simage}"></td>
						<td>${song.sviews}</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		<%
		int cnt = ((int)request.getAttribute("songCnt")+3) / 4;
		for(int i=1;i<=cnt;i++){%>
			<a href ="songList?page=<%=i%>"><%=i%></a>
		<% }%>
		
	</div>

		</c:otherwise>
	</c:choose>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>