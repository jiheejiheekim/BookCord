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

	
	
</script>	
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
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
					<tr>
						<td>MEMBER_NUM</td>
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
						<tr>
							<td>${memberInfo.member_num}</td>
							<td>${memberInfo.id}</td>
							<td>${memberInfo.name}</td>
							<td>${memberInfo.provider}</td>
							<td>${memberInfo.reg_date}</td>
							<td>${memberInfo.update_date}</td>
							<td>${memberInfo.enabled}</td>
							<td>ENABLED EDIT</td>
							<td><%-- ${memberInfo.role} --%>role</td>
							<td>ROLE EDIT</td>
							<td>DELETE</td>
						</tr>
					</c:forEach>
				</table>
					
			<br>
			
		</div>
		

	</div>	<!-- content -->
</body>
</html>