<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - SignUp</title>
<link rel="stylesheet" href="resources/css/signUp.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	
	function idCheck() {
		event.preventDefault();
		
		var id = $(".id").val();
		if (id == "") {
			alert("아이디를 입력하세요"+id);
			$(".id").focus();
			/* return; */
		}
		$.ajax({
			type:"get",
			url:"/bc/idCheck",
			data:{"id":id},
			dataType: "JSON",
			success:function(result){
				if(result >= 1){
					$("#checkText").html("사용할 수 없는 아이디입니다");
					$("#checkText").addClass("text2");
					$("#checkText").removeClass("text1");
					$(".id").focus();
				}else{
					$("#checkText").html("사용할 수 있는 아이디입니다");
					$("#checkText").addClass("text1");
					$("#checkText").removeClass("text2");
				}
			},
			error:function(err){
				alert('요청 실패 : '+err);	
				console.log(err);
			}
		}) 
	}
	

	function nameCheck() {
		event.preventDefault();
		
		var name = $('.name').val();
		if(name == ""){
			alert("닉네임을 입력하세요");
			$(".name").focus();
			return;
		}
		$.ajax({
			type:"get",
			url:"/bc/nameCheck",
			data:{"name":name},
			dataType:"json",
			success:function(result){
				if(result >= 1){
					$("#checkText3").html("이미 사용중인 닉네임입니다");
					$("#checkText3").addClass("text2");
					$("#checkText3").removeClass("text1");
					$(".name").focus();
				}else{
					$("#checkText3").html("사용할 수 있는 닉네임입니다");
					$("#checkText3").addClass("text1");
					$("#checkText3").removeClass("text2");
				}
			},
			error:function(err){
				alert('요청 실패 : '+err);
				console.log(err);
			}
		})
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
		}else if(pwd1 != null && pwd2 !=null && pwd1 != pwd2){
			$("#checkText2").html("비밀번호가 일치하지 않습니다");
			$("#checkText2").addClass("text2");
			$("#checkText2").removeClass("text1");
		}else if(pwd1 != null && pwd2 == "" && pwd1 != pwd2){
			$("#checkText2").html("비밀번호가 일치하지 않습니다");
			$("#checkText2").addClass("text2");
			$("#checkText2").removeClass("text1");
		}else{
			alert('다시 시도하세요');
			return;
		}
		
	}
	

	
	function signUp(){	
		var id = $(".id").val();
		var name = $('.name').val();
		var pwd1 = $(".pwd1").val();
		var pwd2 = $(".pwd2").val();
		var check = $("#checkText").text();
		var check2 = $("#checkText2").text();
		var check3 = $("#checkText3").text();
						
		if(!id) {
			alert('아이디를 입력해주세요');
			member.id.focus();
			return;
		}
		if(!pwd1) {
			alert('비밀번호를 입력해주세요');
			member.pwd.focus();
			return;
		}
		if(!pwd2) {
			alert('비밀번호를 입력해주세요');
			member.pwd2.focus();
			return;
		}
		if(!name) {
			alert('닉네임을 입력해주세요');
			member.name.focus();
			return;
		}
		
		if(pwd1 != pwd2) {
			alert('비밀번호가 일치하지 않습니다');
			member.pwd2.focus();
			return;
		}
		
		if(pwd1.length < 6 || pwd1.length > 15){
			alert('비밀번호 형식이 일치하지 않습니다');
			member.pwd.focus();
			return;
		}
		if(pwd2.length < 6 || pwd2.length > 15){
			alert('비밀번호 형식이 일치하지 않습니다');
			member.pwd.focus();
			return;
		}
		
		if(check != '사용할 수 있는 아이디입니다'){
			alert('아이디를 확인하세요');
			member.id.focus();
			return;
		}
		
		if(check2 != '비밀번호가 일치합니다'){
			alert('비밀번호를 확인하세요');
			member.pwd2.focus();
			return;
		}
		
		if(check3 != '사용할 수 있는 닉네임입니다'){
			alert('닉네임을 확인하세요');
			member.name.focus();
			return;
		}
		
		idCheck();
		pwdCharCheck();
		nameCheck();
		
		member.submit();
		
	}
	
	
</script>
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="/bc/main"><img class="logo" src="resources/images/logo.png"></a></td>
				<!-- <td class="top2"><a href="/notice/notice">공지사항</a></td>
				<td class="top3"><a href="/login/login">로그인</a></td> -->
			</tr>
		</table>
	</div>
	
	<div class="signUp">
		<form name="member" action="/bc/register" method="post">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div>
				<table class="signUpTable">
					<tr>
						<td>아이디</td>
						<td><input name="id" class="id" type="text"></td>
						<td><button type="button" class="idCheck" onclick="idCheck()"><a href="#">중복확인</a></button></td>
					</tr>
					<tr>
						<td></td>
						<td class="idCheckResult"><span id="checkText">　</span></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input name="pwd" class="pwd1" type="password" placeholder="영문/숫자 조합 6~15자" onchange="pwdCharCheck()"></td>
						<td><span id="pwdCharCheck"></span></td>	<!-- <img class="pwImg" src="resources/images/pwCheckO.png"> -->
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input name="pwd2" class="pwd2" type="password" onchange="pwdCheck()"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td class="pwdCheckResult"><span id="checkText2">　</span></td>
						<td></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input name="name" class="name" type="text"></td>
						<td><button class="nameCheck" onclick="nameCheck()"><a href="#">중복확인</a></button></td>
					</tr>
					<tr>
						<td></td>
						<td class="nameCheckResult"><span id="checkText3">　</span></td>
						<td></td>
					</tr>
				</table>
			</div>
		
			<div class="finalSingUp">
				<button type="button" class="signUpButton" onclick="signUp()">회원가입</button>
			</div>
		</form>
	</div>	<!-- .SignUp -->
</body>
</html>