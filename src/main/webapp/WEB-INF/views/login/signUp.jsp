<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - SignUp</title>
<link rel="stylesheet" href="resources/css/signUp.css">
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
	
	<div class="signUp">
		<table class="signUpTable">
			<tr>
				<td>아이디</td>
				<td><input class="id" type="text"></td>
				<td><button class="idCheck"><a href="">중복확인</a></button></td>
			</tr>
			<tr>
				<td></td>
				<td class="text1">사용 가능한 아이디 입니다.</td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="pw" type="password" placeholder="영문/숫자 조합 6~15자"></td>
				<td><img class="pwImg" src="resources/images/pwCheckO.png"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input class="pwCheck" type="password"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td class="text2">비밀번호가 일치합니다</td>
				<td></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input class="nickName" type="text"></td>
				<td><button class="NickNameCheck"><a href="">중복확인</a></button></td>
			</tr>
			<tr>
				<td></td>
				<td class="text3">이미 사용 중인 닉네임 입니다</td>
				<td></td>
			</tr>
		</table>
	</div>
	
	<div class="finalSingUp">
		<button class="signUpButton"><a href="">회원가입</a></button>
	</div>

</body>
</html>