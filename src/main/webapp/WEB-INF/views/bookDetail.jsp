<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestBookDetail</title>
</head>
<body>
	<h1>도서 상세페이지</h1>

	
	<c:if test="${not empty items}">
	    <c:forEach var="book" items="${items}">
	        <p><img src="${book.cover}"></p>
	        <p>도서명: ${book.title}</p>
	        <p>저자: ${book.author}</p>
	        <p>출판사: ${book.publisher}</p>
	        <p>ISBN13 : ${book.isbn13}</p>
			<fmt:formatDate value="${book.pubDate}" pattern="yyyy년 MM월 dd일" var="formattedDate" />
	        <p>출간일: ${formattedDate}</p>
	        <p>상품설명(요약): ${book.description}</p>
	        <p>분야: ${book.categoryName}</p>
	        <p>정가: ${book.priceStandard}원</p>
	        <p>판매가: ${book.priceSales}원</p>
	        
	        <p>알라딘평점: ${book.customerReviewRank}</p>
	        
	        <p>상품의쪽수: ${book.subInfo.itemPage} 페이지</p>
	        <p>부제: ${book.subInfo.subTitle}</p>
	        
	        <p>알라딘상품의별평점: ${book.subInfo.ratingInfo.ratingScore}</p>
	        <p>알라딘상품에별을남긴개수: ${book.subInfo.ratingInfo.ratingCount}</p>
	        
	        	<p>무게: ${book.subInfo.packing.weight} g</p>
	        
	    </c:forEach>
	    
	</c:if>
	
	 
</body>
</html>
