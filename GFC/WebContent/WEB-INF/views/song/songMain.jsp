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
<title>Pluto</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
tr.r:hover {
	cursor: pointer;
	background-color: #ece3f4;
}

#grid {
	border-radius: 10px;
}

table, th, tr, td, h1, div {
	text-align: center;
}

.page {
	text-decoration: none;
	color: #800040;
}

.page:hover {
	text-decoration: overline;
	color: #ff80c0;
}

form {
	margin: 0 auto;
	padding-bottom: 30px;
}
</style>
<link rel="stylesheet" href="css/list.css">



</head>
<body>

	<h1>main</h1>
	<div class="container">

		<div class="row">
			<form action="searchSong" method="post" class="search">
				<select name="condition">
					<option value="stitle">Title</option>
					<option value="aname">Artist</option>
				</select> <input type="text" value="" name="keyword"> <input
					type="submit" value="검색">
			</form>
			<h1></h1>
		</div>

		<c:choose>
			<c:when test="${user.userid eq 'admin'}">

				<div class="row">
					<div class="col-md-12" id="grid" style="border: 1px solid #ccc;">
						<br>
						<h1>Administrator page</h1>
						<hr>
						<table>
							<c:forEach var="song" items="${mainList}" varStatus="status">
								<tr class="r"
									onclick="location.href='/GFC/songDetail?scode=${song.scode}'">
									<td>${status.count}</td>
									<td><img alt="" src="${song.simage}" width="50px"></td>
									<td>${song.stitle}</td>
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
				<div class="col-md-12" id="grid" style="border: 1px solid #ccc;">
					<br>
					<h1>Songs we Recommend</h1>
					<hr>
					<table>
						<c:forEach var="song" items="${mainList}" varStatus="status">
							<tr class="r"
								onclick="location.href='/GFC/songDetail?scode=${song.scode}'">
								<td><img alt="" src="${song.simage}" width="50px"></td>
								<td>${song.stitle}</td>
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
				<div class="col-md-6" id="grid" style="border: 1px solid #ccc;">
					<br>
					<h1>Your Bias Songs</h1>
					<hr>
					<table>
						<c:forEach var="song" items="${favoriteList}" varStatus="status">
							<tr class="r"
								onclick="location.href='/GFC/songDetail?scode=${song.scode}'">
								<td>${status.count}</td>
								<td><img alt="" src="${song.simage}" width="50px"></td>
								<td>${song.stitle}</td>
								<td>${song.artist.aname}</td>
								<td>${song.sviews}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="col-md-6" id="grid" style="border: 1px solid #ccc;">
					<br>
					<h1>Your NO.1 Song</h1>
					<hr>
					<table>
						<tr class="r"
							onclick="location.href='/GFC/songDetail?scode=${song.scode}'">
							<td><img src="${favoriteSong.simage}"></td>
						</tr>

						<tr>
							<td>Title: ${favoriteSong.stitle}</td>
						</tr>
						<tr>
							<td>Artist : ${favoriteSong.artist.aname}</td>
						</tr>
						<tr>
							<td>Song writer : ${favoriteSong.slyricist}</td>
						</tr>
						<tr>
							<td>Lyricist : ${favoriteSong.swriter}</td>
						</tr>
						<tr>
							<td>Released Date : ${favoriteSong.sdate}</td>
						</tr>
						<tr>
							<td>Views : ${favoriteSong.sviews}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>

	<br>
	<div class="container" id="grid" style="border: 1px solid #ccc;">
		<br>
		<h1>All Songs</h1>
		<hr>
		<c:choose>
			<c:when test="${empty songList}">
				<p>No Song</p>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div id="top" class="col-xs-12">
						<table>
							<tr>
								<td>Album</td>
								<td>Title</td>
								<td>Artist</td>
								<td>Release date</td>
								<td>Views</td>
							</tr>

							<c:forEach var="song" items="${songList}">
								<tr class="r"
									onclick="location.href='/GFC/songDetail?scode=${song.scode}'">
									<td><img alt="" src="${song.simage}"></td>
									<td>${song.stitle}</td>
									<td>${song.artist.aname}</td>
									<td>${song.sdate}</td>
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