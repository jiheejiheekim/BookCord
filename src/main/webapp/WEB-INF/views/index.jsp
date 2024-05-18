<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Security</h1>


	<sec:authorize access="isAnonymous()">
		<h5><a href='<c:url value="/loginPage"/>'>LOGIN </a> 로그인 해주세요.</h5>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<h5><a href='<c:url value="/loginPage"/>'>LOGOUT </a> 로그아웃 해주세요.</h5>
	</sec:authorize>


	<div>
		<h4><a href="admin">ADMIN</a></h4>
		<h4><a href="vip">VIP</a></h4>
	</div>

	
</body>
</html>