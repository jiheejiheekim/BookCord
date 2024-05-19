<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord</title>
<link rel="stylesheet" href="resources/css/main.css">
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
						<a href="loginP">로그인</a>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="loginP">로그아웃</a>
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
				<td><input class="searchinput" type="text" placeholder="도서 제목, 작가를 검색해보세요"></td>
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