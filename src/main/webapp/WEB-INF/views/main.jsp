<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
				<td class="top2"><a href="notice">공지사항</a></td>
				<td class="top3"><a href="login">로그인</a></td>
			</tr>
		</table>
	</div>
	
	<div class="mid">
		문구 길게 대충 감명 깊은척
	</div>
	
	<br>
	
	<div class="search">
		<table>
			<tr>
				<td><img class="searchimg" src="resources/images/search.png"></td>
				<td><input class="searchinput" type="text" placeholder="도서 제목, 작가를 검색해보세요"></td>
			</tr>
		</table>
	</div>
	
	<br>
	
	<div class="bestseller">
		<table class="bshead">
			<tr>
				<td class="bshead1" colspan="4">　베스트 셀러</td>
				<td class="bshead2"><button class="bsbutton"><a href="/book/bestSeller">더보기　　></a></button></td>
			</tr>
		</table>
		
		<table class="bslist">
			<tr>
				<td><div class="bookimg"></div></td>
				<td><div class="bookimg"></div></td>
				<td><div class="bookimg"></div></td>
				<td><div class="bookimg"></div></td>
			</tr>
			<tr>
				<td>책제목</td>
				<td>책제목</td>
				<td>책제목</td>
				<td>책제목</td>
			</tr>
			<tr>
				<td>작가</td>
				<td>작가</td>
				<td>작가</td>
				<td>작가</td>
			</tr>
		</table>
	</div>
	
	<br><br>
	
	<div class="newBooks">
		<table class="bshead">
			<tr>
				<td class="bshead1" colspan="4">　신간 도서</td>
				<td class="bshead2"><button class="bsbutton"><a href="/book/newBooks">더보기　　></a></button></td>
			</tr>
		</table>
		
		<table class="bslist">
			<tr>
				<td><div class="bookimg"></div></td>
				<td><div class="bookimg"></div></td>
				<td><div class="bookimg"></div></td>
				<td><div class="bookimg"></div></td>
			</tr>
			<tr>
				<td>책제목</td>
				<td>책제목</td>
				<td>책제목</td>
				<td>책제목</td>
			</tr>
			<tr>
				<td>작가</td>
				<td>작가</td>
				<td>작가</td>
				<td>작가</td>
			</tr>
		</table>
	</div>
	
	<br><br>
	
	
</body>
</html>