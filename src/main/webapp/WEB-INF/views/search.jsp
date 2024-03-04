<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>TestSearch</title>
</head>
<body>
    <h1>도서 검색</h1>
    
    <form action="/bc/searchBooks" method="post">
        <label for="query">검색어:</label>
        <input type="text" id="query" name="query">
        <button type="submit">검색</button>
    </form>
    
</body>
</html>