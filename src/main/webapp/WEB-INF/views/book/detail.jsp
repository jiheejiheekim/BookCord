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
<title>BookCord - Detail</title>
<link rel="stylesheet" href="../resources/css/detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
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

  
var stars;


function saveScrollPosition() {
  localStorage.setItem('scrollPosition', window.scrollY);
}

function loadScrollPosition() {
  const scrollPosition = localStorage.getItem('scrollPosition');
  if (scrollPosition) {
    window.scrollTo(0, scrollPosition);
    localStorage.removeItem('scrollPosition'); 
  }
}

$(document).ready(function() {
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
    	e.preventDefault();
        
        console.log('click');
        
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.submit();
	});
	
    $('.radio').click(function(event) {
        stars = $(this).attr('data-stars');
        console.log('선택한 별점 >> ' + stars + '점');
    });
    
    loadScrollPosition();
    $(".paginate_button a").on("click", function(e) {
      e.preventDefault();
      saveScrollPosition(); // 페이지 이동 전 스크롤 위치 저장
      $("#actionForm").find("input[name='pageNum']").val($(this).attr("href"));
      $("#actionForm").submit();
    });

});
  
var scrollTopPosition; 

function reviewRegister(event, title, author, isbn13, cover) {
	event.preventDefault();
	var content = $(".rTextarea").val();
	console.log('리뷰 등록 요청 >>\n title : '+title+'\n author : '+author+'\n isbn13 : '+isbn13+'\n cover : '+cover);
	
	// 스크롤 위치 저장
    scrollTopPosition = $(window).scrollTop();
	
	var data = {
			member_id : member_id,
			title : title,
			author : author,
			isbn13 : isbn13,
			cover : cover,
			stars : stars,
			content : content
		};

 	// CSRF 토큰을 데이터에 추가
    data[csrfParameterName] = csrfToken;
 	
 	console.log('member_id : '+member_id)
 	if(!member_id){
 		alert('로그인 하세요');
 		return;
 	}
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
		if(confirm('리뷰를 등록 하시겠습니까?')) {
		
			$.ajax({
		 		type : 'POST',
		 		url : '/bc/reviewRegister',
		 		data : data,
		 		dataType : 'JSON',
		 		success : function(response){
		 			alert('리뷰를 등록했습니다');
		 			
		 			refreshReviewList(isbn13);
	                $('.rTextarea').val('');
                    $('input[type="radio"]').prop('checked', false);
                    stars = undefined;
		 		},
		 		error : function(request, status, error){
		 			alert('리뷰 등록 실패 >> '+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
		 		}
		 	});
		}
	}
}

function refreshReviewList(isbn13) {
    $.ajax({
        type: 'GET',
        url: '/bc/getReviewList/' + isbn13,
        dataType: 'html',
        success: function(response) {
            console.log('리뷰 등록 성공');
            
            var $response = $(response);
            var $dTable5 = $response.find('.dTable5');
            
            $('.dTable5').html($dTable5.html());
        },
        error: function(request, status, error) {
            console.error('AJAX Error:', error);
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
			</c:forEach>	<!-- c:forEach : book -->
		</c:if>
			
			
			<table class="dTable4">
				<tr class="dTabletr">
					<td class="d4td1" rowspan="13">리 뷰</td>
					<td class="d4td2" colspan="4">
						<input type="radio" class="radio" name="radio" data-stars="1">
							<c:forEach var="starIndex" begin="1" end="1">
								<img class="star" src="../resources/images/star.png">
							</c:forEach>	<!-- c:forEach : starIndex -->
					　　　
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
				</c:forEach>	<!-- c:forEach : book -->
				<tr>
					<td class="d1td14" colspan="10"><hr color="#2D9462"></td>
				</tr>
				
			</table>
				
			<table class="dTable5">
				<tr class="dTabletr">
					<td class="d4td1" rowspan="13"></td>
				<c:forEach items="${myReviewList}" var="myReviewList">
				 	
						<tr>
							<td class="reviewTabletd">
								<c:forEach var="starIndex" begin="1" end="${myReviewList.stars}">
									<a href="/bc/detail/${myReviewList.isbn13}"><img class="star" src="../resources/images/star.png"></a>
								</c:forEach>
							</td>
							<td colspan="3">${myReviewList.content}</td>
						</tr>
						<tr>
							<td class="reviewTabletd0"></td>
							<td class="reviewTabletd1">
								<c:set var="memberId" value="${myReviewList.member_id}" />
									<c:choose>
									    <c:when test="${fn:length(memberId) < 3}">
									        ${memberId}___님
									    </c:when>
									    <c:otherwise>
									        ${fn:substring(memberId, 0, 2)}___님
									    </c:otherwise>
									</c:choose>
							<%-- ${myReviewList.member_id} --%></td>
							<fmt:formatDate value="${myReviewList.reg_date}" pattern="yyyy-MM-dd" var="formattedDate" />
							<td class="reviewTabletd2" colspan="2">${formattedDate}</td>
						</tr>
					
				</c:forEach>	<!-- c:forEach : myReviewList -->
		</table><!-- dTable5 -->
			
		</div>	<!-- detail -->
		
	</div>	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<c:if test="${pageMaker.prev}">
					<td class="pageLogotd, paginate_button previous">
						<a href="${pageMaker.startPage-1}"><img class="pageLogo1" src="../resources/images/pageLeft.png"></a>
					</td>
				</c:if>
	
				 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				 	<td class="paginate_button ${pageMaker.cri.pageNum == num ? 'bold' : ''}">
				 		<a href="${num}">${num}</a>
				 	</td>
				 </c:forEach>
				 
				<c:if test="${pageMaker.next}">
					<td class="pageLogotd, paginate_button next">
						<a href="${pageMaker.endPage+1}"><img class="pageLogo2" src="../resources/images/pageRight.png"></a>
					</td>
				</c:if>
			</tr>
		</table>
	</div>

	<c:forEach items="${myReviewList}" var="myReviewList">
		<form id="actionForm" action="/bc/detail/${myReviewList.isbn13}" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</c:forEach>	

</body>
</html>