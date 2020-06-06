<%@ page import="BBS.BBSList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    BBSList list = (BBSList)request.getAttribute("BBS_LIST");
    int pageSize = list.getPage().length;
    String res = (String)request.getAttribute("RETURN");
%>
<html>
    <head>
        <title>도서관리 시스템</title>
    </head>
    <body>
        <h4>도서관리 시스템</h4>
        <table border="1">
            <tr>
                <td>id</td>
                <td>name</td>
                <td>writer</td>
                <td>price</td>
                <td>rent</td>
                <td>rent_num</td>
            </tr>
            <% if (list.getListSize() != 0){%>
            <c:forEach var="cnt" begin="0" end="${BBS_LIST.listSize-1}">
                <tr>
                    <td>${BBS_LIST.id[cnt]}</td>
                    <td>${BBS_LIST.name[cnt]}</td>
                    <td>${BBS_LIST.writer[cnt]}</td>
                    <td>${BBS_LIST.price[cnt]}</td>
                    <td>
                        <c:if test="${BBS_LIST.rent[cnt]}">
                            T
                        </c:if>
                        <c:if test="${!BBS_LIST.rent[cnt]}">
                            F
                        </c:if>
                    </td>
                    <td>${BBS_LIST.rentNum[cnt]}</td>
                    <% if(!(res==null || res=="")){ %>
                        <td><a href="/library/return?ID=${BBS_LIST.id[cnt]}">반납</a></td>
                    <% } %>
                </tr>
            </c:forEach>
        </table>
        <c:forEach var="cnt" begin="0" end="<%=pageSize%>">
            <a href="/library/?path=list?SORT=${param.SORT}&PAGE=${BBS_LIST.page[cnt]}">${BBS_LIST.page[cnt]}</a>
        </c:forEach>
        <%}%>
    </body>
</html>
