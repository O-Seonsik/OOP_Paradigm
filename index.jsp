<%--
  Created by IntelliJ IDEA.
  User: 5linesys
  Date: 2020/06/06
  Time: 4:04 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = (String)request.getParameter("path");
    if(path==null || path=="") path = "list";
%>
<html>
    <head>
        <title>도서관리 시스템</title>
    </head>
    <body>
        <ul>
            <li><a href="/library/?path=list">목록</a></li>
            <li><a href="/library/?path=list?SORT=1">대여량 기준 정렬</a></li>
            <li><a href="/library/?path=list?SORT=2">대여된 책</a></li>
            <li><a href="/library/?path=list?SORT=3">대여 가능한 책</a></li>
            <li><a href="/library/?path=Rent.jsp">대여</a></li>
            <li><a href="/library/?path=list?SORT=2&RETURN=true">반납</a></li>
            <li>추가</li>
        </ul>
        <div>
            <jsp:include page="<%=path%>"/>
        </div>
    </body>
</html>
