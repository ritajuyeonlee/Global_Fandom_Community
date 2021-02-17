<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gfc.config.Dev"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>add Location Form</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
Dev dev = new Dev();
%>
<script
	src="https://maps.google.com/maps/api/js?key=<%=dev.getMapAPIKey()%>"
	async defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/list.css">
<style type="text/css">
.searchButton,#addbutton,#resetbutton {
	vertical-align:middle; 
	background-color: #400080;
	border: medium;
	color: white;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius:10px;
	
	bottom: 10px;
}

</style>
</head>

<script type="text/javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		// GFC/addLocationForm으로 들어갈 땐 ./ 으로 시작해야 함. location/은 ../으로
		var pop = window.open("./popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.laddress.value = roadFullAddr;
		
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ address: roadFullAddr }, (results, status) => {
      if (status === "OK") {
        document.form.llat.value = results[0].geometry.location.lat();
        document.form.llong.value = results[0].geometry.location.lng();
      } else {
        alert(
          "Geocode was not successful for the following reason: " + status
        );
      }
    }); 
	}
	
	function err() {
		if (form.lname.value == "") {
				alert("장소이름을 입력하세요.");
	    	return false;
		}
		if (form.laddress.value == "") {
			alert("주소를 입력하세요.");
    	return false;
	}
		if (form.ldesc.value == "") {
			alert("해당 장소에 대한 설명을 입력하세요.");
    	return false;
	}
	return true;
	}
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">

	<br><h3>Add K-Tour Spot</h3><hr>
	
	<form name="form" action="addLocation" method="post"
		onsubmit="return err()">
		<table border="1px solid black">
			<tr>
				<td>Nickname :</td>
				<td><input type="text" name="uname" value="${user.uname}"
					required readonly><input type="hidden" name="ucode"
					value="${user.ucode}" required readonly></td>
			</tr>
			<tr>
				<td>Related Artist :</td>
				<td><select name="acode">
						<!-- db에서 가져오기 -->
						<option value="1">아이유</option>
						<option value="2">블랙핑크</option>
						<option value="3">방탄소년단</option>
				</select></td>
			</tr>
			<tr>
				<td>Place Name :</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>Address :</td>
				<td><input type="text" id="laddress" name="laddress"placeholder="Click Search Address" required readonly /> 
					<input type="hidden" id="llat" name="llat" /> <input type="hidden"id="llong" name="llong" />
					<button class="searchButton" onclick="goPopup()">Search Address</button>
					</td>
			</tr>
			<tr>
				<td>Explanation :</td>
				<td><input type="text" name="ldesc"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" id="addbutton">
					<input type="reset" value="Reset" id="resetbutton"></td>
			</tr>
		</table>
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</div>
    </div>
</div>
</body>
</html>