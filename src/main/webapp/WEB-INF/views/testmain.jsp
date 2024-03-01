<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Search Books</title>
</head>
<body>
    <h2>Search Books</h2>
    <form action="/bc/search" method="get">
        <label for="queryType">Query Type:</label>
        <select name="queryType" id="queryType">
            <option value="Title">Title</option>
            <option value="Author">Author</option>
            <option value="Publisher">Publisher</option>
            <option value="ISBN">ISBN</option>
        </select><br>
        <label for="keyword">Keyword:</label>
        <input type="text" id="keyword" name="keyword"><br>
        <input type="submit" value="Search">
    </form>

    
</body>
</html>
