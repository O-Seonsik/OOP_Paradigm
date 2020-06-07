<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = (String)request.getParameter("path");
    if(path==null || path=="") path = "list";
%>
<html>
    <head>
        <link rel="stylesheet" href="style/index.css">
        <title>도서관리 시스템</title>
    </head>
    <body>
    <a href="/library/Logout.jsp">로그아웃</a>
        <nav>
            <ul>
                <li><a href="/library/?path=list">목록</a></li><!--
                --><li><a href="/library/?path=list?SORT=1">대여량 기준 정렬</a></li><!--
                --><li><a href="/library/?path=list?SORT=2">대여된 책</a></li><!--
                --><li><a href="/library/?path=list?SORT=3">대여 가능한 책</a></li><!--
                --><li><a href="/library/?path=Rent.jsp">대여</a></li><!--
                --><li><a href="/library/?path=list?SORT=2&RETURN=true">반납</a></li><!--
                --><li><a href="/library/?path=AddBook.jsp">추가</a></li>
            </ul>
        </nav>
        <div>
            <jsp:include page="<%=path%>"/>
        </div>
    </body>
</html>
