<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Choose Year</title>
</head>
<body>
    <h2>Select Year</h2>
    <form action="/bc/testBestYear" method="post"> <!-- 수정된 부분 -->
        <label for="year">Year:</label>
        <select id="year" name="year">
            <c:forEach begin="2000" end="2024" var="i">
                <option value="${i}">${i}</option>
            </c:forEach>
        </select>
        <label for="month">Month:</label>
        <select id="month" name="month">
            <c:forEach begin="1" end="12" var="i">
                <option value="${i}">${i}</option>
            </c:forEach>
        </select>
        <br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
