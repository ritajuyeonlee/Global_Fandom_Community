<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>add User Form</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script type="text/javascript">
var cid, cname;
var submit_check = 0;

$(() => {
	$("#id_check").click(function() {	// id_check에 이벤트처리
		cid = $("#userid").val().replace(/( |\!|\~|\@|\?|\:)/gi, "");
		document.getElementById("userid").value = cid;
		if (cid.length > 0)
			idcheck(cid);
		else
			$("#msg_id").html("아이디를 입력해주세요.");
	});
	
	$("#name_check").click(function() {	// name_check에 이벤트처리
		cname = $("#uname").val().replace(/( |\!|\~|\@|\?|\:)/gi, "");
		document.getElementById("uname").value = cname;
		if (cname.length > 0)
			namecheck(cname);
		else
			$("#msg_name").html("닉네임을 입력해주세요.");
	});
	
	$("#id_confirm").click(function() {	// id_confirm에 이벤트처리
		var con_test = confirm("확인을 누르면 변경이 불가합니다. 사용하시겠습니까?");
		if(con_test == true){
			document.getElementById("userid").readOnly = true;;
			$("#msg_id").html("");
			document.getElementById("id_confirm").type = "hidden";
			submit_check += 1;
		}
	});
	
	$("#name_confirm").click(function() {	// name_confirm에 이벤트처리
		var con_test = confirm("확인을 누르면 변경이 불가합니다. 사용하시겠습니까?");
		if(con_test == true){
			document.getElementById("uname").readOnly = true;
			$("#msg_name").html("");
			document.getElementById("name_confirm").type = "hidden";
			submit_check += 1;
		}
	});
});

function idcheck(cid) {
	$.ajax({ // ajax 통신 {}
		url:'dupCheck',
		type:'post',
		data:{
			check : 1,
			id : cid
		},
		success:function(data) {
			if (data == "success") {
				document.getElementById("msg_id").type = "text";
				$("#msg_id").html("사용 가능한 아이디입니다.");
				document.getElementById("id_confirm").type = "button";
			}
			else
				$("#msg_id").html("사용중인 아이디입니다.");
		},
		error:function(request, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			$("#msg_id").html("error");
		}
		
	});
}

function namecheck(cname) {
	$.ajax({ // ajax 통신 {}
		url:'dupCheck',
		type:'post',
		data:{
			check : 2,
			id : cname
		},
		success:function(data) {
			if (data == "success") {
				document.getElementById("msg_name").type = "text";
				$("#msg_name").html("사용 가능한 닉네임입니다.");
				document.getElementById("name_confirm").type = "button";
			}
			else
				$("#msg_name").html("사용중인 닉네임입니다.");
		},
		error:function(request, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			$("#msg_name").html("error");
		}
	});
}

function err() {
	if (submit_check != 2) {
			alert("아이디 및 닉네임 중복체크 후 사용하기 버튼을 눌러주세요.");
    	return false;
	}
	if (document.getElementById("userpw").value.length == 0) {
      alert("비밀번호를 입력해주세요");
      document.getElementById("userpw").focus();
      return false;
  }
  return true;
}
</script>
</head>
<body>
	<form action="addUser" method="post" onsubmit="return err()">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" id="userid" name="userid" value=""><input
					type="button" id="id_check" name="id_check" value="ID 중복체크" /><br>
					<span id="msg_id" class="error"></span><input type="hidden"
					id="id_confirm" name="id_confirm" value="사용하기" /></td>
			</tr>

			<tr>
				<td>닉네임 :</td>
				<td><input type="text" id="uname" name="uname" value=""><input
					type="button" id="name_check" name="name_check" value="NAME 중복체크" /><br>
					<span id="msg_name" class="error"></span><input type="hidden"
					id="name_confirm" name="name_confirm" value="사용하기" /></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" id = "userpw" name="userpw" value=""></td>
			</tr>
			<tr>
				<td>최애 :</td>
				<td><select name="acode">
						<!-- db에서 가져오기 -->
						<option value="1">아이유</option>
						<option value="2">블랙핑크</option>
						<option value="3">방탄소년단</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
	</form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>