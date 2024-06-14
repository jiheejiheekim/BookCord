<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - MyBookMark</title>
<link rel="stylesheet" href="resources/css/myBookMark.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


$(document).ready(function(){
	var urlParams = new URLSearchParams(window.location.search);
    var errorMessage = urlParams.get('message');
    if (errorMessage) {
        alert(decodeURIComponent(errorMessage));
    }
    
	var member_id = "<c:out value='${sessionScope.member.username}'/>";
	
	if(member_id==null){
		alert('로그인 하세요 \nmember_id : '+member_id);
		return;
	}else{
		console.log(member_id+' 회원님의 북마크')
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
					<td class="navi2"><a class="naviA" href="memberEdit">회원정보
							수정</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="myReview">나의 리뷰</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="myBookMark">나의
							북마크</a></td>
				</tr>
			</table>
		</div>

		<div class="mybookMark">
			<span class="mybookMarkSpan">나의 북마크</span>
			<c:out value="${sessionScope.member_id}" />
			<div class="bookMark1">
				<c:forEach items="${myBookMarkList}" var="myBookMarkList">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table class="bookMarkTable">
						<tr class="bookTable1">
							<td><a href="/bc/detail/${myBookMarkList.isbn13}"><img class="bookImg" src="${myBookMarkList.cover}"></a></td>
						</tr>
						<tr class="bookTable2">
							<td>
								<script type="text/javascript">
						            var title = "${myBookMarkList.title}";
						            if (title.length > 10) {
						                title = title.substring(0, 11) + '..';
						            }
						            document.write(title);
							    </script>
							</td>
						</tr>
						<tr class="bookTable3">
							<td>
								<script type="text/javascript">
						            var author = "${myBookMarkList.author}";
						            if (author.length > 10) {
						            	author = author.substring(0, 11) + '..';
						            }
						            document.write(author);
						        </script>
							</td>
						</tr>
					</table>
				</c:forEach>

			</div>

		</div>

	</div>

	<div class="bookMarkpage">
		<table class="bookMarkpageTable">
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
	
	<form id="actionForm" action="/bc/myBookMark" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>


</body>
</html>