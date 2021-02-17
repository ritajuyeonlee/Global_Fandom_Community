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
.hi{
background-image:URL(http://img.vogue.co.kr/vogue/2020/06/style_5efae99e1084e.png);
background-position:0px 0px;
background-size: 100%;
 opacity:1.4!important;
    filter:alpha(opacity=50);
}

</style>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- <%@ include file="/WEB-INF/views/common/jsp/footer.jsp" %> --%>
<body>
	<main class="container">
  <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark hi">
    <div class="col-md-6 px-0">
      <h1 class="display-4 fst-italic">PLUTO </h1>
      <p class="lead my-3"><strong>Connect K-pop with fans all over the world</strong><br><br><br><br><br><br>
      Wherever you are, Which language you speak,
      <br> Pluto will always be the planet for your adventure to K-pop.  
      <br> Get the best translation of K-pop lyrics.
      
      </p>
    </div>
  </div>

  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">월드와이드케이팝</strong>
          <h3 class="mb-0">☆인기차트★</h3>
          <div class="mb-1 text-muted">두구두구두구</div>
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
        
      </div>
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">오늘의 추천곡</strong>
				<table>
						<tr>
							<td><img alt="" src="${recommendSong.simage}" width="50px"></td>
							<td><a href="/GFC/songDetail?scode=${recommendSong.scode}">${recommendSong.stitle}</a></td>
							<td>${recommendSong.artist.aname}</td>
							<td>${recommendSong.sviews}</td>
						</tr>
				</table>
          
          <h3 class="mb-0">Post title</h3>
          <div class="mb-1 text-muted">Nov 11</div>
          <p class="mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

        </div>
      </div>
    </div>
  </div>

</main>
    
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>