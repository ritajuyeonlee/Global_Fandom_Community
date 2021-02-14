<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Pluto</title>
</head>
<%@ include file="/WEB-INF/views/common/jsp/header.jsp" %>
<%-- <%@ include file="/WEB-INF/views/common/jsp/footer.jsp" %> --%>


<body>
<h1> GFC </h1>
	<form action="" method="get">
		<a href="loginForm"> 로그인 </a><br>
		<a href="addSongForm"> 노래 추가 </a><br>
		<a href="addLocationForm"> 장소 추가 </a><br>
		<a href="map"> 지도보기 </a><br>
	</form>
	<jsp:include page="/WEB-INF/views/common/jsp/footer.jsp"></jsp:include>
</body>
</html>