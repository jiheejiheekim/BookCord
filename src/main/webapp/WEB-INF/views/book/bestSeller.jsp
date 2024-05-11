<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - BestSeller</title>
<link rel="stylesheet" href="resources/css/bestSeller.css">
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
					<td class="navi1">베스트셀러</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="" onclick="genreBestSeller(0,'종합')">종합</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="" onclick="genreBestSeller(55890,'건강/취미/레저')">건강/취미/레저</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="" onclick="genreBestSeller(170,'경제경영')">경제경영</a></td>
				</tr>
				<tr>
					<td class="navi5"><a class="naviA" href="" onclick="genreBestSeller(2105,'고전')">고전</a></td>
				</tr>
				<tr>
					<td class="navi6"><a class="naviA" href="" onclick="genreBestSeller(987,'과학')">과학</a></td>
				</tr>
				<tr>
					<td class="navi7"><a class="naviA" href="" onclick="genreBestSeller(8257,'대학교재/전문서적')">대학교재/전문서적</a></td>
				</tr>
				<tr>
					<td class="navi8"><a class="naviA" href="" onclick="genreBestSeller(2551,'만화')">만화</a></td>
				</tr>
				<tr>
					<td class="navi9"><a class="naviA" href="" onclick="genreBestSeller(4395,'달력/기타')">달력/기타</a></td>
				</tr>
				<tr>
					<td class="navi10"><a class="naviA" href="" onclick="genreBestSeller(798,'사회과학')">사회과학</a></td>
				</tr>
				<tr>
					<td class="navi11"><a class="naviA" href="" onclick="genreBestSeller(1,'소설/시/희곡')">소설/시/희곡</a></td>
				</tr>
				<tr>
					<td class="navi12"><a class="naviA" href="" onclick="genreBestSeller(1383,'수험서/자격증')">수험서/자격증</a></td>
				</tr>
				<tr>
					<td class="navi13"><a class="naviA" href="" onclick="genreBestSeller(1108,'어린이')">어린이</a></td>
				</tr>
				<tr>
					<td class="navi14"><a class="naviA" href="" onclick="genreBestSeller(55889,'에세이')">에세이</a></td>
				</tr>
				<tr>
					<td class="navi15"><a class="naviA" href="" onclick="genreBestSeller(1196,'여행')">여행</a></td>
				</tr>
				<tr>
					<td class="navi16"><a class="naviA" href="" onclick="genreBestSeller(74,'역사')">역사</a></td>
				</tr>
				<tr>
					<td class="navi17"><a class="naviA" href="" onclick="genreBestSeller(517,'예술/대중문화')">예술/대중문화</a></td>
				</tr>
				<tr>
					<td class="navi18"><a class="naviA" href="" onclick="genreBestSeller(1230,'요리/살림')">요리/살림</a></td>
				</tr>
				<tr>
					<td class="navi19"><a class="naviA" href="" onclick="genreBestSeller(1322,'외국어')">외국어</a></td>
				</tr>
				<tr>
					<td class="navi20"><a class="naviA" href="" onclick="genreBestSeller(13789,'유아')">유아</a></td>
				</tr>
				<tr>
					<td class="navi21"><a class="naviA" href="" onclick="genreBestSeller(656,'인문학')">인문학</a></td>
				</tr>
				<tr>
					<td class="navi22"><a class="naviA" href="" onclick="genreBestSeller(336,'자기계발')">자기계발</a></td>
				</tr>
				<tr>
					<td class="navi23"><a class="naviA" href="" onclick="genreBestSeller(112011,'장르소설')">장르소설</a></td>
				</tr>
				<tr>
					<td class="navi24"><a class="naviA" href="" onclick="genreBestSeller(2913,'잡지')">잡지</a></td>
				</tr>
				<tr>
					<td class="navi25"><a class="naviA" href="" onclick="genreBestSeller(17195,'전집/중고전집')">전집/중고전집</a></td>
				</tr>
				<tr>
					<td class="navi26"><a class="naviA" href="" onclick="genreBestSeller(1237,'종교/역학')">종교/역학</a></td>
				</tr>
				<tr>
					<td class="navi27"><a class="naviA" href="" onclick="genreBestSeller(2030,'좋은부모')">좋은부모</a></td>
				</tr>
				<tr>
					<td class="navi28"><a class="naviA" href="" onclick="genreBestSeller(1137,'청소년')">청소년</a></td>
				</tr>
				<tr>
					<td class="navi29"><a class="naviA" href="" onclick="genreBestSeller(351,'컴퓨터/모바일')">컴퓨터/모바일</a></td>
				</tr>
				<tr>
					<td class="navi30"><a class="naviA" href="" onclick="genreBestSeller(50246,'초등학교참고서')">초등학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi31"><a class="naviA" href="" onclick="genreBestSeller(77541,'중학교참고서')">중학교참고서</a></td>
				</tr>
				<tr>
					<td class="naviA"><a href="" onclick="genreBestSeller(76001,'고등학교참고서')">고등학교참고서</a></td>
				</tr>
			</table>
		</div>
		<!-- navi -->
		
		<div class="bs">
		
			<div class="bshead">
				<table class="bsBtTable">
					<tr>
						<td class="bsSpan">종합</td>
						<td><button class="week"><a href="">주간 베스트</a></button></td>
						<td><button class="month"><a href="">월간 베스트</a></button></td>
						<td><button class="year"><a href="">연간 베스트</a></button></td>
					</tr>
				</table>
			</div>

			<div class="bsTableDiv">
				<table class="bsTable">
					<c:forEach items="${books}" var="book">
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><img class="bookImg" src="${book.cover}"></td>
						<td class="bs1td2">${book.bestRank}.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkO.png"></a></td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2"><a href="/bc/bookDetail/${book.isbn13}">${book.title}</a></td>
					</tr>
					<tr class="bs3">
						<!-- <td></td> -->
						<td class="bs3td2">${book.author}</td>
					</tr>
					<tr class="bs4">
						<!-- <td></td> -->
						<fmt:formatDate value="${book.pubDate}" pattern="yyyy-MM-dd" var="formattedDate" />
						<td class="bs4td2">${book.publisher} | ${formattedDate}</td>
					</tr>
					<tr class="bs5">
						<!-- <td></td> -->
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<!-- <td></td> -->
						<td class="bs6td2">
							<c:if test="${book.customerReviewRank >= 9.5}">	<!-- customerReviewRank:알라딘평점 -->
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 9.5 and book.customerReviewRank >= 9.0}">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="starh" src="resources/images/halfStar.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 9.0 and book.customerReviewRank >= 8.5}">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 8.5 and book.customerReviewRank >= 8.0}">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="star" src="resources/images/star.png">
					            <img class="starh" src="resources/images/halfStar.png">
					        </c:if>
							<span class="black"> ${book.customerReviewRank}</span>
						</td>
					</tr>
					</c:forEach>
				</table>
				
				
				
				
			</div>
			<!-- bsTableDiv -->
		</div>
		<!-- bs -->

	</div>
	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="resources/images/pageLeft.png"></a></td>
				<td class="bold"><a class="pageNum" data-genreId="${genreId}" onclick="page(this)">1</a></td>
				<td><a class="pageNum" href="" data-genreId="${genreId}" onclick="page(this)">2</a></td>
				<td><a class="pageNum" href="" data-genreId="${genreId}" onclick="page(this)">3</a></td>
				<td><a class="pageNum" href="" data-genreId="${genreId}" onclick="page(this)">4</a></td>
				<td><a class="pageNum" href="" data-genreId="${genreId}" onclick="page(this)">5</a></td>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="resources/images/pageRight.png"></a></td>
			</tr>
		</table>
	</div>


