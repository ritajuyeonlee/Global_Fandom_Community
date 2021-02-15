<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gfc.config.Dev"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
Dev dev = new Dev();
%>
<script
	src="https://maps.google.com/maps/api/js?key=<%=dev.getMapAPIKey()%>"
	async defer></script>
<title>Map</title>

<style type="text/css">
#map {
	width: 700px;
	height: 400px;
	background-color: gray;
}
</style>
<script type="text/javascript">
		$(function() {
			//navigator.geolocation.getCurrentPosition(initmap); // callback 메소드
			
			let user_acode = '<%=session.getAttribute("ucode")%>';
			if (user_acode != "null") {
				filterAcode(${user.acode});
			}else {
				filterAcode(0);
			}
			
			$('#filter').click(function(){
				filterAcode($('#acode').val());
			});
		});
	
		function filterAcode(acode) {		
			$.ajax({ // ajax 통신 {}
				url:'mapData',
				type:'GET',
				data :{
					acode : acode
				},
				success:function(data) {
					de = data;
					display(data);
				},
				error:function(error) {
					alert("error" + error);
				}
			});
		}
		function display(data) {
			let map = new google.maps.Map(document.getElementById('map'), {
				zoom : 14,
				center : {lat: 37.56154517066801 , lng: 126.9930503906448 }
			});
			
			let marker = new google.maps.Marker({
				position : {lat: 37.56154517066801 , lng: 126.9930503906448 },
				map : map,
				label : '서울 시청'
				})
				
			for (let d of data) {
				if (d.lconfirm == 1){
					let marker = new google.maps.Marker({
						position : {lat:parseFloat(d.llat), lng:parseFloat(d.llong)},
						map : map,
						label : d.lname,
						desc : d.ldesc
						//url : d.url
					});
				}
				/* google.maps.event.addListener(marker,'click',function(){
					//window.location.href = this.url;
					window.open(this.url, '_blank'); // 새 창에서 열기
				}); */
			}
		}
	</script>
</head>
<body>

	<h3>Map</h3>
	<div id="map"></div>
	<c:choose>
		<c:when test="${not empty user.userid}">
			<a href="addLocationForm"> 장소 추가 </a>
		</c:when>
	</c:choose>
	<select id="acode" name="acode">
		<option value="0">전체보기</option>
		<option value="1">아이유</option>
		<option value="2">블랙핑크</option>
		<option value="3">방탄소년단</option>
	</select>
	<button id="filter">적용</button>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>