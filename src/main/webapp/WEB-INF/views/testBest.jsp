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
            <p>데이터 없음</p>
        </c:when>
        <c:otherwise>

        <br><br>
        
            <table border="1">
        
                <tr>
                    <th>Title</th>
                    <th>isbn13</th>
                    <th>Author</th>
                    <th>Publisher</th>
                    <th>Cover</th>
                    <th>Customer Review Rank</th>
                    <th>itemPage</th>
                    <th>Pubdate</th>
                </tr>
                <c:forEach items="${books}" var="book">
                    <tr>
                        <td><a href="/bc/bookDetail/${book.isbn13}">${book.title}</a></td>
                        <td>${book.isbn13}</td>
                        <td>${book.author}</td>
                        <td>${book.publisher}</td>
                        <td><img src="${book.cover}"></td>
                        <td>${book.customerReviewRank}</td>
                        <td>${book.itemPage}</td>
						<fmt:formatDate value="${book.pubDate}" pattern="yyyy-MM-dd" var="formattedDate" />
                        <td>${formattedDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>
