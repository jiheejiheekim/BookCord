<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<fmt:formatDate value="${book.pubDate}" pattern="yyyy-MM-dd" var="formattedDate" />
	        <p>출간일: ${formattedDate}</p>
	        <p>상품설명(요약): ${book.description}</p>
	        <p>알라딘평점: ${book.customerReviewRank}</p>
	        <p>분야: ${book.categoryName}</p>
	       
	       	<br>item의 하위정보인데 안나옴------------------------
	        <p>정가: ${book.priceStandard}원</p>
	        <p>판매가: ${book.priceSales}원</p>
	        
	 <%--    </c:forEach>
	</c:if>
	
	<c:if test="${not empty subInfo}">
	    <c:forEach var="subInfo" items="${subInfo}"> --%>
	        <br>subInfo의 하위정보----------------------------
	        <p>상품의쪽수: ${book.itemPage} 페이지</p>
	        <p>목차: ${book.toc}</p>
	    <%-- </c:forEach>
	</c:if>
		    
	<c:if test="${not empty packing}">
	    <c:forEach var="packing" items="${packing}"> --%>
	        <br>packing의 하위정보-------------------------
	        	<p>무게: ${book.weight} g</p>
<%-- 	    </c:forEach>
	</c:if>
	
	<c:if test="${not empty ratingInfo}">
	    <c:forEach var="ratingInfo" items="${ratingInfo}"> --%>
	        <br>ratingScore의 하위정보-----------------------------
	        <p>상품의별평점: ${book.ratingScore}</p>
	        <p>상품에별을남긴개수: ${book.ratingCount}</p>
	        
	        
	    </c:forEach>
	</c:if>
	
	 
</body>
</html>
