<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - MemberEdit</title>
<link rel="stylesheet" href="resources/css/memberEdit.css">
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
			console.log(member_id+' 회원님의 정보 수정')
		}
		
	});
	
		
	var originalName;
	function nameCheck(originalName) {
		return new Promise((resolve, reject) => {
		event.preventDefault();
		originalName = originalName;
		var changeName = $('.name').val();
		
		if(changeName == ""){
			alert("닉네임을 입력하세요");
			$(".name").focus();
			return resolve(false);
		}
		console.log('기존 닉네임 : '+originalName+'\n바꾼 닉네임 : '+changeName);
		
		
		$.ajax({
			type:"get",
			url:"/bc/nameCheck_edit",
			data:{"name":changeName},
			dataType:"json",
			success:function(result){
				if(result >= 1){
					if(originalName == changeName){
						$("#checkText3").html("기존 닉네임 입니다");
						$("#checkText3").addClass("text1");
						$("#checkText3").removeClass("text2");
						$("#checkText3").removeClass("p");
						return resolve(true);
					}else{
						$("#checkText3").html("이미 사용중인 닉네임입니다");
						$("#checkText3").addClass("text2");
						$("#checkText3").removeClass("text1");
						$("#checkText3").removeClass("p");
						$(".name").focus();
						return resolve(false);
					}
					
				}else{
					$("#checkText3").html("사용할 수 있는 닉네임입니다");
					$("#checkText3").addClass("text1");
					$("#checkText3").removeClass("text2");
					$("#checkText3").removeClass("p");
					return resolve(true); 
				}
			},
			error:function(err){
				alert('요청 실패 : '+err);
				console.log(err);
				reject(err);
            }
        });
    });
}
	
	
	function pwdCharCheck() {
		var pwd1 = $(".pwd1").val();
		var pwdCharCheck = $("#pwdCharCheck");
		
		pwdCharCheck.empty();
		if(pwd1.length >= 6 && pwd1.length <= 15){
			var img = $("<img>").attr("src", "resources/images/pwCheckO.png").addClass("pwImg")
			pwdCharCheck.append(img);
		}else{
			var img = $("<img>").attr("src", "resources/images/pwCheckX.png").addClass("pwImg2")
			pwdCharCheck.append(img);
		}
		
	}
	
	function pwdCheck() {
		var pwd1 = $(".pwd1").val();
		var pwd2 = $(".pwd2").val();
		
		if(pwd1 == "" && pwd2 ==""){
			$("#checkText2").html(" ");
			$("#checkText2").removeClass("text1");
			$("#checkText2").removeClass("text2");
		}else if(pwd1 != null && pwd2 !=null && pwd1 == pwd2){
			$("#checkText2").html("비밀번호가 일치합니다");
			$("#checkText2").addClass("text1");
			$("#checkText2").removeClass("text2");
			$("#checkText2").removeClass("p");
		}else if(pwd1 != null && pwd2 !=null && pwd1 != pwd2){
			$("#checkText2").html("비밀번호가 일치하지 않습니다");
			$("#checkText2").addClass("text2");
			$("#checkText2").removeClass("text1");
			$("#checkText2").removeClass("p");
		}else if(pwd1 != null && pwd2 == "" && pwd1 != pwd2){
			$("#checkText2").html("비밀번호가 일치하지 않습니다");
			$("#checkText2").addClass("text2");
			$("#checkText2").removeClass("text1");
			$("#checkText2").removeClass("p");
		}else{
			alert('다시 시도하세요');
			return;
		}
		
	}
	
	
	async function memberEdit(originalName) {
		event.preventDefault();
		
		var id = member_id;
		var name = $('.name').val();
		var pwd1 = $(".pwd1").val();
		var pwd2 = $(".pwd2").val();
		var check = $("#checkText").text();
		var check2 = $("#checkText2").text();
		var check3 = $("#checkText3").text();
		
		console.log(id+'님의 정보 수정-------------\nname : '+name);
		
		if(!pwd1) {
			alert('비밀번호를 입력해주세요');
			edit.pwd.focus();
			return;
		}
		if(!pwd2) {
			alert('비밀번호를 입력해주세요');
			edit.pwd2.focus();
			return;
		}
		if(!name) {
			alert('닉네임을 입력해주세요');
			member.name.focus();
			return;
		}
		
		if(pwd1 != pwd2) {
			alert('비밀번호가 일치하지 않습니다');
			edit.pwd2.focus();
			return;
		}
		
		if(pwd1.length < 6 || pwd1.length > 15){
			alert('비밀번호 형식이 일치하지 않습니다');
			edit.pwd.focus();
			return;
		}
		if(pwd2.length < 6 || pwd2.length > 15){
			alert('비밀번호 형식이 일치하지 않습니다');
			edit.pwd.focus();
			return;
		}
		
		if(check2 != '비밀번호가 일치합니다'){
			alert('비밀번호를 확인하세요');
			edit.pwd2.focus();
			return;
		}
		
		if(check3 == '이미 사용중인 닉네임입니다'){
			alert('닉네임을 확인하세요');
			edit.name.focus();
			return;
		}
		
		pwdCharCheck();
		const isNameValid = await nameCheck(originalName);
	    if (!isNameValid) {
	        alert('닉네임을 확인하세요');
	        return;
	    }
		
		edit.submit();
		alert('회원정보 수정 완료');
	}
	
	var csrfToken = "${_csrf.token}";
	var csrfParameterName = "${_csrf.parameterName}";
	console.log("csrfToken >> "+csrfToken);
	console.log("csrfParameterName >> "+csrfParameterName);
	
	function deleteAccount(id){
		event.preventDefault();
		var data = {id:id};
		// CSRF 토큰을 데이터에 추가
	    data[csrfParameterName] = csrfToken;
	    console.log(id+'\ndata : '+data);
		console.log('삭제 요청 id :'+id);
		if(confirm('\''+id+'\'회원님 탈퇴하시겠습니까?')){
			$.ajax({
				type : 'post',
				url : '/bc/deleteAccount',
				data : data,
				success:function(response){
					alert('\''+id+'\'회원 탈퇴 완료');
					logout();
				},
				error:function(request,status,error){
					console.log("회원 삭제 실패 >>>> "+ request.status + "\n message >>>> " + request.responseText + "\n error >>>> " + error);
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
		
		<div class="memberEdit">
			<form name="edit" action="/bc/memberUpdate" method="post">
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<span class="memberEditSpan">회원정보 수정</span>
				
				
					<div class="Edit">
						<table class="EditTable">
							<tr>
								<td>아이디</td>
								<td><input type="text" class="id" name="id" value="${member.id}" readonly></td>
								<td></td>
							</tr>
							<tr>
								<td>새 비밀번호</td>
								<td><input name="pwd" class="pwd1" type="password" placeholder="영문/숫자 조합 6~15자" onchange="pwdCharCheck()"></td>
								<td><span id="pwdCharCheck"></span></td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td><input name="pwd2" class="pwd2" type="password" onchange="pwdCheck()"></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td class="pwdCheckResult"><span id="checkText2" class="p">　</span></td>
								<td></td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td><input name="name" class="name" type="text" value="${member.name}"></td>
								<td><button class="nameCheck" onclick="nameCheck('${member.name}')"><a href="#">중복확인</a></button></td>
							</tr>
							<tr>
								<td></td>
								<td class="nameCheckResult"><span id="checkText3" class="p">　</span></td>
								<td></td>
							</tr>
						</table>
					</div>	<!-- Edit -->
			<!-- </div> -->
			<br>
		
		
			<table class="EditTable2">
				<tr>
					<td class="">
						<button class="EditButton" onclick="memberEdit('${member.name}')">회원정보 수정</button>
					</td>
					<td class="">
						<button class="delButton" onclick="deleteAccount('${member.id}')">회원 탈퇴</button>
					</td>
				</tr>
				
			</table>
		
		</form>
		
		</div>	<!-- memberEdit -->
		
	</div>	<!-- content -->
</body>
</html>