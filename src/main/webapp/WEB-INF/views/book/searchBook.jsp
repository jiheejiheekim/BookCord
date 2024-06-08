<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - NewBooks</title>
<link rel="stylesheet" href="resources/css/searchBook.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				<td class="top1" colspan="5"><a href="main">
					<img class="logo" src="resources/images/logo.png"></a></td>
				<td class="top2"><a href="notice">공지사항</a></td>
				<td class="top3"><a href="memberEdit">마이페이지</a></td>
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

			<div class="nbTableDiv">
				<table class="nbTable">
					<c:forEach items="${books}" var="book" varStatus="j">
						<tr class="nb1">
							<td class="nbtd1" rowspan="6"><img class="bookImg" src="${book.cover}"></td>
							<td class="nb1td2"></td>
							<td class="nb1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkO.png"></a></td>
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
	            	<a href="" onclick="prevPage()"><img class="pageLogo1" src="resources/images/pageLeft.png"></a>
				</td>
				
				<c:forEach begin="1" end="5" var="i">
					<td><a class="pageNum" href="" onclick="page(${i})">${i}</a></td>
            	</c:forEach>
				
            
				<td class="pageLogotd">
	            	<a href="" onclick="nextPage()"><img class="pageLogo2" src="resources/images/pageRight.png"></a>
				</td>
			</tr>
		</table>
	</div>
	
	
<script>

	var currentPage = 1;
	var ranking;
	var query = "${searchQuery}";
	
	function rank(currentPage) {
	    for (i = 1; i <= 10; i++) {
	        ranking = (currentPage - 1) * 10 + i;
	        $('.nb1td2').eq(i - 1).html(ranking + '.');
	    }
	}
	
		
	
	$(document).ready(function() {
	    $('.pageNum').first().css('font-weight', 'bold');
	    rank(currentPage);
	    console.log("검색어 >> "+query);
	});
	
    
	var pageNumber = 1;
	
	console.log('페이지 로드 - ' + currentPage + ' 요청 중');

	$('.naviA').click(function(event) {
	    console.log('4. 새로운 장르 클릭');
	    event.preventDefault(); 
	        
	    $('.naviA').css('color', 'white');
	    
	    $(this).css('color', 'black');
	    
	    
			    
	    currentPage=1;
	    updatePageNum();
	    bold();
	});
	
    function getSearchBook(query, pageNumber) {
    	

    	
        $.ajax({
            url: '/bc/getSearchBook',
            method: 'GET', 
            data: { query: query, pageNumber: pageNumber },
            success: function(response) {
            	var $response = $(response);
                var newBs = $response.find('.nb').html();
                $('.nb').html(newBs);
                $('.nbSpan').html(name);
                rank(currentPage);
            },
            
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
	function page(pageNumber) {
		event.preventDefault();
	    console.log('페이지 ' + pageNumber + ' 요청 중');
	    	   
	    getSearchBook(query, pageNumber);
	    currentPage = pageNumber;
	    updatePageNum();
	    bold();
	    
	    
	    $('.pageNum').click(function(event) {
			event.preventDefault(); 
	    	$('.pageNum').css('font-weight', 'normal');
	    	$(this).css('font-weight', 'bold');
		});
	    	rank(currentPage);
	}
	

	
	function bold() {
	    $('.pageNum').css('font-weight', 'normal');
	    
	    $('.pageNum').filter(function() {
	        return $(this).text() == currentPage;
	    }).css('font-weight', 'bold');
	}

	function prevPage() {
		event.preventDefault(); 
	    if (currentPage > 1) {
	        currentPage = 5;
	        updatePageNum();
	        page(currentPage);
	    }
	}
	
	function nextPage() {
		event.preventDefault(); 
	    if (currentPage < 6) {
	        currentPage = 6;
	        updatePageNum();
	        page(currentPage);
	        
	    }
	}
	
	function updatePageNum() {
	    var startPage = currentPage < 6 ? 1 : 6;
	    var endPage = currentPage < 6 ? 5 : 10;

	    if (startPage < 1) {
	        startPage = 1;
	    }

	    if (endPage < startPage) {
	        endPage = startPage;
	    }

	    var pageNumElements = $('.pageNum');
	    var i = 0;
	    for (var pageNum = startPage; pageNum <= endPage; pageNum++) {
	        $(pageNumElements[i]).text(pageNum);
	        $(pageNumElements[i]).attr('onclick', 'page(' + pageNum + ')');
	        i++;
	    }
	}


 
</script>

</body>
</html>