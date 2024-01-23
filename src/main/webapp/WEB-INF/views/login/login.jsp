<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord Login</title>
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
				<td class="top2"><a href="/notice/notice">공지사항</a></td>
				<td class="top3"><a href="/login/login">로그인</a></td>
			</tr>
		</table>
	</div>
	
	<br><br>
	
	<div class="login">
		<table class="loginTable">
			<tr>
				<td>아이디</td>
				<td><input class="loginId" type="text"></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="loginPw" type="password"></td>
				<td><button class="loginButton"><a href="">로그인</a></button></td>
			</tr>
		</table>
	</div>
	
	<div class="signUp">
		<table>
			<tr>
				<td><a><img class="snsImg" src="resources/images/kakaoLogin.png"></a></td>
				<td><a><img class="snsImg" src="resources/images/naverLogin.png"></a></td>
				<td><button><a href="login/signUp">회원가입</a></button></td>
			</tr>
		</table>
	</div>
	
</body>
</html>