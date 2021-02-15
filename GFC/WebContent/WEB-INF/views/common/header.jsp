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
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-md bg-light navbar-light fixed-top">
<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
<a class="navbar-brand" href="main">Pluto</a>
<!-- 나중에 이미지 넣을 때 a태그안에-->
<!-- <img alt="Logo" src="" style="width:40px"> -->

  <ul class="navbar-nav mr-auto">
    <li class="nav-item active">
      <a class="nav-link" href="#">암거나</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="addSongForm">노래추가</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="addLocationForm">장소추가</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="map">지도보기</a>
    </li>
    <li class="nav-item dropdown">
    	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">로케</a>
    	<div class="dropdown-menu">
    		<a class="dropdown-item" href="addLocationForm">장소추가</a>
    		<a class="dropdown-item" href="map">지도보기</a>
    	</div>
    </li>
    <li>
  <form class="form-inline navbar-form" action="#">
  	<input class="from-control mr-sm-2" type="text" placeholder="Search"/>
  	<button class="btn btn-success" type="submit">검색</button>
  </form>
  </li>
  </ul>
  
  </div>
 
  <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
        <c:choose>
        	<c:when test="${not empty user.userid}">
        	<li class="nav-item active">
        	${user.uname} 님 방가방가
        	</li>
        	<li class="nav-item active">
      			<a class="nav-link" href="logoutUser">로그아웃</a>
		    </li>
		    </c:when>
		    <c:otherwise>
		    <li class="nav-item active">
      			<a class="nav-link" href="loginForm">로그인</a>
		    </li>
		    <li class="nav-item active">
		    	<a class="nav-link" href="#">다른거</a>
		    </li>
		    </c:otherwise>
        </c:choose>
            
        </ul>
    </div>
 
</nav>
<!-- 공통네비바아래 마진 -->
<div style="margin-bottom:80px"></div>


</body>
</html>

