<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="h3 mb-3 font-weight-normal">회원 정보</h1>
<table class="table table-striped">
    <tr>
        <th style="width:15%;" scope="row">아이디</th>
        <td style="text-align: center">${MEMBER_INFO.id[0]}</td>
    </tr>
    <tr>
        <th style="width:15%;" scope="row">이름</th>
        <td style="text-align: center">${MEMBER_INFO.name[0]}</td>
    </tr>
    <tr>
        <th style="width:15%;" scope="row">학번</th>
        <td style="text-align: center">${MEMBER_INFO.stuNum[0]}</td
    </tr>
    <tr>
        <th style="width:15%;" scope="row">휴대전화</th>
        <td style="text-align: center">${MEMBER_INFO.phone[0]}</td>
    </tr>
    <tr>
        <th style="width:15%;" scope="row">이메일</th>
        <td style="text-align: center">${MEMBER_INFO.mail[0]}</td>
    </tr>
</table>
