<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style type="text/css">
tr.r:hover {
	cursor: pointer;
	background-color: #ece3f4;
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
<h1>관리자의 장소컨펌할 페이지!</h1>
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
	<input type="button" value="등록" class="btn btn-outline-info" onclick="confirmLoc();">
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>