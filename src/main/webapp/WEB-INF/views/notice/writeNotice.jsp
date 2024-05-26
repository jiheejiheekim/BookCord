<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - WriteNotice</title>
<link rel="stylesheet" href="resources/css/writeNotice.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img
						class="logo" src="resources/images/logo.png"></a></td>
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
					<td class="navi1">공지사항</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="notice">공지사항</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="qna">문의하기</a></td>
				</tr>
			</table>
		</div>	<!-- navi -->
		
		<div class="writeNoticeHead">
			<span class="wrHeadSpan">공지사항</span>
			
			<div class="wrTableDiv">
				<table class="wrTable1">
					<tr class="wrt1tr">
						<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
					</tr>
					<tr class="wrt1tr2">
						<td class="wrt1r2d1">작성자</td>
						<td class="wrt1r2d2"><input type="text" class="writer" value="관리자"></td>
					</tr>
					<tr class="wrt1tr3">
						<td class="wrt1r3d1">제목</td>
						<td class="wrt1r3d2"><input type="text" class="title"></td>
					</tr>
					<tr class="wrt1tr4">
						<td class="wrt1r4d1">내용</td>
						<td class="wrt1r4d2"><textarea class="noticeContent" rows="15" cols="8"></textarea></td>
					</tr>
					<tr class="wrt1tr5">
						<td class="wrt1r5d1">첨부파일</td>
						<td class="wrt1r5d2"><input type="file" class="file"></td>
					</tr>
				</table>
			</div><!-- wrTableDiv -->
			
			<div class="submit">
				<button type="submit" class="writeBt"><a href="/bc/detailNotice">글쓰기</a></button>
			</div>
			
		</div>	<!-- writeNoticeHead -->
	</div>	<!-- content -->
</body>
</html>