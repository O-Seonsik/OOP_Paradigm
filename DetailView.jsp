<%--
  Created by IntelliJ IDEA.
  User: 5linesys
  Date: 2020/06/12
  Time: 4:36 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String get = (String)request.getAttribute("GET");
    String loginId = (String)session.getAttribute("ID");
    pageContext.setAttribute("loginId", loginId);
%>
<div class="container marketing">
    <div class="jumbotron mt-3">
        <h2>제목: ${BBS_LIST.name[0]}</h2>
        <p>도서번호: ${BBS_LIST.id[0]}</p>
        <p>저자: ${BBS_LIST.writer[0]}</p>
        <p>가격: ${BBS_LIST.price[0]}</p>
        <c:if test="${BBS_LIST.rent[0]}">
            <p>대여 가능 여부: <a href="/library/rent?ID=${param.GET}&USERID=${pageScope.loginId}">T(대여하기)</a></p>
        </c:if>
        <c:if test="${!BBS_LIST.rent[0]}">
            <p>대여 가능 여부: F</p>
        </c:if>
        <p>대여 횟수${BBS_LIST.rentNum[0]}</p>
        <c:if test="${param.SORT eq 2}">
            <p>대여자: <a href="?path=MemberInfo?USERID=${BBS_LIST.rentBy[0]}">${BBS_LIST.rentBy[0]}</a></p>
        </c:if>
        <c:if test = "${pageScope.loginId eq BBS_LIST.rentBy[0]}">
            <p><a href="/library/return?ID=${BBS_LIST.id[0]}">반납</a></p>
        </c:if>
    </div>
</div>

<script>
    window.onpageshow = (event) => {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload();
    }
</script>