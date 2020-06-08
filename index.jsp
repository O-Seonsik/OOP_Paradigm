<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = (String)request.getParameter("path");
    if(path==null || path=="") path = "list";
%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="style/index.css">
        <title>도서관리 시스템</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">책방</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/library/?path=list">목록<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/library/?path=Rent.jsp">대여</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/library/?path=list?SORT=2&RETURN=true">반납</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/library/?path=AddBook.jsp">추가</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">정렬</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown01">
                                <a class="dropdown-item" href="/library/?path=list?SORT=1">대여량 기준</a>
                                <a class="dropdown-item" href="/library/?path=list?SORT=2">대여된 책</a>
                                <a class="dropdown-item" href="/library/?path=list?SORT=3">대여 가능한 책</a>
                            </div>
                        </li>
                    </ul>
                    <a href="?path=MemberInfo">회원 리스트</a>
                    <a href="/library/Join.jsp">회원가입</a>
                    <a href="/library/Logout.jsp">로그아웃</a>
                </div>
            </div>
        </nav>
        <main role="main" class="container" style="margin-top:56px; background:#fff;">
            <jsp:include page="<%=path%>"/>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</html>
