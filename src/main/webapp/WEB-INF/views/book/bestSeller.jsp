<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - BestSeller</title>
<link rel="stylesheet" href="resources/css/bestSeller.css">
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

	console.log("csrfToken >> "+csrfToken);
	console.log("csrfParameterName >> "+csrfParameterName);


	function bookmark(event, title, author, isbn13, cover) {
		event.preventDefault(); 
		
	    
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
	 			        }
	 			    });
	 			}
	 		},
	 		error:function(request,status,error){
	            console.log("북마크 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error); // 실패 시 처리 
	        }
	 	});
	   
	}
	
	function loginGo(){
		alert('로그인 하세요');
	}
</script>
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5">
					<a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
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
					<td class="navi1">베스트셀러</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="" data-genreId="0" onclick="genreBestSeller(0,'종합', 1)">종합</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="" data-genreId="55890" onclick="genreBestSeller(55890,'건강/취미/레저', 1)">건강/취미/레저</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="" data-genreId="170" onclick="genreBestSeller(170,'경제경영', 1)">경제경영</a></td>
				</tr>
				<tr>
					<td class="navi5"><a class="naviA" href="" data-genreId="2105" onclick="genreBestSeller(2105,'고전', 1)">고전</a></td>
				</tr>
				<tr>
					<td class="navi6"><a class="naviA" href="" data-genreId="987" onclick="genreBestSeller(987,'과학', 1)">과학</a></td>
				</tr>
				<tr>
					<td class="navi7"><a class="naviA" href="" data-genreId="8257" onclick="genreBestSeller(8257,'대학교재/전문서적', 1)">대학교재/전문서적</a></td>
				</tr>
				<tr>
					<td class="navi8"><a class="naviA" href="" data-genreId="2551" onclick="genreBestSeller(2551,'만화', 1)">만화</a></td>
				</tr>
				<tr>
					<td class="navi9"><a class="naviA" href="" data-genreId="4395" onclick="genreBestSeller(4395,'달력/기타', 1)">달력/기타</a></td>
				</tr>
				<tr>
					<td class="navi10"><a class="naviA" href="" data-genreId="798" onclick="genreBestSeller(798,'사회과학', 1)">사회과학</a></td>
				</tr>
				<tr>
					<td class="navi11"><a class="naviA" href="" data-genreId="1" onclick="genreBestSeller(1,'소설/시/희곡', 1)">소설/시/희곡</a></td>
				</tr>
				<tr>
					<td class="navi12"><a class="naviA" href="" data-genreId="1383" onclick="genreBestSeller(1383,'수험서/자격증', 1)">수험서/자격증</a></td>
				</tr>
				<tr>
					<td class="navi13"><a class="naviA" href="" data-genreId="1108" onclick="genreBestSeller(1108,'어린이', 1)">어린이</a></td>
				</tr>
				<tr>
					<td class="navi14"><a class="naviA" href="" data-genreId="55889" onclick="genreBestSeller(55889,'에세이', 1)">에세이</a></td>
				</tr>
				<tr>
					<td class="navi15"><a class="naviA" href="" data-genreId="1196" onclick="genreBestSeller(1196,'여행', 1)">여행</a></td>
				</tr>
				<tr>
					<td class="navi16"><a class="naviA" href="" data-genreId="74" onclick="genreBestSeller(74,'역사', 1)">역사</a></td>
				</tr>
				<tr>
					<td class="navi17"><a class="naviA" href="" data-genreId="517" onclick="genreBestSeller(517,'예술/대중문화', 1)">예술/대중문화</a></td>
				</tr>
				<tr>
					<td class="navi18"><a class="naviA" href="" data-genreId="1230" onclick="genreBestSeller(1230,'요리/살림', 1)">요리/살림</a></td>
				</tr>
				<tr>
					<td class="navi19"><a class="naviA" href="" data-genreId="1322" onclick="genreBestSeller(1322,'외국어', 1)">외국어</a></td>
				</tr>
				<tr>
					<td class="navi20"><a class="naviA" href="" data-genreId="13789" onclick="genreBestSeller(13789,'유아', 1)">유아</a></td>
				</tr>
				<tr>
					<td class="navi21"><a class="naviA" href="" data-genreId="656" onclick="genreBestSeller(656,'인문학', 1)">인문학</a></td>
				</tr>
				<tr>
					<td class="navi22"><a class="naviA" href="" data-genreId="336" onclick="genreBestSeller(336,'자기계발', 1)">자기계발</a></td>
				</tr>
				<tr>
					<td class="navi23"><a class="naviA" href="" data-genreId="112011" onclick="genreBestSeller(112011,'장르소설', 1)">장르소설</a></td>
				</tr>
				<tr>
					<td class="navi24"><a class="naviA" href="" data-genreId="2913" onclick="genreBestSeller(2913,'잡지', 1)">잡지</a></td>
				</tr>
				<tr>
					<td class="navi25"><a class="naviA" href="" data-genreId="17195" onclick="genreBestSeller(17195,'전집/중고전집', 1)">전집/중고전집</a></td>
				</tr>
				<tr>
					<td class="navi26"><a class="naviA" href="" data-genreId="1237" onclick="genreBestSeller(1237,'종교/역학', 1)">종교/역학</a></td>
				</tr>
				<tr>
					<td class="navi27"><a class="naviA" href="" data-genreId="2030" onclick="genreBestSeller(2030,'좋은부모', 1)">좋은부모</a></td>
				</tr>
				<tr>
					<td class="navi28"><a class="naviA" href="" data-genreId="1137" onclick="genreBestSeller(1137,'청소년', 1)">청소년</a></td>
				</tr>
				<tr>
					<td class="navi29"><a class="naviA" href="" data-genreId="351" onclick="genreBestSeller(351,'컴퓨터/모바일', 1)">컴퓨터/모바일</a></td>
				</tr>
				<tr>
					<td class="navi30"><a class="naviA" href="" data-genreId="50246" onclick="genreBestSeller(50246,'초등학교참고서', 1)">초등학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi31"><a class="naviA" href="" data-genreId="77541" onclick="genreBestSeller(77541,'중학교참고서', 1)">중학교참고서</a></td>
				</tr>
				<tr>
					<td class="navi32"><a class="naviA" href="" data-genreId="76001" onclick="genreBestSeller(76001,'고등학교참고서', 1)">고등학교참고서</a></td>
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
						<td class="bs1td3">
							<a href="javascript:void(0)" onclick="bookmark(event, '${book.title}', '${book.author}', '${book.isbn13}', '${book.cover}')">
								<img class="bookMarkImg" src="resources/images/bookmarkO.png">
							</a>
						</td>
					</tr>
					<tr class="bs2">
						<!-- <td></td> -->
						<td class="bs2td2"><a href="/bc/detail/${book.isbn13}">${book.title}</a></td>
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
			<!-- bsTableDiv -->
		</div>
		<!-- bs -->

	</div>
	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<td class="pageLogotd">
	            	<a href="" onclick="prevPage()"><img class="pageLogo1" src="resources/images/pageLeft.png"></a>
				</td>
				
				<c:forEach begin="${currentPage + 1}" end="${currentPage + 5}" var="i">
					<td><a class="pageNum" href="" onclick="page(${i})">${i}</a></td>
            	</c:forEach>
				
            
				<td class="pageLogotd">
	            	<a href="" onclick="nextPage()"><img class="pageLogo2" src="resources/images/pageRight.png"></a>
				</td>
			</tr>
		</table>
	</div>

