<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<!DOCTYPE html>
<html>
<head>
    <title>New Books</title>
</head>
<body>
    <h2>New Books</h2>

    <c:if test="${not empty newBooks}">
        <%-- JSON 문자열을 JSON 객체로 변환 --%>
        <c:set var="newBooksObj" value="<%= new ObjectMapper().readTree((String)request.getAttribute(\"newBooks\")) %>" />
        <c:forEach items="${newBooksObj.item}" var="book">
            <div>
                <h3>Title: ${book.title}</h3>
                <p>Author: ${book.author}</p>
                <p>Publisher: ${book.publisher}</p>
                <p>ISBN: ${book.isbn}</p>
            </div>
        </c:forEach>
    </c:if>
</body>
</html>
