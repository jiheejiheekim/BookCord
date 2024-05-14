<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - NewBooks</title>
<link rel="stylesheet" href="resources/css/newBooks.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
				<td class="top4"><a href="login">로그아웃</a></td>
			</tr>
		</table>
	</div>

	<div class="content">
	
		<div class="navi">
			<table class="naviTable">
				<tr>
					<td class="navi1">신간도서</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="" data-genreId="0" onclick="genreNewBooks(0,'종합', 1)">종합</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="" data-genreId="55890" onclick="genreNewBooks(55890,'건강/취미/레저', 1)">건강/취미/레저</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="" data-genreId="170" onclick="genreNewBooks(170,'경제경영', 1)">경제경영</a></td>
				</tr>
				<tr>
					<td class="navi5"><a class="naviA" href="" data-genreId="2105" onclick="genreNewBooks(2105,'고전', 1)">고전</a></td>
				</tr>
				<tr>
					<td class="navi6"><a class="naviA" href="" data-genreId="987" onclick="genreNewBooks(987,'과학', 1)">과학</a></td>
				</tr>
				<tr>
					<td class="navi7"><a class="naviA" href="" data-genreId="8257" onclick="genreNewBooks(8257,'대학교재/전문서적', 1)">대학교재/전문서적</a></td>
				</tr>
				<tr>
					<td class="navi8"><a class="naviA" href="" data-genreId="2551" onclick="genreNewBooks(2551,'만화', 1)">만화</a></td>
				</tr>
				<tr>
					<td class="navi9"><a class="naviA" href="" data-genreId="4395" onclick="genreNewBooks(4395,'달력/기타', 1)">달력/기타</a></td>
				</tr>
				<tr>
					<td class="navi10"><a class="naviA" href="" data-genreId="798" onclick="genreNewBooks(798,'사회과학', 1)">사회과학</a></td>
				</tr>
				<tr>
					<td class="navi11"><a class="naviA" href="" data-genreId="1" onclick="genreNewBooks(1,'소설/시/희곡', 1)">소설/시/희곡</a></td>
				</tr>
				<tr>
					<td class="navi12"><a class="naviA" href="" data-genreId="1383" onclick="genreNewBooks(1383,'수험서/자격증', 1)">수험서/자격증</a></td>
				</tr>
				<tr>
					<td class="navi13"><a class="naviA" href="" data-genreId="1108" onclick="genreNewBooks(1108,'어린이', 1)">어린이</a></td>
				</tr>
				<tr>
					<td class="navi14"><a class="naviA" href="" data-genreId="55889" onclick="genreNewBooks(55889,'에세이', 1)">에세이</a></td>
				</tr>
				<tr>
					<td class="navi15"><a class="naviA" href="" data-genreId="1196" onclick="genreNewBooks(1196,'여행', 1)">여행</a></td>
				</tr>
				<tr>
					<td class="navi16"><a class="naviA" href="" data-genreId="74" onclick="genreNewBooks(74,'역사', 1)">역사</a></td>
				</tr>
				<tr>
					<td class="navi17"><a class="naviA" href="" data-genreId="517" onclick="genreNewBooks(517,'예술/대중문화', 1)">예술/대중문화</a></td>
				</tr>
				<tr>
					<td class="navi18"><a class="naviA" href="" data-genreId="1230" onclick="genreNewBooks(1230,'요리/살림', 1)">요리/살림</a></td>
				</tr>
				<tr>
					<td class="navi19"><a class="naviA" href="" data-genreId="1322" onclick="genreNewBooks(1322,'외국어', 1)">외국어</a></td>
				</tr>
				<tr>
					<td class="navi20"><a class="naviA" href="" data-genreId="13789" onclick="genreNewBooks(13789,'유아', 1)">유아</a></td>
				</tr>
				<tr>
					<td class="navi21"><a class="naviA" href="" data-genreId="656" onclick="genreNewBooks(656,'인문학', 1)">인문학</a></td>
				</tr>
				<tr>
					<td class="navi22"><a class="naviA" href="" data-genreId="336" onclick="genreNewBooks(336,'자기계발', 1)">자기계발</a></td>
				</tr>
				<tr>
					<td class="navi23"><a class="naviA" href="" data-genreId="112011" onclick="genreNewBooks(112011,'장르소설', 1)">장르소설</a></td>
				</tr>
				<tr>
					<td class="navi24"><a class="naviA" href="" data-genreId="2913" onclick="genreNewBooks(2913,'잡지', 1)">잡지</a></td>
				</tr>
				<tr>
					<td class="navi25"><a class="naviA" href="" data-genreId="17195" onclick="genreNewBooks(17195,'전집/중고전집', 1)">전집/중고전집</a></td>
				</tr>
				<tr>
					<td class="navi26"><a class="naviA" href="" data-genreId="1237" onclick="genreNewBooks(1237,'종교/역학', 1)">종교/역학</a></td>
				</tr>
				<tr>
					<td class="navi27"><a class="naviA" href="" data-genreId="2030" onclick="genreNewBooks(2030,'좋은부모', 1)">좋은부모</a></td>
				</tr>
				<tr>
					<td class="navi28"><a class="naviA" href="" data-genreId="1137" onclick="genreNewBooks(1137,'청소년', 1)">청소년</a></td>
				</tr>
				<tr>
					<td class="navi29"><a class="naviA" href="" data-genreId="351" onclick="genreNewBooks(351,'컴퓨터/모바일', 1)">컴퓨터/모바일</a></td>
				</tr>
				<tr>
					<td class="navi30"><a class="naviA" href="" data-genreId="50246" onclick="genreNewBooks(50246,'초등학교참고서', 1)">초등학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi31"><a class="naviA" href="" data-genreId="77541" onclick="genreNewBooks(77541,'중학교참고서', 1)">중학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi32"><a class="naviA" href="" data-genreId="76001" onclick="genreNewBooks(76001,'고등학교참고서', 1)">고등학교참고서</a></td>
				</tr>
			</table>
		</div>
		<!-- navi -->
		
		<div class="nb">
		
			<div class="nbhead">
				<table class="nbBtTable">
					<tr>
						<td class="nbSpan">종합<span></td>
						<td><button class="day"><a href="">등록일순</a></button></td>
						<td><button class="name"><a href="">상품명순</a></button></td>
						<td><button class="starRank"><a href="">평점순</a></button></td>
					</tr>
				</table>
			</div>

			<div class="nbTableDiv">
				<table class="nbTable">
					<c:forEach items="${books}" var="book" varStatus="j">
					<tr class="nb1">
						<td class="nbtd1" rowspan="6"><img class="bookImg" src="${book.cover}"></td>
						<td class="nb1td2">.</td>
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

	$(document).ready(function() {
	    $('.pageNum').first().css('font-weight', 'bold');
	    rank(1);
	});
	
	var currentPage = 1;
    var selectedGenreId;
	var selectedGenreName;
	var pageNumber = 1;
	
	console.log('페이지 로드 - ' + currentPage + ' 요청 중');

	$('.naviA').click(function(event) {
	    console.log('4. 새로운 장르 클릭');
	    event.preventDefault(); 
	        
	    $('.naviA').css('color', 'white');
	    
	    $(this).css('color', 'black');
	    
	    selectedGenreId = $(this).attr('data-genreId');
	    selectedGenreName = $(this).text();
	    console.log("- 선택된 장르 ID:", selectedGenreId);
	    console.log("- 선택된 장르 이름:", selectedGenreName);
			    
	    currentPage=1;
	    updatePageNum();
	    bold();
	});

    function genreNewBooks(genreId, name, pageNumber) {
    	
    	if(!genreId | !name){
    		genreId = 0;
    		name = '종합';
    	}
    	
    	console.log('1. 장르별 책 목록 요청 중');
    	console.log('2. 카테고리아이디 : '+genreId);
    	console.log('3. 카테고리명 : '+name);
    	
        $.ajax({
            url: '/bc/getNewBooks',
            method: 'GET', 
            data: { genreId: genreId, pageNumber: pageNumber },
            success: function(response) {
            	var $response = $(response);
                var newBs = $response.find('.nb').html();
                $('.nb').html(newBs);
                $('.nbSpan').html(name);
            },
            
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
	
	
    
	function page(pageNumber) {
		event.preventDefault();
	    console.log('페이지 ' + pageNumber + ' 요청 중');
	    
	    if (!selectedGenreId || !selectedGenreName) {
	        console.log('장르 정보가 없습니다 ==> 종합 '+ pageNumber +'페이지 요청 중');
	        selectedGenreId=0;
	    }
	    genreNewBooks(selectedGenreId, selectedGenreName, pageNumber);
	    currentPage = pageNumber;
	    updatePageNum();
	    bold();
	    
	    $('.pageNum').click(function(event) {
			event.preventDefault(); 
	    	$('.pageNum').css('font-weight', 'normal');
	    	$(this).css('font-weight', 'bold');
	    	
		});
	    	rank(pageNumber);
	    
	    
	}
	

	function rank(pageNumber) {
	    var startIndex = (pageNumber - 1) * 10 + 1;
	    var rows = $('.nbTable tr');
	    for (var i = 0; i < rows.length; i++) {
	        if (i < 10) {
	            var rank = startIndex + i;
	            $(rows[i]).find('.nb1td2').html(rank + '.');
	        }
	    }
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