<script>

	var selectedGenreId;
	var selectedGenreName;
	var currentPage = 1;
	var pageNumber = 1;
	
	console.log('페이지 로드! ' + currentPage + ' 요청 중');

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

    function genreBestSeller(genreId, name, pageNumber) {
    	
    	if(!genreId | !name){
    		genreId = 0;
    		name = '종합';
    	}
    	
    	console.log('1. 장르별 책 목록 요청 중');
    	console.log('2. 카테고리아이디 : '+genreId);
    	console.log('3. 카테고리명 : '+name);
    	
        $.ajax({
            url: '/bc/getBestBooks',
            method: 'GET', 
            data: { genreId: genreId, pageNumber: pageNumber },
            success: function(response) {
            	var $response = $(response);
                var newBs = $response.find('.bs').html();
                $('.bs').html(newBs);
                $('.bsSpan').html(name);
            },
            
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
	$('.pageNum').click(function(event) {
		event.preventDefault(); 
    	$('.pageNum').css('font-weight', 'normal');
    	$(this).css('font-weight', 'bold');
	});
    
	function page(pageNumber) {
	    console.log('페이지 ' + pageNumber + ' 요청 중');
	    
	    if (!selectedGenreId || !selectedGenreName) {
	        console.log('장르 정보가 없습니다 ==> 종합 '+ pageNumber +'페이지 요청 중');
	        selectedGenreId=0;
	    }
	    genreBestSeller(selectedGenreId, selectedGenreName, pageNumber);
	    currentPage = pageNumber;
	    updatePageNum();
	    bold();
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
	
	$(document).ready(function() {
	    $('.pageNum').first().css('font-weight', 'bold');
	});

	
</script>


</body>
</html>