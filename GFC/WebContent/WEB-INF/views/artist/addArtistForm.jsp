<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<title>add Artist Form</title>
</head>
<body>
	<form action="addArtist" method="post">
		<table border="1px solid black">
			<tr>
				<td>가수이름 :</td>
				<td><input type="text" name="aname"></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>