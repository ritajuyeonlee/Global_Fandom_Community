<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gfc.config.Dev"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		navigator.geolocation.getCurrentPosition(initmap); // callback 메소드
		var de;
		function initmap(position) {		
					$.ajax({ // ajax 통신 {}
						url:'mapData',	// GFC/map으로 들어갈 땐 ./ 으로 시작해야 함. location/은 ../으로
						type:'GET',		// get
						//dataType:json,
						success:function(data) {
							de = data;
							display(data, position);
						},
						error:function(error) {
							alert("error" + error);
						}
					});
		}
		
		function display(data, position) {
			let map = new google.maps.Map(document.getElementById('map'), {
				zoom : 14,
				center : {lat:position.coords.latitude, lng:position.coords.longitude}
			});
			
			let marker = new google.maps.Marker({
				position : {lat:position.coords.latitude, lng:position.coords.longitude},
				map : map,
				label : '내 위치'
				})
				
			for (let d of data) {
				let marker = new google.maps.Marker({
					position : {lat:parseFloat(d.llat), lng:parseFloat(d.llong)},
					map : map,
					label : d.lname,
					desc : d.ldesc
					//url : d.url
				});
				
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

	<a href="addLocationForm"> 장소 추가 </a>

</body>
</html>