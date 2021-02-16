<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Pluto</title>
<style type="text/css">
#top {
	height: 300px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- <%@ include file="/WEB-INF/views/common/jsp/footer.jsp" %> --%>
<body>
	

	<div class="container">
		<div class="row">
			<div id="top" class="col-xs-12" style="border: 1px solid #ccc;">
				<img src="img/fan.png" width="200px"> <span>쌉간지글월드와이드짱짱맨킹왕짱어후길게쓸말도없다어떡하냐암튼부트스트랩반응형글이드임줄이면그리드정렬바뀌고아래로내려감</span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4" style="border: 1px solid #ccc;">
			<div>☆인기차트★</div>
			<table>
		<c:forEach var="song" items="${songList}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><img alt="" src="${song.simage}" width="50px"></td>
				<td><a href="/GFC/songDetail?scode=${song.scode}">${song.stitle}</a></td>
				<td>${song.artist.aname}</td>
				<td>${song.sviews}</td>
			</tr>
		</c:forEach>
	</table>
			</div>
			<div class="col-md-4" style="border: 1px solid #ccc;">
				<img src="img/fan.png" width="200px">
				<div>장소</div>
			</div>
			<div class="col-md-4" style="border: 1px solid #ccc;">
				<img src="img/fan.png" width="200px">
				<div>추천곡</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>