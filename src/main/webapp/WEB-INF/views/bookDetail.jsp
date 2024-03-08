<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	        <p>페이지수: ${book.itemPage}</p>
	        <p>목차: ${book.toc}</p>
	        <p>무게: ${book.weight}g</p>
	    </c:forEach>
	</c:if>
	
	 
</body>
</html>
