<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>LOGIN</h1>
	<form name="f" action="/bc/login" method="post">
	    <input type="text" name="username" placeholder="아이디">
	    <input type="password" name="password" placeholder="비밀번호">
	    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	    <button type="submit">로그인</button>
	</form>
</body>
</html>