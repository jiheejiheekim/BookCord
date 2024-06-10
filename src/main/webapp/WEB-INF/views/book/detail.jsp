<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - Detail</title>
<link rel="stylesheet" href="../resources/css/detail.css">
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
    	type: "POST",
        url: "/bc/bookmark",
        data: data,
        dataType: "JSON",
        success: function(response) {
            alert('북마크 성공');
        },
        error:function(request,status,error){
            console.log("북마크 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error); // 실패 시 처리 
        }
    });
   
}

  
var stars;

  
$(document).ready(function() {
    $('.radio').click(function(event) {
        stars = $(this).attr('data-stars');
        console.log('선택한 별점 >> ' + stars + '점');
    });
});
  
function reviewRegister(event, title, author, isbn13, cover) {
	event.preventDefault();
	var content = $(".rTextarea").val();
	console.log('리뷰 등록 요청 >>\n title : '+title+'\n author : '+author+'\n isbn13 : '+isbn13+'\n cover : '+cover);
	
	if(!stars){
		alert('별점을 선택하세요');
		return;
	}else{
		console.log(stars+'점 선택');
	}
	if(!content){
		alert('리뷰 내용을 입력하세요');
		$(".rTextarea").focus();
		return;
	}else{
		confirm('리뷰를 등록하시겠습니까?');
	}
	
	var data = {
			member_id : member_id,
			title : title,
			author : author,
			isbn13 : isbn13,
			cover : cover,
			stars : stars,
			content : content,
		};

 	// CSRF 토큰을 데이터에 추가
    data[csrfParameterName] = csrfToken;
 	
 	$.ajax({
 		type : 'POST',
 		url : '/bc/reviewRegister',
 		data : data,
 		dataType : 'JSON',
 		success : function(response){
 			alert('리뷰를 등록했습니다');
 		},
 		error : function(request, status, error){
 			alert('리뷰 등록 실패 >> '+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
 		}
 	});
	
}  
</script>
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="/bc/main"><img
						class="logo" src="../resources/images/logo.png"></a></td>
				<td class="top2"><a href="/bc/notice">공지사항</a></td>
				<td class="top3">
					<sec:authorize access="isAnonymous()">
						<a onclick="loginGo()" href="/bc/loginP">마이페이지</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="/bc/memberEdit">마이페이지</a>
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
	</div>
	
	<div class="content">
	
		<div class="detail">
		<c:if test="${not empty items}">
	    	<c:forEach var="book" items="${items}">
				<table class="dTable1">
					<tr>
						<td class="d1td1" rowspan="11"><img class="cover" src="${book.cover}"></td>
						<td class="d1td2">${book.title}</td>
						<td class="d1td3">
							<a href="" onclick="bookmark(event, '${book.title}', '${book.author}', '${book.isbn13}', '${book.cover}')">
								<img class="bookMarkImg" src="../resources/images/bookmarkO.png">
							</a>
						</td>
					</tr>
					<tr>
						<td class="d1td4" colspan="2">${book.author}</td>
					</tr>
					<tr>
						<fmt:formatDate value="${book.pubDate}" pattern="yyyy년 MM월 dd일" var="formattedDate" />
						<td class="d1td5">${book.publisher} | ${formattedDate}</td>
					</tr>
					<tr>
						<fmt:parseNumber value="${book.priceStandard}" pattern="#,##0" var="formattedPriceStandard" />
						<fmt:parseNumber value="${book.priceSales}" pattern="#,##0" var="formattedPriceSales" />
						<td class="d1td6">정가 <fmt:formatNumber value="${formattedPriceStandard}" />원 → 판매가 <span class="priceSales"><fmt:formatNumber value="${formattedPriceSales}" /></span>원</td>
					</tr>
					<tr>
						<td class="d1td7" colspan="2"><hr color="#2D9462"></td>
					</tr>
					<tr class="d1td8">
						<td class="d1td8">${book.subInfo.itemPage}쪽 | ${book.subInfo.packing.weight}g</td>
					</tr>
					<tr>
						<td class="d1td9">ISBN13 : ${book.isbn13}</td>
					</tr>
					<tr>
						<td class="d1td10">${book.categoryName}</td>
					</tr>
					
					<tr>
						<td class="d1td12" colspan="2"><hr color="#2D9462"></td>
					</tr>
					<tr>
						<td class="d1td13">
							<c:if test="${book.customerReviewRank == 10}">	<!-- customerReviewRank:알라딘평점 -->
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 10 and book.customerReviewRank >= 9.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="starh" src="../resources/images/halfStar.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 9.0 and book.customerReviewRank >= 8.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 8.0 and book.customerReviewRank >= 7.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="starh" src="../resources/images/halfStar.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 7.0 and book.customerReviewRank >= 6.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 6.0 and book.customerReviewRank >= 5.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="starh" src="../resources/images/halfStar.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 5.0 and book.customerReviewRank >= 4.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 4.0 and book.customerReviewRank >= 3.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/halfStar.png">
					        </c:if>
					        <c:if test="${book.customerReviewRank < 3.0 and book.customerReviewRank >= 2.0}">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
							<span class="black">${book.subInfo.ratingInfo.ratingScore}</span>
						</td>
					</tr>
					<tr>
						<td class="d1td14" colspan="3"><hr color="#2D9462"></td>
					</tr>
				</table><!-- dTable1 -->

				<table class="dTable2">
					<tr>
						<td class="d2td1">책 소개</td>
						<td class="d2td2">${book.description}
						</td>
					</tr>
					<tr>
						<td class="d1td14" colspan="3"><hr color="#2D9462"></td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
			<%-- </c:forEach> --%>
			
			<table class="dTable4">
				<tr class="dTabletr">
					<td class="d4td1" rowspan="13">리 뷰</td>
					<td class="d4td2" colspan="4">
						<input type="radio" name="radio" data-stars="1">
							<c:forEach var="starIndex" begin="1" end="1">
								<img class="star" src="../resources/images/star.png">
							</c:forEach>
					　　　
						<input type="radio" class="radio" name="radio" data-stars="2">
							<c:forEach var="starIndex" begin="1" end="2">
								<img class="star" src="../resources/images/star.png">
							</c:forEach>　
						　
						<input type="radio" class="radio" name="radio" data-stars="3">
							<c:forEach var="starIndex" begin="1" end="3">
								<img class="star" src="../resources/images/star.png">
							</c:forEach>
						　　
						<input type="radio" class="radio" name="radio" data-stars="4">
							<c:forEach var="starIndex" begin="1" end="4">
								<img class="star" src="../resources/images/star.png">
							</c:forEach>
						　　
						<input type="radio" class="radio" name="radio" data-stars="5">
							<c:forEach var="starIndex" begin="1" end="5">
								<img class="star" src="../resources/images/star.png">
							</c:forEach>　
								
							
							<!-- radioTable -->
					</td>
				</tr>
				<c:forEach var="book" items="${items}">
				<tr>
					<td class="rTextareatd" colspan="3"><textarea class="rTextarea" name="content" rows="5" cols="30"></textarea></td>
					<td class="rSubmittd" colspan="2"><a href="" class="link" onclick="reviewRegister(event, '${book.title}', '${book.author}', '${book.isbn13}', '${book.cover}')">등 록</a></td>
<!-- 					<td class="rSubmittd" colspan="2"><button class="rSubmitbt"><a href="" class="link" onclick="">등 록</a></button></td> -->
				</tr>
				</c:forEach>
				<tr>
					<td class="d1td14" colspan="10"><hr color="#2D9462"></td>
				</tr>
				
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">푸바오가 너무 귀여워요 사육사님들도 고생하셨습니다</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">푸바오가 너무 귀여워요 사육사님들도 고생하셨습니다. 후이바오와 루이바오 둘 다 건강하게 자라렴!</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">가지마 푸공주야ㅠㅠㅠ</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
		</table>
			
		</div>	<!-- detail -->
		
	</div>	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="../resources/images/pageLeft.png"></a></td>
				<td><a class="bold">1</a></td>
				<td><a href="">2</a></td>
				<td><a href="">3</a></td>
				<td><a href="">4</a></td>
				<td><a href="">5</a></td>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="../resources/images/pageRight.png"></a></td>
			</tr>
		</table>
	</div>
	
<%-- 	<!-- 세션에 저장된 멤버 정보 확인 -->
	<c:if test="${not empty sessionScope.member}">
	    <p>Member ID: ${sessionScope.member.username}</p> <!-- 변경된 부분 -->
	</c:if>
	
	<c:if test="${empty sessionScope.member}">
	    <p>No member object found in session.</p>
	</c:if> --%>

</body>
</html>