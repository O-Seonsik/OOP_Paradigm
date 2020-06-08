<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="h3 mb-3 font-weight-normal">회원 리스트</h1>
<table  class="table table-striped">
    <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">stu_num</th>
            <th scope="col">phone</th>
            <th scope="col">mail</th>
        </tr>
    </thead>
    <c:if test="${MEMBER_INFO.listSize ne 0}">
        <c:forEach var="cnt" begin="0" end="${MEMBER_INFO.listSize-1}">
            <tr>
                <td>${MEMBER_INFO.id[cnt]}</td>
                <td>${MEMBER_INFO.name[cnt]}</td>
                <td>${MEMBER_INFO.stuNum[cnt]}</td>
                <td>${MEMBER_INFO.phone[cnt]}</td>
                <td>${MEMBER_INFO.mail[cnt]}</td>
            </tr>
        </c:forEach>
    </c:if>
</table>
