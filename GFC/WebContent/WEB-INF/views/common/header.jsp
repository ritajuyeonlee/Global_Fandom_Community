<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Pluto</title>
<style type="text/css">
body{
	padding-top:70px;
}


</style>
</head>
<body>
<!-- <span class="sr-only">(current)</span> -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="main">Pluto</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="songList">노래리스트</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="songMain">노래메인</a>
        </li>
        <c:choose>
    	<c:when test="${user.userid eq 'admin'}">
		    <li class="nav-item active">
		      <a class="nav-link" href="addSongForm">노래추가</a>
		    </li>
		    <li class="nav-item active">
		    	<a class="nav-link" href="adminConfirmLocation">장소컨펌</a>
		    </li>
    	</c:when>
    	</c:choose>
        <li class="nav-item">
          <a class="nav-link" href="map">지도보기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addLocationForm">장소추가</a>
        </li>
        
        <c:choose>
        	<c:when test="${not empty user.userid}">
        	<li class="nav-item active">
        	<a class="nav-link">${user.uname} 님 방가방가</a>
        	</li>
        	<li class="nav-item active">
      			<a class="nav-link" href="logoutUser">로그아웃</a>
		    </li>
		    </c:when>
		    <c:otherwise>
		    <li class="nav-item active">
      			<a class="nav-link" href="loginForm">로그인</a>
		    </li>
		    
		    </c:otherwise>
        </c:choose>
      </ul>
      <form class="form-inline mt-2 mt-md-0">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
      
    </div>
  </nav>




</body>
</html>

