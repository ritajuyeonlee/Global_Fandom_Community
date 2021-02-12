<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Song List</title>
</head>
<body>
	<h1>노래목록보기</h1>

	<table border="1px solid black">
		<tr>
			<td>노래코드</td>
			<td>제목</td>
			<td>가수</td>
			<td>작곡가</td>
			<td>작사가</td>
			<td>발매일</td>
			<td>앨범</td>
			<td>앨범이미지</td>
			<td>한글가사</td>
			<td>영어가사</td>
			<td>유튜브링크</td>
			<td>키워드</td>
		</tr>
		<c:forEach var="song" items="${songList}">
			<tr>
				<td>${song.scode}</td>
				<td>${song.stitle}</td>
				<td>${song.acode}</td>
				<td>${song.swriter}</td>
				<td>${song.slyricist}</td>
				<td>${song.sdate}</td>
				<td>${song.salbum}</td>
				<td>${song.simage}</td>
				<td>${song.klyric}</td>
				<td>${song.flyric}</td>
				<td>${song.youtubelink}</td>
				<td>${song.skeyword}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>