<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSearchBooks</title>
</head>
<body>
	<h1>도서검색결과</h1>
	
	<c:if test="${not empty books}">
        <ul>
            <c:forEach items="${books}" var="book">
                <li>${book.title}</li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty books}">
        <p>검색 결과가 없습니다.</p>
    </c:if>
    
</body>
</html>