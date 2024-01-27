<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - MemberEdit</title>
<link rel="stylesheet" href="resources/css/memberEdit.css">
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
				<td class="top2"><a href="notice">공지사항</a></td>
				<td class="top3"><a href="memberEdit">마이페이지</a></td>
				<td class="top4"><a href="login">로그아웃</a></td>
			</tr>
		</table>
	</div>
	
	<div class="content">
	
		<div class="navi">
			<table class="naviTable">
				<tr>
					<td class="navi1">마이페이지</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="memberEdit">회원정보 수정</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="myReview">나의 리뷰</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="myBookMark">나의 북마크</a></td>
				</tr>
			</table>
		</div>
		
		<div class="memberEdit">
			<span class="memberEditSpan">회원정보 수정</span>
			
			<div class="Edit">
				<table class="EditTable">
					<tr>
						<td>아이디</td>
						<td colspan="2">bookcord123</td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
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
						<td class="text1">비밀번호가 일치합니다</td>
						<td></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input class="nickName" type="text" value="북코드닉네임"></td>
						<td><button class="NickNameCheck"><a href="">중복확인</a></button></td>
					</tr>
					<tr>
						<td></td>
						<td class="text2">이미 사용 중인 닉네임 입니다</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	
	
	
	
	
	</div>
</body>
</html>