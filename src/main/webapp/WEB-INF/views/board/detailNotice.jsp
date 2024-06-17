<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - DetailNotice</title>
<link rel="stylesheet" href="../resources/css/detailNotice.css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

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
	
	function upNotice(notice_num) {
		console.log('==> ' + notice_num + '번 게시물 수정 요청');
		location.href = '/bc/updateNotice?notice_num='+notice_num;
	}
	
	function delNotice(notice_num) {
	    console.log('==> ' + notice_num + '번 게시물 삭제 요청');
	    if(confirm('게시물을 삭제하시겠습니까?')){
	        // 게시물 삭제 요청
	        location.href = '/bc/deleteNotice?notice_num='+notice_num;
	        alert('삭제 완료');
	    } else {
	        alert('삭제를 취소했습니다.');
	    }
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
				<td class="top1" colspan="5"><a href="main"><img
						class="logo" src="../resources/images/logo.png"></a></td>
				<td class="top2"><a href="/bc/notice">공지사항</a></td>
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
					<td class="navi1">공지사항</td>
				</tr>
				<tr>
					<td class="navi2"><a class="naviA" href="/bc/notice">공지사항</a></td>
				</tr>
				<tr>
					<td class="navi3"><a class="naviA" href="/bc/qna">문의하기</a></td>
				</tr>
			</table>
		</div>	<!-- navi -->
		
		
		<div class="writeNoticeHead">
			<span class="wrHeadSpan">공지사항</span>
				<form name="form" method="post">
				<div class="wrTableDiv">
					<table class="wrTable1">
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr2">
							<td class="wrt1r2d1">작성자</td>
							<td class="wrt1r2d2">${notice.member_id}</td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr3">
							<td class="wrt1r3d1">제목</td>
							<td class="wrt1r3d2">${notice.title}</td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr4">
							<td class="wrt1r4d1">내용</td>
							<td class="wrt1r4d2">${notice.content}</td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
						<tr class="wrt1tr5">
							<td class="wrt1r5d1">첨부파일</td>
							<td class="wrt1r5d2">
								<c:forEach var="fileName" items="${notice.files.split(',')}">
									<a href="/bc/download?fileName=${fileName.trim()}">${fileName}</a><br>
						     	 </c:forEach>
						    </td>
						</tr>
						<tr class="wrt1tr">
							<td class="wrt1r1d1" colspan="3"><hr style="color:#2D9462"></td>
						</tr>
					</table>
				</div><!-- wrTableDiv -->
				
				<div class="submit">
					<button type="submit" class="updateBt"><a href="#" onclick="upNotice(${notice.notice_num})">수정</a></button>
					<button type="submit" class="deleteBt"><a href="#" onclick="delNotice(${notice.notice_num})">삭제</a></button>
				</div>
			</form>
		</div>	<!-- writeNoticeHead -->
	</div>	<!-- content -->
</body>
</html>