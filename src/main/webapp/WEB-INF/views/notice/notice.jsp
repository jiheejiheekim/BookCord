<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - Notice</title>
<link rel="stylesheet" href="resources/css/notice.css">
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
		
		<div class="noticeHead">
			<span class="noticeHeadSpan">공지사항</span>
			
			<div class="nhTableDiv">
				<table class="nhTable1">
					<tr class="nht1tr">
						<td class="nht1r1d1" colspan="3"><hr style="color:#2D9462"></td>
					</tr>
					<tr class="nht1tr2">
						<td class="nht1r2d1"><button class="noticeBt"><a href="notice">공지사항</a></button></td>
						<td class="nht1r2d2"><button class="qnaBt"><a href="qna">문의하기</a></button></td>
					</tr>
					<tr class="nht1tr3">
						<td class="nht1r3d1" colspan="3"><hr style="color:#2D9462"></td>
					</tr>
				</table>
				
				<table class="nhTable2">
					<tr class="nht2tr1">
						<td class="nht2r1d1">
							<select name="select" class="select">
								<option value="제목" selected>제 목</option>
								<option value="글내용">글내용</option>
							</select>
						</td>
						<td class="nht2r1d2">
							<input type="text" name="search" class="search" placeholder="검색어를 입력해 주세요.">
							<span class="nht2r1d2Span">
								<a href=""><img class="searchImg" src="resources/images/search.png"></a>
							</span>
						<td class="nht2r1d3"></td>
					</tr>
					
					
					
				</table>
			</div>	<!-- nhTableDiv -->
			
		</div>	<!-- myReview -->
	
	</div>	<!-- content -->

</body>
</html>