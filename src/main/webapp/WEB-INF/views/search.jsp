<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>
    <h2>New Books</h2>

    <c:if test="${empty books}">
        <p>No new books found.</p>
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
