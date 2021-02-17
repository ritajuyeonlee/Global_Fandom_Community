<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Custom styles for this template -->
<link href="css/loginForm.css" rel="stylesheet">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>add User Form</title>
<script type="text/javascript">
$(() => {
	var cid, cname;
	var submit_id_check = 0;
	var submit_name_check = 0;
	var regExp = /^[a-z0-9_]{4,20}$/;
	var pattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
	// id 관련
	$('input[name="userid"]').keyup(() => {
		let id = $('#userid').val();
		if (document.getElementById("userid").readOnly == false) {
			$('#id_confirm').hide();
			$('#msg_id').show();
			if (!regExp.test(id)) {
				$('#id_check').hide();
				$('#msg_id').text('Only 4~20 lowercase letters and numbers can be used.');
			} else {
				submit_id_check = 0;
				$('#id_check').show();
				$('#msg_id').text('Please double check.');
			}
		}
	});
	$("#id_check").click(function() {	// id_check에 이벤트처리(중복체크)
		cid = $("#userid").val();
		if (cid.length > 0)
			idcheck(cid);
		else {
			$('#msg_id').show();
			$("#msg_id").html("Insert ID.");
		}
	});
	$("#id_confirm").click(function() {	// id_confirm에 이벤트처리(사용하기)
		var con_test = confirm("You can't change it after you confirm.");
		if(con_test == true){
			document.getElementById("userid").readOnly = true;
			//$("#msg_id").html("");
			$('#msg_id').hide();
			$('#id_check').hide();
			$('#id_confirm').hide();
			submit_id_check = 1;
		}
	});
	// 닉네임 관련
	$('input[name="uname"]').keyup(() => {
		let name = $('#uname').val();
		if (document.getElementById("uname").readOnly == false) {
			$('#name_confirm').hide();
			$('#msg_name').show();
			if (!pattern.test(name)) {
				$('#name_check').hide();
				$('#msg_name').text('Only 2~20 length can be used.');
			} else {
				submit_name_check = 0;
				$('#name_check').show();
				$('#msg_name').text('Please double check.');
			}
		}
	});
	$("#name_check").click(function() {	// name_check에 이벤트처리(중복처리)
		cname = $("#uname").val();
		if (cname.length > 0)
			namecheck(cname);
		else {
			$('#msg_name').show();
			$("#msg_name").html("Insert Nickname.");
		}
	});
	$("#name_confirm").click(function() {	// name_confirm에 이벤트처리(사용하기)
		var con_test = confirm("You can't change it after you confirm.");
		if(con_test == true){
			document.getElementById("uname").readOnly = true;
			$("#msg_name").hide();
			$('#name_check').hide();
			$('#name_confirm').hide();
			submit_name_check = 1;
		}
	});
	// password 관련
	$('input[name="userpw"]').keyup(() => {
		let pw = $('#userpw').val();
			$('#msg_pw').show();
			if (!regExp.test(pw)) {
				$('#msg_pw').text('Only 4~20 lowercase letters and numbers can be used.');
			}else {
				$('#msg_pw').hide();
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
				$("#msg_id").show();
				$("#msg_id").html("Available ID.");
				$('#id_check').hide();
				$('#id_confirm').show();
			}
			else {
				$("#msg_id").show();
				$("#msg_id").html("Already used ID.");
				$('#id_confirm').hide();
			}
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
				$("#msg_name").show();
				$("#msg_name").html("Available Nickname.");
				$('#name_check').hide();
				$('#name_confirm').show();
			}
			else {
				$("#msg_name").show();
				$("#msg_name").html("Already used Nickname.");
				$('#name_confirm').hide();
			}
		},
		error:function(request, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			$("#msg_name").html("error");
		}
	});
}

function err() {
	if (submit_id_check != 1) {
			alert("Please double check the ID and Click the 'Use' button.");
    	return false;
	}
	if (submit_name_check != 1) {
			alert("Please double check the Nickname and Click the 'Use' button.");
			return false;
	}
	if (document.getElementById("userpw").value.length == 0) {
      alert("Insert Password.");
      document.getElementById("userpw").focus();
      return false;
  }
  return true;
}
</script>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-6">
					<form class="box" action="addUser" method="post" onsubmit="return err()">
						<h1>Join</h1>
						<p class="text-muted">Hello K-pop fan!</p>
						<br>
						
						<input type="text" name="userid" placeholder="Enter ID" id="userid" value="" required="required"> 
						<span id="msg_id" class="error" style= "display: none;"></span>
						<input type="button" id="id_check" name="id_check" value="ID double check" style= "display: none;" />
						<input type="button" id="id_confirm" name="id_confirm" value="Use" style= "display: none;"/>
						
						<br>
						<input type="text" name="uname" placeholder="Enter Nickname" id="uname" value="" required="required"> 
						<span id="msg_name" class="error" style= "display: none;"></span>
						<input type="button" id="name_check" name="name_check" value="Nickname double check" style= "display: none;"/>
						<input type="button" id="name_confirm" name="name_confirm" value="Use" style= "display: none;"/>
						<br>
						<input type="password" id="userpw" name="userpw" value="" required="required" placeholder="Enter Password">
						<span id="msg_pw" class="error" style= "display: none;"></span> 
							<br>
						<p class="text-muted">Pick Your One and Only Bias</p>
							<select name="acode">
						<!-- db에서 가져오기 -->
						<option value="1">아이유 IU</option>
						<option value="2">블랙핑크 BLACKPINK</option>
						<option value="3">방탄소년단 BTS</option>
				</select>
							<input type="submit"  value="JOIN">						
					</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>