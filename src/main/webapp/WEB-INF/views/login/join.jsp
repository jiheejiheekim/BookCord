<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
   <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>회원가입</title>



    <style>


        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }


        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }


    </style>



</head>
<script>

</script>
<body class="text-center">
<main class="form-signin w-100 m-auto">
    <form  name="join_form" action="/joindo" method="post">
        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>

        <h1 class="h3 mb-3 fw-normal">Please join in</h1>
        <div class="form-floating">
            <input class="form-control" name="email" id="id" placeholder="name@example.com">
            <label for="email">Email address</label><%--<button class="btn btn-light rounded-pill px-3" type="button" name="btn" id="btnEmailCheck">Duplicate check</button>--%>
            <span id="id-check"></span>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="pwd" id="password" placeholder="Password" autoComplete="off">
            <label for="password">Password</label>
        </div>
        
        <div class="form-floating">
            <input type="text" class="form-control" name="name" id="name" placeholder="name">
            <label for="name">name</label>
        </div>
        <button class="w-50 btn btn-lg btn-dark" type="button" onclick="history.back();" >이전페이지로가기</button>
        <%--<button class="w-50 btn btn-lg btn-primary" type="button" name="btn" id="btnSingUp" >Sign up</button>--%>
        <button type="submit" class="w-50 btn btn-lg btn-primary">Sign up</button>
    </form>
</main>



</body>
</html>