<script>

	$('.naviA').click(function(event) {
	    console.log('1. 새로운 장르 클릭');
	    event.preventDefault(); 
	        
	    $('.naviA').css('color', 'white');
	    
	    $(this).css('color', 'black');
		/*
	    var genreId = $(this).attr('data-genreId');
	    var name = $(this).text();*/
	    
	});

    function genreBestSeller(genreId, name) {
    	console.log('2. 장르별 책 목록 요청 중');
    	console.log('3.카테고리아이디 : '+genreId+' / 카테고리명 : '+name);
    	
        $.ajax({
            url: '/bc/getBooks', 
            method: 'GET', 
            data: { genreId: genreId },
            success: function(response) {
            	 var $response = $(response);
                 var newBsContent = $response.find('.bs').html();
                 
                /* $('.bs').html(response);
                $('body').html(response);*/
                $('.bs').html(newBsContent);
                $('.bsSpan').html(name);
                               
            },
            
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
	$('.pageNum').click(function(event) {
		event.preventDefault(); 
    	$('.pageNum').css('font-weight', 'none');
    	$(this).css('font-weight', 'bold');
	});
    
	
	function page(element) {
		var genreId = $('.pageNum').first().data('genreId'); // 첫 번째 페이지 번호에 해당하는 장르 아이디 값 사용
	    var pageNumber = $(element).text();

	    console.log('페이지 ' + pageNumber + ' 요청 중');
	    console.log('페이지 장르 값 ' + genreId);

	    
	    
	    /* // AJAX를 통해 해당 페이지의 책 목록을 요청합니다.
	    $.ajax({
	        url: '/bc/getBooks',
	        method: 'GET',
	        data: { genreId: genreId, pageNumber: pageNumber },
	        success: function(response) {
	            console.log('페이지 ' + pageNumber + ' 요청 성공');
	            var $response = $(response);
	            var newBsContent = $response.find('.bs').html();

	            // 가져온 책 목록으로 화면을 업데이트합니다.
	            $('.bs').html(newBsContent);
	            $('.bsSpan').html($('.naviA.active').text());

	        },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    }); */
	}

 	
 
</script>


</body>
</html>