<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - DetailFreeBoard</title>
<link rel="stylesheet" href="../resources/css/detailFreeBoard.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
	function upFreeBoard(freeBoard_num) {
		event.preventDefault();
		console.log('==> ' + freeBoard_num + '번 게시물 수정 요청');
		location.href = '/bc/updateFreeBoard?freeBoard_num='+freeBoard_num;
	}
	
	function delFreeBoard(freeBoard_num) {
		event.preventDefault();
	    console.log('==> ' + freeBoard_num + '번 게시물 삭제 요청');
	    if(confirm('게시물을 삭제하시겠습니까?')){
	        // 게시물 삭제 요청
	        location.href = '/bc/deleteFreeBoard?freeBoard_num='+freeBoard_num;
	        alert('삭제 완료');
	    } else {
	        alert('삭제를 취소했습니다.');
	    }
	}
	
	function loginGo(){
		alert('로그인 하세요');
	}
	
	$(document).ready(function(){
		var member_id = "<c:out value='${sessionScope.member.username}'/>";
		console.log("당신의 아이디 : "+member_id);
		console.log("작성자의 아이디 : "+"<c:out value='${freeBoard.member_id}'/>");
		
		if(member_id === "<c:out value='${freeBoard.member_id}'/>"){
			$(".submit").css("display", "inline-flex");
			//$(".submit").css("display", "block");
		}  else {
			$(".submit").css("display", "none");
		} 
		
	});
	
	
	
	function bookMenu(){
		event.preventDefault();
		$(".noticeMenu").hide();
		$(".myPageMenu").hide();
		
		var bookMenu = document.getElementById('bookMenu');
						
        if (bookMenu.style.display === 'none' || bookMenu.style.display === '') {
        	bookMenu.style.display = 'block';
        } else {
        	bookMenu.style.display = 'none';
        }
	}
	
	function searchFocus(){
		event.preventDefault();
		$(".bookMenu").hide();
		alert('메인 화면에서 검색하세요');
		window.location.href = "/bc/main";
	}
	
	function noticeMenu(){
		event.preventDefault();
		$(".bookMenu").hide();
		$(".myPageMenu").hide();
		
		var noticeMenu = document.getElementById('noticeMenu');
						
        if (noticeMenu.style.display === 'none' || noticeMenu.style.display === '') {
        	noticeMenu.style.display = 'block';
        } else {
        	noticeMenu.style.display = 'none';
        }
	}
	
	function myPageMenu(){
		event.preventDefault();
		$(".bookMenu").hide();
		$(".noticeMenu").hide();
		
		var myPageMenu = document.getElementById('myPageMenu');
						
        if (myPageMenu.style.display === 'none' || myPageMenu.style.display === '') {
        	myPageMenu.style.display = 'block';
        } else {
        	myPageMenu.style.display = 'none';
        }
	}
	
	// 페이지 빈 부분 클릭 시 Menu 숨기기
	$(document).click(function(event) {
		if (!$(event.target).closest('.myPageMenu, .top3').length) {
			$('.myPageMenu').hide();
		}
		if (!$(event.target).closest('.bookMenu, .top5').length) {
			$('.bookMenu').hide();
		}
		if (!$(event.target).closest('.noticeMenu, .top2').length) {
			$('.noticeMenu').hide();
		}
	});
	
</script>
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="/bc/main"><img class="logo" src="../resources/images/logo.png"></a></td>
				<td class="top5"><a href="" onclick="bookMenu()">도서</a></td>
				<td class="top2"><a href="" onclick="noticeMenu()">공지사항</a></td>
				<td class="top3">
					<sec:authorize access="isAnonymous()">
						<a onclick="loginGo()" href="/bc/loginP">마이페이지</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="" onclick="myPageMenu()">마이페이지</a>
					</sec:authorize>
				</td>
				<td class="top4">
					<sec:authorize access="isAnonymous()">
						<a href="/bc/loginP">로그인</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="javascript:logout()">로그아웃</a>
					</sec:authorize>
				</td>
			</tr>
		</table>
		
		<div class="bookMenu" id="bookMenu">
			<table class="bookMenuTable">
				<tr>
					<td><a href="/bc/bestSeller">베스트셀러</a></td>
				</tr>
				<tr>
					<td><a href="/bc/newBooks">신간도서</a></td>
				</tr>
				<tr>
					<td><a href="" onclick="searchFocus()">도서검색</a></td>
				</tr>
			</table>
		</div>	<!-- bookMenu -->
		
		<div class="noticeMenu" id="noticeMenu">
			<table class="noticeMenuTable">
				<tr>
					<td><a href="/bc/notice">공지사항</a></td>
				</tr>
				<tr>
					<td><a href="/bc/freeBoard">자유게시판</a></td>
				</tr>
			</table>
		</div>	<!-- noticeMenu -->
		
		<div class="myPageMenu" id="myPageMenu">
			<table class="myPageMenuTable">
				<tr>
					<td><a href="/bc/memberEdit">회원정보수정</a></td>
				</tr>
				<tr>
					<td><a href="/bc/myReview">나의리뷰</a></td>
				</tr>
				<tr>
					<td><a href="/bc/myBookMark">나의북마크</a></td>
				</tr>
				<tr>
					<td><a href="/bc/admin">관리자</a></td>
				</tr>
			</table>
		</div>	<!-- myPageMenu -->
	
	</div>	<!-- top -->

	<div class="content">
		<div class="navi">
			<table class="naviTable">
				<tr>
					<td class="navi1">공지사항</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="/bc/notice">공지사항</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="/bc/freeBoard">자유게시판</a></td>
				</tr>
			</table>
		</div>	<!-- navi -->
		
		
		<div class="writeNoticeHead">
			<span class="wrHeadSpan">자유게시판</span>
				<form name="form" method="post">
				<div class="wrTableDiv">
					<table class="wrTable1">
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr2">
							<td class="wrt1r2d1">작성자</td>
							<td class="wrt1r2d2">${freeBoard.member_name}</td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr3">
							<td class="wrt1r3d1">제목</td>
							<td class="wrt1r3d2">${freeBoard.title}</td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr4">
							<td class="wrt1r4d1">내용</td>
							<td class="wrt1r4d2 content-display">${freeBoard.content}</td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr5">
							<td class="wrt1r5d1">첨부파일</td>
							<td class="wrt1r5d2">
								<c:forEach var="fileName" items="${freeBoard.files.split(',')}">
									<a href="/bc/downloadF?fileName=${fileName.trim()}">${fileName}</a><br>
						     	 </c:forEach>
						    </td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
					</table>
				</div><!-- wrTableDiv -->
				
				<div class="submit">
					<button type="submit" onclick="upFreeBoard(${freeBoard.freeBoard_num})" class="updateBt">수정</button>
					<button type="submit" onclick="delFreeBoard(${freeBoard.freeBoard_num})" class="deleteBt">삭제</button>
				</div>
			</form>
		</div>	<!-- writeNoticeHead -->
	</div>	<!-- content -->
</body>
</html>