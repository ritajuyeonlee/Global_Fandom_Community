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

<script type="text/javascript">

</script>


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
	        <div class="col-md-4" style="border:1px solid #ccc;">
		        <div>☆최애 곡 리스트★</div>
				<table>
					<c:forEach var="song" items="${favoriteList}" varStatus="status">
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
	        <div class="col-md-4" style="border:1px solid #ccc;">
		        <div>☆최애 곡 1등★</div>
				<table>
						<tr>
							<td><img alt="" src="${favoriteSong.simage}" width="100px"></td>
						</tr>
						<tr>
							<td>앨범 : ${favoriteSong.salbum}</td>
						</tr>
						<tr>
							<td><a href="/GFC/songDetail?scode=${favoriteSong.scode}">제목 : ${favoriteSong.stitle}</a></td>
						</tr>
						<tr>
							<td>가수 : ${favoriteSong.artist.aname}</td>
						</tr>
						<tr>
							<td>작곡가 : ${favoriteSong.slyricist}</td>
						</tr>
						<tr>
							<td>작사가 : ${favoriteSong.swriter}</td>
						</tr>
						<tr>
							<td>발매일 : ${favoriteSong.sdate}</td>
						</tr>
						<tr>
							<td>조회수 : ${favoriteSong.sviews}</td>
						</tr>
				</table>
	        </div>
	    </div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>