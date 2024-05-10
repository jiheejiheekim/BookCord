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
					<td class="navi2"><a class="naviA" onclick="getBooksByGenre()">종합</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(55890)">건강/취미</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(170)">경제경영</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(2105)">고전</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(987)">과학</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(8257)">대학교재/전문서적</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(2551)">만화</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(4395)">달력/기타</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(798)">사회과학</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1)">소설/시/희곡</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1383)">수험서/자격증</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1108)">어린이</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(55889)">에세이</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1196)">여행</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(74)">역사</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(517)">예술/대중문화</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1230)">요리/살림</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1322)">외국어</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(13789)">유아</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(656)">인문학</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(336)">자기계발</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(112011)">장르소설</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(2913)">잡지</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(17195)">전집/중고전집</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1237)">종교/역학</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(2030)">좋은부모</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(1137)">청소년</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(351)">컴퓨터/모바일</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(50246)">초등학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(77541)">중학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" onclick="getBooksByGenre(76001)">고등학교참고서</a></td>
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
				
				
				<!-- <table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">2.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">3.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">4.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">5.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">6.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">7.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">8.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">9.</td>
						<td class="bs1td3"><a class="bookMarkImg" href=""><img src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table>
				<table class="bsTable">
					
					<tr class="bs1">
						<td class="bstd1" rowspan="6"><div class="bookImg"></div></td>
						<td class="bs1td2">10.</td>
						<td class="bs1td3"><a href=""><img class="bookMarkImg" src="resources/images/bookmarkX.png"></a></td>
					</tr>
					<tr class="bs2">
						<td></td>
						<td class="bs2td2">푸바오, 언제나 사랑해</td>
					</tr>
					<tr class="bs3">
						<td></td>
						<td class="bs3td2">강철원(에버랜드 동물원)(지은이), 류정훈(에버랜드 커뮤니케이션 그룹)(사진)</td>
					</tr>
					<tr class="bs4">
						<td></td>
						<td class="bs4td2">시공주니어 | 2024년 1월</td>
					</tr>
					<tr class="bs5">
						<td></td>
						<td class="bs5td2">　</td>
					</tr>
					<tr class="bs6">
						<td></td>
						<td class="bs6td2">★★★★★　<span class="black">(9)</span></td>
					</tr>
				</table> -->
				
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


<script>
console.log("장르별 책 목록 요청 중...");

    function getBooksByGenre(genreId) {
    	console.log("장르별 책 목록 요청 중..."+genreId);
    	
        $.ajax({
            url: '/getBooks', // 서버의 API 엔드포인트 주소
            method: 'GET', // 또는 'POST'
            data: { genreId: genreId }, // 전송할 데이터
            success: function(response) {
            	alert('장르가 호출되었습니다');
                // 서버로부터 받은 응답을 이용하여 페이지 일부분을 업데이트
                $('.bsTableDiv').html(response);
                
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
</script>


</body>
</html>