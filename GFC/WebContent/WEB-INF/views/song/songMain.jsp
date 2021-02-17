<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/list.css">

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
		</select> <input type="text" value="" name="keyword"> <input
			type="submit" value="검색">
	</form>

	<c:choose>
    	<c:when test="${user.userid eq 'admin'}">
			<div class="container">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid #ccc;">
						<div>☆관리자★</div>
						<table>
							<c:forEach var="song" items="${mainList}" varStatus="status">
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
				</div>
			</div>
		</c:when>
		<c:when test="${empty ucode}">
			<div class="container">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid #ccc;">
						<div>☆그냥 곡 리스트★</div>
						<table>
							<c:forEach var="song" items="${mainList}" varStatus="status">
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
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container">
				<div class="row">
					<div class="col-md-4" style="border: 1px solid #ccc;">
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
					<div class="col-md-4" style="border: 1px solid #ccc;">
						<div>☆최애 곡 1등★</div>
						<table>
							<tr>
								<td><img alt="" src="${favoriteSong.simage}" width="100px"></td>
							</tr>
							<tr>
								<td>앨범 : ${favoriteSong.salbum}</td>
							</tr>
							<tr>
								<td><a href="/GFC/songDetail?scode=${favoriteSong.scode}">제목
										: ${favoriteSong.stitle}</a></td>
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
			</div>
		</c:otherwise>
	</c:choose>
	
	<h1>Songs</h1>
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
						<td>${song.stitle}</td>
						<td>${song.artist.aname}</td>
						<td>${song.sdate}</td>
						<td><img alt="" src="${song.simage}"></td>
						<td>${song.sviews}</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		<c:choose>
			<c:when test="${not empty ucode}">
				<%
				int cnt = ((int)request.getAttribute("songCnt")+3) / 4;
				for(int i=1;i<=cnt;i++){%>
					<a href ="songMain?ucode=${ucode}&page=<%=i%>"><%=i%></a>
				<% }%>
			</c:when>
			<c:otherwise>
					<%
					int cnt = ((int)request.getAttribute("songCnt")+3) / 4;
					for(int i=1;i<=cnt;i++){%>
						<a href ="songMain?ucode=-1&page=<%=i%>"><%=i%></a>
					<% }%>
			</c:otherwise>
		</c:choose>
		
	</div>
		</c:otherwise>
	</c:choose>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>