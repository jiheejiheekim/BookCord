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
			console.log(member_id+' 회원님의 리뷰')
		}
		
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
	
	function menu(review_num) {
		event.preventDefault();
		var menuDiv = document.getElementById('menuDiv_'+review_num);
		
		// 모든 menuDiv 숨기기
        $(".menuDiv").hide();
		
        if (menuDiv.style.display === 'none' || menuDiv.style.display === '') {
            menuDiv.style.display = 'block';
        } else {
            menuDiv.style.display = 'none';
        }
	}
	
	function reviewUpdateForm(event, review_num) {
		event.preventDefault();
		
		var menuDiv = document.getElementById('menuDiv_'+review_num);
		// 모든 menuDiv 숨기기
        $(".menuDiv").hide();
		
		var updateForm = document.getElementById('updateForm_'+review_num);
		
		// 모든 updateForm 숨기기
        $(".updateForm").hide();
		
        if (updateForm.style.display === 'none' || updateForm.style.display === '') {
        	updateForm.style.display = 'block';
        } else {
        	updateForm.style.display = 'none';
        }
	}
	
	var stars;
	var csrfToken = "${_csrf.token}";
	var csrfParameterName = "${_csrf.parameterName}";
	var member_id = "<c:out value='${sessionScope.member.username}'/>";
	
	function reviewUpdate(event, review_num) {
		event.preventDefault();
		
		var content = $(".updateReviewArea").val();
		console.log('리뷰 수정 요청 >>\n review_num : '+review_num+' 번 리뷰\n stars : '+stars+'\n content : '+content);
		
		if(!stars){
			alert('별점을 선택하세요');
			return;
		}
		if(!content){
			alert('리뷰 내용을 입력하세요');
			$(".rTextarea").focus();
			return;
		}else{
			confirm('리뷰를 수정 하시겠습니까?');
		}
		
		var data = {
			review_num : review_num,
			stars : stars,
			content : content
		};
		// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
		
		 $.ajax({
			type : 'POST',
			url : '/bc/reviewUpdate',
			data : data,
			success:function(response){
				alert('리뷰가 수정되었습니다');
				window.location.href = "/bc/myReview";
			},
			error:function(request, status, error){
				alert('리뷰 수정 실패 >> '+request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
				console.log('리뷰 수정 실패 >> '+request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
			}
		}) 
	}
	function reviewDelete(event, review_num) {
		event.preventDefault();
		console.log(review_num+'번 리뷰 삭제 요청');
		
		var menuDiv = document.getElementById('menuDiv_'+review_num);
		// 모든 menuDiv 숨기기
        $(".menuDiv").hide();
		
		var data = {
				review_num : review_num,
			};
		
		// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
		
		if(confirm(review_num+'번 리뷰 삭제하시겠습니까?')){
			$.ajax({
				type : 'POST',
				url : '/bc/reviewDelete',
				data : data,
				success:function(response){
					alert('삭제가 완료되었습니다');
					window.location.href = "/bc/myReview";
				},
				error:function(request, status, error){
					alert('리뷰 삭제 실패 >> '+request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
					console.log('리뷰 삭제 실패 >> '+request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
				}
			})
		}
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
				<tr>
					<td class="navi5"><a class="naviA" href="/bc/admin">관리자 페이지</a></td>
				</tr>
			</table>
		</div>
		<!-- navi -->

		<div class="myReview">
			<span class="myReviewSpan">나의 리뷰</span>
			<c:out value="${sessionScope.member_id}" />
			<div class="totalBooks">
		        <span class="bookmarkTotal">총 ${totalCount}개의 도서 리뷰</span>
		    </div>
			<div class="reviewTableDiv">
			<c:forEach items="${myReviewList}" var="myReviewList">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
				<div class="updateForm" id="updateForm_${myReviewList.review_num}">
					<table class="updateFormTable">
						<tr>
							<td class="radioTd" colspan="4">
								<input type="radio" name="radio" data-stars="1">
									<c:forEach var="starIndex" begin="1" end="1">
										<img class="star" src="resources/images/star.png">
									</c:forEach>
							　　　
								<input type="radio" class="radio" name="radio" data-stars="2">
									<c:forEach var="starIndex" begin="1" end="2">
										<img class="star" src="resources/images/star.png">
									</c:forEach>　
								　
								<input type="radio" class="radio" name="radio" data-stars="3">
									<c:forEach var="starIndex" begin="1" end="3">
										<img class="star" src="resources/images/star.png">
									</c:forEach>
								　　
								<input type="radio" class="radio" name="radio" data-stars="4">
									<c:forEach var="starIndex" begin="1" end="4">
										<img class="star" src="resources/images/star.png">
									</c:forEach>
								　　
								<input type="radio" class="radio" name="radio" data-stars="5">
									<c:forEach var="starIndex" begin="1" end="5">
										<img class="star" src="resources/images/star.png">
									</c:forEach>　
							</td>
						</tr>
						<tr>
							<td> <!-- rows="5" cols="10" -->
								<textarea class="updateReviewArea" name="content" rows="10" cols="55">${myReviewList.content}</textarea>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#" class="updateBt"  onclick="reviewUpdate(event, '${myReviewList.review_num}')">확인</a>
							</td>
						</tr>
					</table>
				</div>
			
				<table class="reviewTable">
				
					<tr>
			            <td colspan="3">
			                <div id="menuDiv_${myReviewList.review_num}" class="menuDiv">
			                    <table class="menuTable">
			                        <tr>
			                            <td class="reviewUpdate"><a href="" onclick="reviewUpdateForm(event, '${myReviewList.review_num}')">수정</a></td>
			                        </tr>
			                        <tr>
			                            <td class="reviewDelete"><a href="" onclick="reviewDelete(event, '${myReviewList.review_num}')">삭제</a></td>
			                        </tr>
			                    </table>
			                </div>
			            </td>
			        </tr>
			        
					<tr class="myReview1">
						<td class="myReviewtd1" rowspan="6">
							<a href="/bc/detail/${myReviewList.isbn13}"><img class="bookImg" src="${myReviewList.cover}"></a>
						</td>
						<td class="myReview1td2"><a href="/bc/detail/${myReviewList.isbn13}">${myReviewList.title}</a></td>
						<td class="myReview1td3"><a href="#" onclick="menu('${myReviewList.review_num}')"><img src="resources/images/menu.png" class="menu"></a></td>
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