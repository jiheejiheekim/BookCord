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
    <c:if test="${not empty books}">
        <c:forEach var="book" items="${books}">
            <p>도서명: ${book.title}</p>
            <p>저자: ${book.author}</p>
            <!-- 기타 도서 정보 표시 -->
        </c:forEach>
    </c:if>
    <c:if test="${empty books}">
        <p>도서 정보를 찾을 수 없습니다.</p>
    </c:if>
</body>
</html>
