<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
.but{
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

table, th, tr, td, h1 {
	text-align: center;
}


</style>

<link rel="stylesheet" href="css/list.css">

<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		var a=document.getElementsByName("confirm");
		var cnt=a.length;
		
		$("input[name='allCheck']").click(function(){
			var alist=$("input[name='confirm']");
			for(var i=0;i<alist.length;i++){
				alist[i].checked=this.checked;
			}
		});
		
		$("input[name='confirm']").click(function(){
			if($("input[name='confirm']:checked").length==cnt){
				$("input[name='allCheck']")[0].checked=true;
			}else{
				$("input[name='allCheck']")[0].checked=false;
			}
		})
	});
	
	function confirmLoc(){
		var url="confirmLoc";
		var valueArr=new Array();
		var list=$("input[name='confirm']");
		for(var i=0;i<list.length;i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length==0){
			alert("선택된 장소가 없어요")
		}
		else{
			var ch=confirm("정말 등록하실겁니까?");
			if(ch == true){
			$.ajax({
				url:url,
				type:'POST',
				traditional:true,
				data:{
					valueArr:valueArr
				},
				success:function(data){
					if(data=1){
						alert("등록했습니다");
						location.replace("adminConfirmLocation");
					}else{
						alert("등록실패");
					}
				}
			});
			}
		}
	}


</script>


</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
<br><h1>관리자의 장소컨펌 페이지</h1><hr>
	<table border="1px solid black">
		<tr>
			<td>장소코드</td>
			<td>가수(코드)</td>
			<td>장소이름</td>
			<td>주소</td>
			<td>경도</td>
			<td>위도</td>
			<td>설명</td>
			<td>회원코드</td>
			<td>confirm</td>
			<td>등록 <input id="allCheck" type="checkbox" name="allCheck"></td>
		</tr>
		<c:forEach var="location" items="${locationList}">
			<tr>
				<c:set var="lconfirm" value="${location.lconfirm}"/>
				<c:if test="${Integer.parseInt(lconfirm) eq 0}">
				 
					<td>${location.lcode}</td>
					<td>${location.acode}</td>
					<td>${location.lname}</td>
					<td>${location.laddress}</td>
					<td>${location.llat}</td>
					<td>${location.llong}</td>
					<td>${location.ldesc}</td>
					<td>${location.ucode}</td>
					<td>${location.lconfirm}</td>
					<td><input name="confirm" type="checkbox" value="${location.lcode}"></td>
				</c:if>
				
				
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="등록" class="but" onclick="confirmLoc();">
	</div>
    </div>
</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>