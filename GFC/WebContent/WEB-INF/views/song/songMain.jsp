<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>노래찐메인창</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
</head>
<body>
	<h1>나는찐메인노래창입니다.</h1>
	<form action="searchSong" method="post" class="search">
		<select name="condition">
			<!--<option value="bookno">bookno</option>-->
			<option value="stitle">노래제목</option>
			<option value="aname">아티스트</option>
		</select> 
			<input type="text" value="" name="keyword"> 
			<input type="submit" value="검색">
	</form>
	<div class="container">
	    <div class="row">
	        <div id="top" class="col-xs-12"  style="border:1px solid #ccc;">
		        <img src="img/fan.png" width="200px">
		        <span>쌉간지글월드와이드짱짱맨킹왕짱어후길게쓸말도없다어떡하냐암튼부트스트랩반응형글이드임줄이면그리드정렬바뀌고아래로내려감</span>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-4" style="border:1px solid #ccc;">
		        <img src="img/fan.png" width="200px">
		        <div>음악리스트</div>
	        </div>
	        <div class="col-md-4" style="border:1px solid #ccc;">
		        <img src="img/fan.png" width="200px">
		        <div>장소</div>
	        </div>
	        <div class="col-md-4" style="border:1px solid #ccc;">
		        <img src="img/fan.png" width="200px">
		        <div>추천곡</div>
	        </div>
	    </div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>