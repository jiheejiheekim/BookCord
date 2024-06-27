<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - Admin</title>
<link rel="stylesheet" href="resources/css/admin.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	var csrfToken = "${_csrf.token}";
	var csrfParameterName = "${_csrf.parameterName}";
	console.log("csrfToken >> "+csrfToken);
	console.log("csrfParameterName >> "+csrfParameterName);
	
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
	
	
	var member_id = "<c:out value='${sessionScope.member.username}'/>";
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
			console.log(member_id+' >> 관리자님의 회원 관리 페이지')
		}
		
	});

	function enabledEdit(id, enabled){
		console.log('id :'+id+'\nenabled : '+enabled);
		
		// 스크롤 위치 저장
	    scrollTopPosition = $(window).scrollTop();
		
		var data = {id:id, enabled:enabled};

	 	// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
			
		$.ajax({
			type : 'post',
			url : '/bc/enabledEdit',
			data : data,
			dataType : 'JSON',
			success:function(response){
				alert('\''+id+'\'의 계정 활성화 변경 성공 : '+response);
				//response = response.trim();
				if(response){
					$('.enabled_'+id).text('true');
				}else{
					$('.enabled_'+id).text('false');
				} 
			},
			error:function(err){
				alert('계정 비활성화 실패 : '+err);
			}
		});
		location.reload();
	}
	
	function roleEdit(id){
		
		var data = {id:id};
		// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
		
		console.log('권한 변경 할 아이디 :'+id);
		if($('.role_'+id).text().includes('ADMIN')){
			if(confirm('\''+id+'\'의 ADMIN 권한을 회수하시겠습니까?')){
				$.ajax({
					type : 'post',
					url : '/bc/roleDelAdmin',
					data : data,
					success:function(response){
						alert('\''+id+'\'회원 ADMIN 권한 회수 완료');
						$('.role_'+id).text(response==='revoke'? 'ROLE_USER' : 'ROLE_ADMIN');
					},
					error:function(request,status,error){
						alert("권한 회수 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
					}
				});
			}
		}else{
			if(confirm('\''+id+'\'에게 ADMIN 권한을 부여하시겠습니까?')){
				$.ajax({
					type : 'post',
					url : '/bc/roleAddAdmin',
					data : data,
					success:function(response){
						alert('\''+id+'\'회원 ADMIN 권한 부여 완료');
						$('.role_'+id).text(response==='grant'? 'ROLE_ADMIN ROLE_USER' : 'ROLE_USER');
					},
					error:function(request,status,error){
						alert("권한 부여 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
					}
				});
			}
		}
	}
	
	function memberDelete(id){
		var data = {id:id};
		// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
		
		console.log('삭제 할 id :'+id);
		if(confirm('\''+id+'\'회원을 삭제하시겠습니까?')){
			$.ajax({
				type : 'post',
				url : '/bc/memberDelete',
				data : data,
				success:function(response){
					alert('\''+id+'\'회원 삭제 완료');
					$('.tr_'+id).remove();
				},
				error:function(request,status,error){
					alert("회원 삭제 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
				}
			});
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
					<td class="navi2"><a class="naviA" href="/bc/memberEdit">회원정보 수정</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="/bc/myReview">나의 리뷰</a></td>
				</tr>
				<tr>
					<td class="navi4"><a class="naviA" href="/bc/myBookMark">나의 북마크</a></td>
				</tr>
				<tr>
					<td class="navi5"><a class="naviA" href="/bc/admin">관리자 페이지</a></td>
				</tr>
			</table>
		</div>
		
		
		<div class="admin">
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<span class="adminSpan">관리자 - 회원 관리</span>
				
				<table class="editTable">
					<tr class="editTtr1">
						<td>NUM</td>
						<td>ID</td>
						<td>NAME</td>
						<td>PROVIDER</td>
						<td>REG_DATE</td>
						<td>UPDATE_DATE</td>
						<td>ENABLED</td>
						<td>ENABLED EDIT</td>
						<td>ROLE</td>
						<td>ROLE EDIT</td>
						<td>DELETE</td>
					</tr>
					
					<c:forEach items="${memberInfo}" var="memberInfo">
						<tr class="tr_${memberInfo.id}">
							<td>${memberInfo.member_num}</td>
							<td>${memberInfo.id}</td>
							<td>${memberInfo.name}</td>
							<td>${memberInfo.provider}</td>
							<td class="date">
								<fmt:formatDate value="${memberInfo.reg_date}" pattern="yy-MM-dd E HH:mm:ss" />
							</td>
							<td class="date">
							    <fmt:formatDate value="${memberInfo.update_date}" pattern="yy-MM-dd E HH:mm:ss" />
							</td>
							<td class="enabled_${memberInfo.id}">${memberInfo.enabled}</td>
							<td><button class="editButton" onclick="enabledEdit('${memberInfo.id}', '${memberInfo.enabled}')">ENABLED EDIT</button></td>
							<td class="role_${memberInfo.id}">
								<c:forEach items="${memberInfo.roleList}" var="role">
									${role.auth}
								</c:forEach>
							</td>
							<td><button class="editButton" onclick="roleEdit('${memberInfo.id}')">ROLE EDIT</button></td>
							<td><button class="editButton" onclick="memberDelete('${memberInfo.id}')">DELETE</button></td>
							
						</tr>
					</c:forEach>
					
				</table>
				
					
			<br>
			
		</div>
		

	</div>	<!-- content -->
</body>
</html>