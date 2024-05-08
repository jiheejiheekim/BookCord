<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCord - Detail</title>
<link rel="stylesheet" href="../resources/css/detail.css">
</head>
<body>
	<!-- TOP -->
	<div class="top">
		<table class="toptable">
			<tr>
				<td class="top1" colspan="5"><a href="main"><img
						class="logo" src="../resources/images/logo.png"></a></td>
				<td class="top2"><a href="notice">공지사항</a></td>
				<td class="top3"><a href="memberEdit">마이페이지</a></td>
				<td class="top4"><a href="login">로그아웃</a></td>
			</tr>
		</table>
	</div>
	
	<div class="content">
	
		<div class="detail">	<!-- 추후 API 사용 -->
		<c:if test="${not empty items}">
	    	<c:forEach var="book" items="${items}">
				<table class="dTable1">
					<tr>
						<td class="d1td1" rowspan="11"><img class="cover" src="${book.cover}"></td>
						<td class="d1td2">${book.title}</td>
						<td class="d1td3"><a href=""><img class="bookMarkImg" src="../resources/images/bookmarkO.png"></td>
					</tr>
					<tr>
						<td class="d1td4" colspan="2">${book.author}</td>
					</tr>
					<tr>
						<fmt:formatDate value="${book.pubDate}" pattern="yyyy년 MM월 dd일" var="formattedDate" />
						<td class="d1td5">${book.publisher} | ${formattedDate}</td>
					</tr>
					<tr>
						<fmt:parseNumber value="${book.priceStandard}" pattern="#,##0" var="formattedPriceStandard" />
						<fmt:parseNumber value="${book.priceSales}" pattern="#,##0" var="formattedPriceSales" />
						<td class="d1td6">정가 <fmt:formatNumber value="${formattedPriceStandard}" />원 → 판매가 <span class="priceSales"><fmt:formatNumber value="${formattedPriceSales}" /></span>원</td>
					</tr>
					<tr>
						<td class="d1td7" colspan="2"><hr color="#2D9462"></td>
					</tr>
					<tr class="d1td8">
						<td class="d1td8">${book.subInfo.itemPage}쪽 | ${book.subInfo.packing.weight}g</td>
					</tr>
					<tr>
						<td class="d1td9">ISBN13 : ${book.isbn13}</td>
					</tr>
					<tr>
						<td class="d1td10">${book.categoryName}</td>
					</tr>
					
					<tr>
						<td class="d1td12" colspan="2"><hr color="#2D9462"></td>
					</tr>
					<tr>
						<td class="d1td13">
							<c:if test="${book.subInfo.ratingInfo.ratingScore >= 9.5}">	<!-- ratingScore:알라딘상품별평점 -->
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
					        <c:if test="${book.subInfo.ratingInfo.ratingScore < 9.5 and book.subInfo.ratingInfo.ratingScore >= 9.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/halfStar.png">
					        </c:if>
					        <c:if test="${book.subInfo.ratingInfo.ratingScore < 9.0 and book.subInfo.ratingInfo.ratingScore >= 8.5}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					        </c:if>
					        <c:if test="${book.subInfo.ratingInfo.ratingScore < 8.5 and book.subInfo.ratingInfo.ratingScore >= 8.0}">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/star.png">
					            <img class="star" src="../resources/images/halfStar.png">
					        </c:if>
							<span class="black">${book.subInfo.ratingInfo.ratingScore}</span>
						</td>
					</tr>
					<tr>
						<td class="d1td14" colspan="3"><hr color="#2D9462"></td>
					</tr>
				</table><!-- dTable1 -->

				<table class="dTable2">
					<tr>
						<td class="d2td1">책 소개</td>
						<td class="d2td2">${book.description}
						</td>
					</tr>
					<tr>
						<td class="d1td14" colspan="3"><hr color="#2D9462"></td>
					</tr>
				</table>

			</c:forEach>
		</c:if>
			
			<table class="dTable4">
				<tr class="dTabletr">
					<td class="d4td1" rowspan="13">리 뷰</td>
					<td class="d4td2" colspan="4">
						<input type="radio" name="radio">
							<img class="star" src="../resources/images/star.png">　
					
						<input type="radio" class="radio" name="radio">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">　
						
						<input type="radio" class="radio" name="radio">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">　
						
						<input type="radio" class="radio" name="radio">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">　
						
						<input type="radio" class="radio" name="radio">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">
							<img class="star" src="../resources/images/star.png">　
								
							
							<!-- radioTable -->
					</td>
				</tr>
				
				<tr>
					<td class="rTextareatd" colspan="3"><textarea class="rTextarea" name="rTextarea" rows="5" cols="30"></textarea></td>
					<td class="rSubmittd" colspan="2"><button class="rSubmitbt"><a href="">등 록</a></button></td>
				</tr>
				
				<tr>
					<td class="d1td14" colspan="10"><hr color="#2D9462"></td>
				</tr>
				
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">푸바오가 너무 귀여워요 사육사님들도 고생하셨습니다</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">아주 유익한 책이에요. 감명 깊게 잘 읽었습니다.</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">푸바오가 너무 귀여워요 사육사님들도 고생하셨습니다. 후이바오와 루이바오 둘 다 건강하게 자라렴!</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
				<tr>
					<td class="reviewTabletd">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
						<img class="star" src="../resources/images/star.png">
					</td>
					<td colspan="3">가지마 푸공주야ㅠㅠㅠ</td>
				</tr>
				<tr>
					<td class="reviewTabletd0"></td>
					<td class="reviewTabletd1">bookcord123</td>
					<td class="reviewTabletd2" colspan="2">2024-03-20</td>
				</tr>
		</table>
			
		</div>	<!-- detail -->
		
	</div>	<!-- content -->
	
	<div class="Page">
		<table class="PageTable">
			<tr>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="../resources/images/pageLeft.png"></a></td>
				<td><a class="bold">1</a></td>
				<td><a href="">2</a></td>
				<td><a href="">3</a></td>
				<td><a href="">4</a></td>
				<td><a href="">5</a></td>
				<td class="pageLogotd"><a><img class="pageLogo"
						src="../resources/images/pageRight.png"></a></td>
			</tr>
		</table>
	</div>

</body>
</html>