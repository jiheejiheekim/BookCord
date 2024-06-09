<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - QnA</title>
<link rel="stylesheet" href="resources/css/qna.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img
						class="logo" src="resources/images/logo.png"></a></td>
				<td class="top2"><a href="notice">공지사항</a></td>
				<td class="top3">
					<sec:authorize access="isAnonymous()">
						<a onclick="loginGo()" href="/bc/loginP">마이페이지</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="memberEdit">마이페이지</a>
					</sec:authorize>
				</td>
				<td class="top4">
					<sec:authorize access="isAnonymous()">
						<a href="loginP">로그인</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="javascript:logout()">로그아웃</a>
					</sec:authorize>
				</td>
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
			<span class="noticeHeadSpan">문의하기</span>
			
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
								<option value="글내용">글 내용</option>
							</select>
						</td>
						<td class="nht2r1d2">
							<input type="text" name="search" class="search" placeholder="검색어를 입력해 주세요.">
							<a href=""><img class="searchImg" src="resources/images/search.png"></a>
							
						<td class="nht2r1d3"></td>
					</tr>
				</table>
				
				<table class="nhTable3">	<!-- tr12개 td5개 -->
					<tr class="nht3tr1">
						<td class="nht3r1d1">10 개</td>
					</tr>
					
					<tr class="nht3tr2">
						<td class="nht3r2d1">번호</td>
						<td class="nht3r2d2">제목</td>
						<td class="nht3r2d3">작성자</td>
						<td class="nht3r2d4">작성일</td>
						<td class="nht3r2d5">조회수</td>
					</tr>
					
					<tr class="nht3tr3">
						<td class="nht3r3d1">10</td>
						<td class="nht3r3d2">북코드 공지사항 10번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">9</td>
						<td class="nht3r3d2">북코드 공지사항 9번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">8</td>
						<td class="nht3r3d2">북코드 공지사항 8번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">7</td>
						<td class="nht3r3d2">북코드 공지사항 7번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">6</td>
						<td class="nht3r3d2">북코드 공지사항 6번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">5</td>
						<td class="nht3r3d2">북코드 공지사항 5번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">4</td>
						<td class="nht3r3d2">북코드 공지사항 4번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">3</td>
						<td class="nht3r3d2">북코드 공지사항 3번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">2</td>
						<td class="nht3r3d2">북코드 공지사항 2번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
					<tr class="nht3tr3">
						<td class="nht3r3d1">1</td>
						<td class="nht3r3d2">북코드 공지사항 1번째 글</td>
						<td class="nht3r3d3">북코드</td>
						<td class="nht3r3d4">2024-03-20</td>
						<td class="nht3r3d5">20</td>
					</tr>
				</table>
				
			</div>	<!-- nhTableDiv -->
			
		</div>	<!-- myReview -->
	
	</div>	<!-- content -->
	
	<div class="reviewPage">
		<table class="reviewPageTable">
			<tr>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="resources/images/pageLeft.png"></a></td>
				<td><a class="bold">1</a></td>
				<td><a href="">2</a></td>
				<td><a href="">3</a></td>
				<td><a href="">4</a></td>
				<td><a href="">5</a></td>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="resources/images/pageRight.png"></a></td>
			</tr>
		</table>
	</div>

</body>
</html>