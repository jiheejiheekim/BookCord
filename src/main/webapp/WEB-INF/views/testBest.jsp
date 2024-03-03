<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>TestBest</title>
</head>
<body>
    <h2>Search Results</h2>

    <c:choose>
        <c:when test="${empty books}">
            <p>No search results found.</p>
        </c:when>
        <c:otherwise>
            <table border="1">
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Cover</th>
                    <th>Customer Review Rank</th>
                    <th>Pubdate</th>
                </tr>
                <c:forEach items="${books}" var="book">
                    <tr>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>${book.publisher}</td>
                        <td><img src="${book.cover}"></td>
                        <td>${book.customerReviewRank}</td>
                        <td>${book.pubDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>
