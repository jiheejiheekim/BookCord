<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - Login</title>
<link rel="stylesheet" href="resources/css/login.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
				<!-- <td class="top2"><a href="/notice/notice">공지사항</a></td>
				<td class="top3"><a href="/login/login">로그인</a></td> -->
			</tr>
		</table>
	</div>
	
	<div class="login">
		<form name="f" action="/bc/login" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<table class="loginTable">
				<tr>
					<td>아이디</td>
					<td><input name="id" class="loginId" type="text" placeholder="　ID"></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input name="pwd" class="loginPw" type="password" placeholder="　password"></td>
					<td><button type="submit" class="loginButton">로그인</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<br>
	
	<div class="signUp">
		<table class="signUpTable">
			<tr>
				<td><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7602202d7ab3fef830a0c7ae34debe13&redirect_uri=https://localhost:9089/bc/kakao_callback">
					<img class="snsKImg" src="resources/images/kakaoLogin.png">
				</a></td>
				<td><a><img class="snsNImg" src="resources/images/naverLogin.png"></a></td>
				<td><button class="signUpButton"><a href="signUp">회원가입</a></button></td>
			</tr>
		</table>
	</div>
	
</body>
</html>