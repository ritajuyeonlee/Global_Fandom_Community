<%@page import="gfc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
var $j351 = jQuery.noConflict();
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet" href="css/songDetail.css">

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<meta charset="UTF-8">
<title>Song Detail</title>

<script type="text/javascript">
	$j351(function() {
		
		let scode1 = "${song.scode}";
		let ucode1 = '<%=session.getAttribute("ucode")%>';
		console.log(ucode1);
		getCommentList(scode1);

		$j351('#clear').click(function() {
			$j351("#Comment").val(""); // 작성한 댓글 지우기.
		});

		$j351("#addComment").click(function() {
			let comment1 = $j351('#Comment').val();

			if (ucode1 != "null") {
				if (comment1.length > 0) {
					addComment(scode1, ucode1, comment1);
				} else
					alert("Enter Comments");
			} else {
				alert("Please Login");
			}

		});
	});

	function addComment(scode1, ucode1, comment1) {
		$j351.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/song/songDetail/comment", //${pageContext.request.contextPath} : 프로젝트명 (여기서는 GFC)
			data : {
				scode : scode1,
				ucode : ucode1,
				ccom : comment1
			},
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(args) {
				if (args == "success") {
					$j351("#Comment").val(""); // 작성한 댓글 지우기.
					alert('Success');
					getCommentList(scode1); // 댓글 리스트 출력
				}
				//let data = JSON.parse(args);	// String -> JSON
				else {
					alert('Fail');
				}
			},
			error : function(e) {
				alert("error : " + e);
			}
		});
		console.log($j351.ajax.url);
	}

	function getCommentList(scode1) {
		$j351.ajax({
					type : 'GET',
					url : "${pageContext.request.contextPath}/song/songDetail/commentList",
					dataType : "json",
					data : {
						scode : scode1
					},
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {

						let html = "";
						let cCnt = data.length;

						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								let ccode = data[i].ccode;
								console.log(ccode);

								html += "<div class='table'><div><div><strong><span id='uname'>"
										+ data[i].user.uname + "</strong>&nbsp;&nbsp;&nbsp;</span><span>" 
										+ data[i].cdate+ "<div></span>";
								html += "<span id='ccom"+ ccode +"'>"
										+ data[i].ccom + "&nbsp;&nbsp;&nbsp;</span>";
								html += "<span><input type='button' id='translate"+ ccode
										+ "' value='Translate' onclick='commentTranslate("+ ccode + ")'></span>";
								html += "&nbsp;&nbsp;&nbsp;<span id='tcomment" + ccode + "'></div>"; 
								
								html += "</div>";
							}
						} else {
							html += "<div>";
							html += "<div><table class='table'><h6><strong>No comments</strong></h6>";
							html += "</table></div>";
							html += "</div>";
						}
						$j351("#cCnt").html(cCnt);
						$j351("#commentList").html(html);
					},
					error : function(request, status, error) {
					}
				});
	}
	function commentTranslate(ccode1) {
		$j351.ajax({
					type : 'GET',
					url : "${pageContext.request.contextPath}/song/songDetail/commentTranslate",
					data : {
						ccode : ccode1
					},
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {

						let cc = 'tcomment' + ccode1;

						console.log(document.querySelector('#' + cc).innerHTML)
						document.querySelector('#' + cc).innerHTML = data;
					},
					error : function(request, status, error) {
					}
				});
	}
</script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="album art col-sm-2 col-md-5">
				<img alt="" src="${song.simage}">
			</div>


			<div class="song info col-md-7  col-mb-3">
				<h3>${song.stitle}</h3>
				<h3>${song.artist.aname}</h3>
				<h5>Songwriter : ${song.swriter}</h5>
				<h5>Lyricist : ${song.slyricist}</h5>
				<h5>Released Date : ${song.sdate}</h5>
				<h5>Album : ${song.salbum}</h5>
				<h5>Views : ${song.sviews}</h5>
			</div>
			<br> <br>

			<div class="music video col-xs-12" id="youtube">
				${song.youtubelink}</div>

		</div>
		<div class="row">
			<div class="K lyric col-md-6">${song.klyric}</div>
			<div class="F lyric col-md-6">${song.flyric}</div>
		</div>
		
		
		
		<div class="row">
			<div class="col-md-12">
			<br><br>
				<c:choose>
					<c:when test="${not empty user.userid}">
						<li>${user.uname}</li>
					</c:when>
					<c:otherwise>
						<li>Please Login</li>
					</c:otherwise>
				</c:choose>
				
				<textarea id="Comment" name="Comment"></textarea>
				<input type="button" id="clear" value="Cancel" /> <input type="button"
					id="addComment" value="Add" /> <br>
					
				<br><br>
				<div style="float: right;">
					<strong><span id="cCnt"></span></strong>
					<span>comments</span> 
				</div>
				<br>
				
			</div>
		</div>
		<div class="row">
		<div class="col-md-12">
					<div id="commentList"></div>
		</div>
		</div>
	</div>




	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>
