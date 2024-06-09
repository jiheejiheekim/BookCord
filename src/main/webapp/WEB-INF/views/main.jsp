<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord</title>
<link rel="stylesheet" href="resources/css/main.css">
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
						<a href="/bc/loginP">로그인</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="javascript:logout()">로그아웃</a>
					</sec:authorize>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="mid">
		문구 길게 대충 감명 깊은척
	</div>
	
	<br>
	
	<div class="search">
		<table>
			<tr>
				<td><img class="searchimg" src="resources/images/search.png"></td>
				<form action="/bc/searchBook" method="get">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<td><input id="query" name="query" class="searchinput" type="text" placeholder="도서 제목, 작가를 검색해보세요"></td>
				</form>
			</tr>
		</table>
	</div>
	
	<br>
	
	<div class="bestseller">
		<table class="bshead">
			<tr>
				<td class="bshead1" colspan="4">　베스트 셀러</td>
				<td class="bshead2"><button class="bsbutton"><a href="bestSeller">더보기　　></a></button></td>
			</tr>
		</table>
		<div class="bsDiv">
			<c:forEach items="${bestSeller}" var="book">
				<table class="bslist">
					
							<tr>
								<td class="bsTd"><a href="/bc/detail/${book.isbn13}"><img class="bookimg" src="${book.cover}"></a></td>
							</tr>
							<tr>
								<td class="bsTd1">
									<script type="text/javascript">
							            var title = "${book.title}";
							            if (title.length > 10) {
							                title = title.substring(0, 12) + '..';
							            }
							            document.write(title);
							        </script>
								</td>
							</tr>
							<tr>
								<td class="bsTd2">
									<script type="text/javascript">
							            var author = "${book.author}";
							            if (author.length > 10) {
							            	author = author.substring(0, 12) + '..';
							            }
							            document.write(author);
							        </script>
								
								</td>
							</tr>
						
				</table>
			</c:forEach>
		</div>	<!-- bsDiv -->
	</div>	<!-- bestseller -->
	
	<br><br>
	
	<div class="newBooks">
		<table class="nbhead">
			<tr>
				<td class="nbhead1" colspan="4">　신간 도서</td>
				<td class="nbhead2"><button class="nbbutton"><a href="newBooks">더보기　　></a></button></td>
			</tr>
		</table>
		<div class="nbDiv">
			<c:forEach items="${newBook}" var="book">
				<table class="nblist">
					
							<tr>
								<td class="nbTd"><a href="/bc/detail/${book.isbn13}"><img class="bookimg" src="${book.cover}"></a></td>
							</tr>
							<tr>
								<td class="nbTd1">
									<script type="text/javascript">
							            var title = "${book.title}";
							            if (title.length > 10) {
							                title = title.substring(0, 12) + '..';
							            }
							            document.write(title);
							        </script>
								</td>
							</tr>
							<tr>
								<td class="nbTd2">
									<script type="text/javascript">
							            var author = "${book.author}";
							            if (author.length > 10) {
							            	author = author.substring(0, 12) + '..';
							            }
							            document.write(author);
							        </script>
								
								</td>
							</tr>
						
				</table>
			</c:forEach>
		</div>	<!-- bsDiv -->
	</div>	<!-- newBooks -->
	
	<br><br>
	
</body>
</html>