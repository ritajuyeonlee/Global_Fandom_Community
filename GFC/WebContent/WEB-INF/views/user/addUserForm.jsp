<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>add User Form</title>
<link href="css/loginForm.css" rel="stylesheet">

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
			$("#msg_id").html("Insert ID");
	});
	
	$("#name_check").click(function() {	// name_check에 이벤트처리
		cname = $("#uname").val().replace(/( |\!|\~|\@|\?|\:)/gi, "");
		document.getElementById("uname").value = cname;
		if (cname.length > 0)
			namecheck(cname);
		else
			$("#msg_name").html("Insert Nickname");
	});
	
	$("#id_confirm").click(function() {	// id_confirm에 이벤트처리
		var con_test = confirm("You can't change it after you confirm");
		if(con_test == true){
			document.getElementById("userid").readOnly = true;
			$("#msg_id").html("");
			document.getElementById("id_confirm").type = "hidden";
			submit_check += 1;
		}
	});
	
	$("#name_confirm").click(function() {	// name_confirm에 이벤트처리
		var con_test = confirm("You can't change it after you confirm");
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
				$("#msg_id").html("Available ID");
				document.getElementById("id_confirm").type = "button";
			}
			else {
				$("#msg_id").html("Already used ID");
				document.getElementById("id_confirm").type = "hidden";
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
				$("#msg_name").html("Available Nickname");
				document.getElementById("name_confirm").type = "button";
			}
			else {
				$("#msg_name").html("Already used Nickname");
				document.getElementById("name_confirm").type = "hidden";
			}
		},
		error:function(request, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			$("#msg_name").html("error");
		}
	});
}

function err() {
	if (submit_check != 2) {
			alert("Please double check the ID and nickname and press the 'Use' button.");
    	return false;
	}
	if (document.getElementById("userpw").value.length == 0) {
      alert("Insert Password");
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
				<div class="card">
					<form class="box" action="addUser" method="post" onsubmit="return err()">
						<h1>Join</h1>
						<p class="text-muted">Hello K-pop fan!</p>
						<br><br>
						<input type="text" name="userid" placeholder="Enter ID" id="userid" value="" required="required"> 
						<input
					type="button" id="id_check" name="id_check" value="ID double check" />
						<span id="msg_id" class="error"></span>
						<input type="hidden" id="id_confirm" name="id_confirm" value="Use" />
						<br><br>
						<input type="text" name="uname" placeholder="Enter Nickname" id="uname" value="" required="required"> 
						<input
					type="button" id="name_check" name="name_check" value="Nickname double check" />
						<span id="msg_name" class="error"></span>
						<input type="hidden" id="name_confirm" name="name_confirm" value="Use" />
						<br><br>
						<input type="password" id="userpw" name="userpw" value="" required="required" placeholder="Enter Password"> 
							<br><br>
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
	</div>
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>