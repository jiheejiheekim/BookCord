<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - MyReview</title>
<link rel="stylesheet" href="resources/css/myReview.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		var member_id = "<c:out value='${sessionScope.member.username}'/>";
		
		if(member_id==null){
			alert('로그인 하세요 \nmember_id : '+member_id);
		}else{
			console.log(member_id+' 회원님의 리뷰')
		}
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
	    	e.preventDefault();
	        
	        console.log('click');
	        
	        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	        actionForm.submit();
		});
	});

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
				<td class="top1" colspan="5"><a href="main"><img
						class="logo" src="resources/images/logo.png"></a></td>
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
					<td class="navi1">마이페이지</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="memberEdit">회원정보수정</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="myReview">나의 리뷰</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="myBookMark">나의 북마크</a></td>
				</tr>
			</table>
		</div>
		<!-- navi -->

		<div class="myReview">
			<span class="myReviewSpan">나의 리뷰</span>
			<c:out value="${sessionScope.member_id}" />
			<div class="reviewTableDiv">
			<c:forEach items="${myReviewList}" var="myReviewList">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table class="reviewTable">
					<tr class="myReview1">
						<td class="myReviewtd1" rowspan="6">
							<a href="/bc/detail/${myReviewList.isbn13}"><img class="bookImg" src="${myReviewList.cover}"></a>
						</td>
						<td class="myReview1td2"><a href="/bc/detail/${myReviewList.isbn13}">${myReviewList.title}</a></td>
					</tr>
					<tr class="myReview2">
						<!-- <td></td> -->
						<td class="myReview2td2"><a href="/bc/detail/${myReviewList.isbn13}">${myReviewList.author}</a></td>
					</tr>
					<tr class="myReview3">
						<!-- <td></td> -->
						<td class="myReview3td2">　</td>
					</tr>
					<tr class="myReview4">
						<!-- <td></td> -->
						<fmt:formatDate value="${myReviewList.reg_date}" pattern="yyyy-MM-dd" var="formattedDate" />
						<td class="myReview4td2">${formattedDate}</td>
					</tr>
					<tr class="myReview5">
						<!-- <td></td> -->
						<td class="myReview5td2">
							<c:forEach var="starIndex" begin="1" end="${myReviewList.stars}">
								<a href="/bc/detail/${myReviewList.isbn13}"><img class="star" src="resources/images/star.png"></a>
							</c:forEach>
						</td>
					</tr>
					<tr class="myReview6">
						<!-- <td></td> -->
						<td class="myReview6td2"><a href="/bc/detail/${myReviewList.isbn13}">${myReviewList.content}</a></td>
					</tr>
				</table>
			</c:forEach>

			</div>
			<!-- reviewTableDiv -->

		</div>
		<!-- myReview -->

	</div>
	<!-- content -->

	
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
	
	<form id="actionForm" action="/bc/myReview" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>

</body>
</html>