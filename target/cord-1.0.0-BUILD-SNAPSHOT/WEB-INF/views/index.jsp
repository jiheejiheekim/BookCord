<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	       function logout() {
	           var form = document.createElement('form');
	           form.method = 'POST';
	           form.action = '/bc/logout';
	           
	           var csrfToken = document.createElement('input');
	           csrfToken.type = 'hidden';
	           csrfToken.name = '${_csrf.parameterName}';
	           csrfToken.value = '${_csrf.token}';
	           
	           form.appendChild(csrfToken);
	           document.body.appendChild(form);
	           form.submit();
	       }
	 </script>
</head>
<body>
<h1>Security</h1>

	<sec:authorize access="isAnonymous()">
		<h5><a href='<c:url value="/loginP"/>'>LOGIN </a> 로그인 해주세요.</h5>
	</sec:authorize>
	
	<!-- 버튼 -->		
	<sec:authorize access="isAuthenticated()">
		<form action="/bc/logout" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<button type="submit">로그아웃</button>
		</form>
	</sec:authorize>
	
	<!-- a태그 -->
	<sec:authorize access="isAuthenticated()">
	    <a href="javascript:logout()">로그아웃</a>
	</sec:authorize>
	
	

	<sec:authorize access="hasRole('ROLE_USER')">
	    <!-- ROLE_USER 권한을 가진 사용자에게만 보여지는 내용 -->
	    <p>Welcome, user!</p>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	    <!-- ROLE_ADMIN 권한을 가진 사용자에게만 보여지는 내용 -->
	    <p>Welcome, admin!</p>
	</sec:authorize>
		


	<h4><a href="admin">ADMIN</a></h4>

    <h4><a href="vip">VIP</a></h4>

	

	
</body>
</html>