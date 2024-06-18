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
						<button class="EditButton" onclick="memberEdit('${member.name}')"><a href="">회원정보 수정</a></button>
					</td>
				</tr>
				<!-- <div class="finalEdit">
					<button class="EditButton" onclick="memberEdit()"><a href="">회원정보 수정</a></button>
				</div> -->
			</table>
		
		</form>
		
		</div>	<!-- memberEdit -->
		
	</div>	<!-- content -->
</body>
</html>