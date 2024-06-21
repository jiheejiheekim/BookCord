<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - NewBooks</title>
<link rel="stylesheet" href="resources/css/searchBook.css">
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
	
	var csrfToken = "${_csrf.token}";
	var csrfParameterName = "${_csrf.parameterName}";
	var member_id = "<c:out value='${sessionScope.member.username}'/>";

	//console.log("csrfToken >> "+csrfToken);
	//console.log("csrfParameterName >> "+csrfParameterName);


	function bookmark(event, title, author, isbn13, cover) {
		event.preventDefault(); 
	 	
	 	if(!member_id){
	 		alert('북마크 실패 - 로그인 하세요');
	 		return;
	 	}
	 	
	    console.log('Member ID : ' + member_id + '\n제목 : ' + title + '\n작가 : ' + author + '\nisbn13 : ' + isbn13 + '\ncover : ' + cover);
	    
	    var data = {
				member_id: member_id,
				title: title,
				author: author,
				isbn13: isbn13,
				cover: cover
			};

	 	// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
	 	$.ajax({
	 		type : 'POST',
	 		url : '/bc/isBookMarked',
	 		data : data,
	 		dataType : 'JSON',
	 		success:function(response){
	 			if(response){
	 				alert('이미 북마크 된 도서입니다');
	 			}else{
	 				 $.ajax({
	 			    	type: "POST",
	 			        url: "/bc/bookmark",
	 			        data: data,
	 			        dataType: "JSON",
	 			        success: function(response) {
	 			            alert('북마크 성공');
	 			        },
	 			        error:function(request,status,error){
	 			            console.log("북마크 FAIL >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error); // 실패 시 처리
	 			            alert('북마크 실패');
	 			        }
	 			    });
	 			}
	 		},
	 		error:function(request,status,error){
	            console.log("북마크 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error); // 실패 시 처리
	            alert('북마크 실패');
	        }
	 	});
	   
	}
	
	function loginGo(){
		alert('로그인 하세요');
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
					<td class="navi1">검색 도서</td>
				</tr>
			</table>
		</div>
		<!-- navi -->
		
		<div class="nb">
<br>
		 	<div class="sbhead">
				<span id="sbheadspan1">" ${searchQuery}</span>　　"　<span id="sbheadspan2">　검색 결과입니다</span>
			</div>
<br><br>			
			<div class="totalBooks">
		        <span>　총 ${totalResult}개의 도서가 검색되었습니다.</span>
		    </div>

			<div class="nbTableDiv">
				<table class="nbTable">
					<c:forEach items="${books}" var="book" varStatus="j">
						<tr class="nb1">
							<td class="nbtd1" rowspan="6"><img class="bookImg" src="${book.cover}"></td>
							<td class="nb1td2"></td>
							<td class="nb1td3">
								<a href="javascript:void(0)" onclick="bookmark(event, '${book.title}', '${book.author}', '${book.isbn13}', '${book.cover}')">
									<img class="bookMarkImg" src="resources/images/bookmarkO.png">
								</a>
							</td>
						</tr>
						<tr class="nb2">
							<!-- <td></td> -->
							<td class="nb2td2"><a href="/bc/detail/${book.isbn13}">${book.title}</a></td>
						</tr>
						<tr class="nb3">
							<!-- <td></td> -->
							<td class="nb3td2">${book.author}</td>
						</tr>
						<tr class="nb4">
							<!-- <td></td> -->
							<fmt:formatDate value="${book.pubDate}" pattern="yyyy-MM-dd" var="formattedDate" />
							<td class="nb4td2">${book.publisher} | ${formattedDate}</td>
						</tr>
						<tr class="nb5">
							<!-- <td></td> -->
							<td class="nb5td2">　</td>
						</tr>
						<tr class="nb6">
							<!-- <td></td> -->
							<td class="nb6td2">
								<c:if test="${book.customerReviewRank == 10}">	<!-- customerReviewRank:알라딘평점 -->
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 10 and book.customerReviewRank >= 9.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="starh" src="resources/images/halfStar.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 9.0 and book.customerReviewRank >= 8.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 8.0 and book.customerReviewRank >= 7.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="starh" src="resources/images/halfStar.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 7.0 and book.customerReviewRank >= 6.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 6.0 and book.customerReviewRank >= 5.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						            <img class="starh" src="resources/images/halfStar.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 5.0 and book.customerReviewRank >= 4.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/star.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 4.0 and book.customerReviewRank >= 3.0}">
						            <img class="star" src="resources/images/star.png">
						            <img class="star" src="resources/images/halfStar.png">
						        </c:if>
						        <c:if test="${book.customerReviewRank < 3.0 and book.customerReviewRank >= 2.0}">
						            <img class="star" src="resources/images/star.png">
						        </c:if>
								<span class="black"> ${book.customerReviewRank}</span>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				
			</div>
			<!-- nbTableDiv -->
		</div>
		<!-- nb -->

	</div>
	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<td class="pageLogotd">
	            	<a href="" onclick="prevPage(event)"><img class="pageLogo1" src="resources/images/pageLeft.png"></a>
				</td>
				
				<c:forEach begin="1" end="5" var="i">
					<td><a class="pageNum" href="" onclick="page(${i})">${i}</a></td>
            	</c:forEach>
				
            
				<td class="pageLogotd">
	            	<a href="" onclick="nextPage(event)"><img class="pageLogo2" src="resources/images/pageRight.png"></a>
				</td>
			</tr>
		</table>
	</div>
	
	
<script>

	var currentPage = 1;
	var ranking;
	var query = "";
	var totalResult = ${totalResult};
	
	function rank(currentPage) {
	    for (i = 1; i <= 10; i++) {
	        ranking = (currentPage - 1) * 10 + i;
	        $('.nb1td2').eq(i - 1).html(ranking + '.');
	    }
	}
	
	
	$(document).ready(function() {
		updatePageNum(); 
		updatePrevPageVisibility();
		
	    $('.pageNum').first().css('font-weight', 'bold');
	    
	    rank(currentPage);
	    
	    query = "${searchQuery}";
	    totalResult = ${totalResult};
	    console.log("검색어 >> " + query);
	    console.log("총 검색 결과 >> " + totalResult + "개");

	    $('.totalBooks span').text("");
	    $('.totalBooks span').text("총 " + totalResult + "개의 도서가 검색되었습니다.");
	        
	    $('.pageNum').click(function(event) {
	        event.preventDefault();
	        var pageNumber = parseInt($(this).text());
	        //page(pageNumber);
	    });
	    
	});
	

	var pageNumber = 1;
	console.log('페이지 로드 - ' + currentPage + ' 요청 중');
		
    function getSearchBook(query, pageNumber) {
        $.ajax({
            url: '/bc/getSearchBook',
            method: 'GET', 
            data: { query: query, pageNumber: pageNumber },
            success: function(response) {
            	 var $response = $(response); 
                 var newBs = $response.find('.nbTableDiv').html(); 
                 //console.log(newBs); 
                 $('.nbTableDiv').html(newBs); 
                 rank(currentPage);
            },
            
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }

	
	//페이지 이동
	function page(pageNumber) {
	    console.log('검색어 \''+query+'\'와 페이지 ' + pageNumber + ' 요청 중');
	    getSearchBook(query, pageNumber);
	    currentPage = pageNumber;
	    updatePageNum();
	    bold();
	    rank(currentPage);
	    updatePrevPageVisibility();
	}

	function bold() {
	    $('.pageNum').css('font-weight', 'normal');
	    
	    $('.pageNum').filter(function() {
	        return $(this).text() == currentPage;
	    }).css('font-weight', 'bold');
	}


	//이전 페이지로 이동
	function prevPage(event) {
	    event.preventDefault(); 
	    var startPage = Math.floor((currentPage - 1) / 5) * 5; 
	    if (startPage >= 1) { 
	        currentPage = startPage;
	        updatePageNum();
	        page(currentPage);
	        
	    }
	}

	//다음 페이지로 이동
	function nextPage(event) {
	    event.preventDefault(); 
	    var startPage = Math.floor((currentPage - 1) / 5) * 5;
	    var nextPage = startPage + 6; 
	    if (nextPage <= Math.ceil(totalResult / 10)) { 
	        currentPage = nextPage;
	        updatePageNum();
	        page(currentPage);
	    }
	}
	
	//페이지 번호 업데이트
	function updatePageNum() {
		var totalPages = Math.ceil(totalResult / 10); // 전체 페이지 수
	    var startPage = Math.floor((currentPage - 1) / 5) * 5 + 1;
	    var endPage = startPage + 4;
	    
	    if (endPage > Math.ceil(totalResult / 10)) {
	        endPage = Math.ceil(totalResult / 10);
	    }
	    
	    var pageNumElements = $('.pageNum');
	    
	    for (var i = 0; i < pageNumElements.length; i++) {
	        var pageNum = startPage + i;
	        if (pageNum <= endPage) {
	            $(pageNumElements[i]).text(pageNum);
	            $(pageNumElements[i]).attr('onclick', 'page(' + pageNum + ')');
	        } else {
	            $(pageNumElements[i]).hide(); 
	        }
	    }

	    if (endPage >= totalPages) {
	        $('.pageLogo2').hide();
	    } else {
	        $('.pageLogo2').show();
	    }
	}

	//이전 페이지로 가는 이미지 표시 여부 업데이트
	function updatePrevPageVisibility() {
	    if (currentPage <= 5) {
	        $('.pageLogo1').hide();
	    } else {
	        $('.pageLogo1').show();
	    }
	}


 
</script>

</body>
</html>