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
		var id=$(".id").val();
		if (id == "") {
			alert("아이디를 입력하세요"+id);
			$(".id").focus();
			return;
		}
		$.ajax({
			type:"get",
			url:"/bc/idCheck",
			data:{"id":id},
			dataType: "JSON",
			success:function(result){
				if(result == 1){
					$("#checkText").html("이미 사용중인 아이디입니다");
					$("#checkText").addClass("text2");
					$("#checkText").removeClass("text1");
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
</script>
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img class="logo" src="resources/images/logo.png"></a></td>
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
						<td><button type="button" class="idCheck" onclick="idCheck()">중복확인</button></td>
					</tr>
					<tr>
						<td></td>
						<td class="idCheckResult"><span id="checkText"></span></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input name="pwd" class="pw" type="password" placeholder="영문/숫자 조합 6~15자"></td>
						<td><img class="pwImg" src="resources/images/pwCheckO.png"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input class="pwCheck" type="password"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td class="pwdCheckResult">비밀번호가 일치합니다</td>
						<td></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input name="name" class="nickName" type="text"></td>
						<td><button class="NickNameCheck"><a href="">중복확인</a></button></td>
					</tr>
					<tr>
						<td></td>
						<td class="nameCheckResult">이미 사용 중인 닉네임 입니다</td>
						<td></td>
					</tr>
				</table>
			</div>
		
			<div class="finalSingUp">
				<button type="submit" class="signUpButton">회원가입</button>
			</div>
		</form>
	</div>	<!-- .SignUp -->
</body>
</html>