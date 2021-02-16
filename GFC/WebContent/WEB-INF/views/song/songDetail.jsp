<%@page import="gfc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<meta charset="UTF-8">
<title>Song Detail</title>

<script type="text/javascript">
	$(function() {
		
		let scode1 = "${song.scode}";
		let ucode1 = '<%=session.getAttribute("ucode")%>';

		console.log(ucode1);
		getCommentList(scode1);
		
		
		$('#clear').click(function(){
			$("#Comment").val("");		// 작성한 댓글 지우기.
		});
		
		$("#addComment").click(function() {
			let comment1 = $('#Comment').val();
			
			if (ucode1 != "null") {
				if (comment1.length > 0){
					addComment(scode1,ucode1,comment1);
				}
				else
					alert("내용을 입력해 주세요 ");
			}else {
				alert("로그인 후 댓글 달기 가능");
			}
			
		});
	});

	
	function addComment(scode1,ucode1,comment1) {
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/song/songDetail/comment",	//${pageContext.request.contextPath} : 프로젝트명 (여기서는 GFC)
			//url : "/song/songDetail/comment",	// 이거 경로 어떻게해야대대대대대대대대ㅐ
			/*dataType : 'json',*/
			data : {
				scode : scode1,
				ucode : ucode1,
				ccom : comment1	// 이거도 실수 했음..
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(args) {
				if(args == "success"){
					$("#Comment").val("");	// 작성한 댓글 지우기.
					alert('댓글 등록 성공!');
					getCommentList(scode1);		// 댓글 리스트 출력
				}
				//let data = JSON.parse(args);	// String -> JSON
				else{
					alert('댓글 등록 실패');
				}
			},
			error : function(e) {
				alert("error : " + e);
			}
		});
		console.log($.ajax.url);
	}
	
	/*날짜 수정 필요*/
	function getCommentList(scode1){
		$.ajax({
	        type:'GET',
	        url : "${pageContext.request.contextPath}/song/songDetail/commentList",
	        dataType : "json",
	        data:{
	        	scode : scode1
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	
	        	let html = "";
	            let cCnt = data.length;
	            
	            if(data.length > 0){
	                for(i=0; i<data.length; i++){
	                	let ccode = data[i].ccode;
	                	console.log(ccode);
	                	
	                    html += "<div>";
	                    html += "<div><table class='table'><h6><strong>"+data[i].user.uname+"</strong></h6>";
	                    html += "<tr><td id='ccom"+ ccode +"'>"+ data[i].ccom +"</td>";
	                    html += "<td><input type='button' id='translate"+ ccode +"' value='번역' onclick='commentTranslate("+ ccode +")'></td>";
	                    html += "<td><span id='tcomment" + ccode + "'>번역된거</span></td></tr>";	//여기부터
	                    html += "<tr><td>"+ data[i].cdate +"</td></tr>";
	                    html += "</table></div>";
	                    html += "</div>";
	                }
	            } else {
	                html += "<div>";
	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	            }
	            $("#cCnt").html(cCnt);
	            $("#commentList").html(html);
	        },
	        error:function(request,status,error){
	       }
	    });
	}
	function commentTranslate(ccode1){
		$.ajax({
	        type:'GET',
	        url : "${pageContext.request.contextPath}/song/songDetail/commentTranslate",
	        data:{
	        	ccode : ccode1
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	alert('번역성공,,');
	        	alert(data);
	        	console.log(data);
	        	
	        	let cc = 'tcomment' + ccode1;
	        	
	        	//$("#cCnt").html(data);
	        	console.log(document.querySelector('#'+cc).innerHTML)
	        	document.querySelector('#'+cc).innerHTML = data;
	        },
	        error:function(request,status,error){
	       }
	    });
	}
	
	
</script>

</head>
<body>
	<h1>노래목록</h1>

	<table border="1px solid black">
		<tr>
			<td>제목</td>
			<td>가수</td>
			<td>작곡가</td>
			<td>작사가</td>
			<td>유튜브링크</td>
		</tr>
		<tr>
			<td>발매일</td>
			<td>앨범</td>
			<td>앨범이미지</td>
		</tr>
		<tr>
			<td>한글가사</td>
			<td>영어가사</td>
			<td>키워드</td>
		</tr>
		<tr>
			<td>${song.stitle}</td>
			<td>${song.acode}</td>
			<td>${song.swriter}</td>
			<td>${song.slyricist}</td>
			<td><iframe src="${song.youtubelink}">${song.youtubelink}</iframe></td>
		</tr>
		<tr>
			<td>${song.sdate}</td>
			<td>${song.salbum}</td>
			<td><img alt="" src="${song.simage}"> </td>
		</tr>
		<tr>
			<td>${song.klyric}</td>
			<td>${song.flyric}</td>

			<td>${song.kcode}</td>
		</tr>
	</table>
	<c:choose>
        	<c:when test="${not empty user.userid}">
        	<li>
        	${user.uname} 님
        	</li>
		    </c:when>
		    <c:otherwise>
		    <li>
      			로그인하세요.
		    </li>
		    </c:otherwise>
        </c:choose>
        
        <div>
                <span><strong>댓글 수</strong></span> <span id="cCnt"></span>
            </div>
	
	<!-- 로그인 상태일때만 댓글 기능 사용가능하게 하기 => 나중에 세션 객체 활용해서 로그인 정보 알아내기-->
	<%-- <p><%=uname%></p> --%>	<!-- 이 부분 로그인 정보에서 이름 가져오기 -->
	<textarea id = "Comment" name= "Comment" ></textarea>
	<input type="button" id="clear" value="취소" />
	<input type="button" id="addComment" value="댓글" /> <br>
	
	<!-- 댓글 바로 추가? -->
	<div id = "commentList">
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>
