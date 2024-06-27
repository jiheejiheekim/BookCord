<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - searchNotice</title>
<link rel="stylesheet" href="resources/css/notice.css">
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
	  
    $(document).ready(function(){
    	var actionForm = $("#actionForm");
    	$(".paginate_button a").on("click", function(e) {
        	e.preventDefault();
            
            console.log('click');
            
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
    	
    	});
    });
    
    function loginGo(){
		alert('로그인 하세요');
	}
    
    function searchSubmit() {
    	document.getElementById('searchForm').submit();
    }
    
	
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
				<td class="top1" colspan="5"><a href="/bc/main"><img class="logo" src="resources/images/logo.png"></a></td>
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
					<td class="navi2"><a class="naviA" href="notice">공지사항</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="freeBoard">자유게시판</a></td>
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
						<td class="nht1r2d2"><button class="qnaBt"><a href="freeBoard">자유게시판</a></button></td>
					</tr>
					<tr class="nht1tr3">
						<td class="nht1r3d1" colspan="3"><hr style="color:#2D9462"></td>
					</tr>
				</table>
				
				<table class="nhTable2">
					<form id="searchForm" action="/bc/searchNotice" method="get">
						<tr class="nht2tr1">
							<td class="nht2r1d1">
								<select name="select" class="select">
									<option value="제목" selected>제 목</option>
									<option value="글내용">글 내용</option>
								</select>
							</td>
						
							<td class="nht2r1d2">
								<input type="text" name="search" class="search" placeholder="검색어를 입력해 주세요.">
								<a href="#" onclick="searchSubmit()"><img class="searchImg" src="resources/images/search.png"></a>
							</td>		
						
							<td class="nht2r1d3"></td>
						</tr>
					</form>
				</table>
				
				<table class="nhTable3">	<!-- tr12개 td5개 -->
					<tr class="nht3tr1">
							<td class="nht3r1d1">총 ${totalCount} 개</td>
					</tr>
					
					<tr class="nht3tr2">
						<td class="nht3r2d1">번호</td>
						<td class="nht3r2d2">제목</td>
						<td class="nht3r2d3">작성자</td>
						<td class="nht3r2d4">작성일</td>
						<td class="nht3r2d5">조회수</td>
					</tr>
					
					<c:forEach items="${list}" var="lists">
						<tr class="nht3tr3">
							<td class="nht3r3d1">${lists.notice_num}</td>
							<td class="nht3r3d2"><a href="detailNotice/${lists.notice_num}">${lists.title}</a></td>
							<td class="nht3r3d3">${lists.member_name}</td>
							<fmt:formatDate value="${lists.reg_date}" pattern="yyyy-MM-dd" var="formattedDate" />
							<td class="nht3r3d4">${formattedDate}</td>
							<td class="nht3r3d5">${lists.hit}</td>
						</tr>
					</c:forEach>
					
				</table>
				
			</div>	<!-- nhTableDiv -->
			
		</div>	<!-- noticeHead -->
	
	</div>	<!-- content -->
	
	<div class="low">
		<div class="reviewPage">
			<table class="reviewPageTable">
				<tr>
					<c:if test="${pageMaker.prev}">
						<td class="pageLogotd, paginate_button previous">
							<a href="${pageMaker.startPage-1}"><img class="pageLogo1" src="resources/images/pageLeft.png"></a>
						</td>
					</c:if>

					 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					 	<td class="paginate_button ${pageMaker.cri.pageNum == num ? 'bold' : ''}">
					 		<a href="${num}">${num}</a>
					 	</td>
					 </c:forEach>
					 
					<c:if test="${pageMaker.next}">
						<td class="pageLogotd, paginate_button next">
							<a href="${pageMaker.endPage+1}"><img class="pageLogo2" src="resources/images/pageRight.png"></a>
						</td>
					</c:if>
				</tr>
			</table>
		</div>
		
		<form id="actionForm" action="/bc/searchNotice" method="get">
			<input type="hidden" name="select" value="${select}">
			<input type="hidden" name="search" value="${search}">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
		
		<!-- <div class="write">
			<button class="writeBt"><a href="/bc/writeNotice">글쓰기</a></button>
		</div> -->
		
		<div class="write">
			<sec:authorize access="isAnonymous()">
				
			</sec:authorize>
		
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button class="writeBt"><a href="/bc/writeNotice">글쓰기</a></button>
			</sec:authorize>
		</div>
	</div>	<!-- low -->

</body>
</html>