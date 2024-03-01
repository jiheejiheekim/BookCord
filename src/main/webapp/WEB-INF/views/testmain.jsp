<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h2>Search Results</h2>

    <c:if test="${empty books}">
        <p>No search results found.</p>
    </c:if>

    <c:forEach items="${books}" var="book">
        <div>
            <h3>Title: ${book.title}</h3>
            <p>Author: ${book.author}</p>
            <p>Publisher: ${book.publisher}</p>
            <p>ISBN: ${book.isbn}</p>
        </div>
    </c:forEach>
</body>
</html>
