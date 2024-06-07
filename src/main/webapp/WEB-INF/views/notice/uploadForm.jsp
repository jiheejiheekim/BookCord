<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/bc/uploadFormAction" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="file" name="uploadFile" multiple>
		<button>확인</button>
	</form>
</body>
</html>