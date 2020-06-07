<%--
  Created by IntelliJ IDEA.
  User: 5linesys
  Date: 2020/06/08
  Time: 3:50 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        아이디: ${MEMBER_INFO.id[0]}<br>
        이름: ${MEMBER_INFO.name[0]}<br>
        학번: ${MEMBER_INFO.stuNum[0]}<br>
        휴대전화: ${MEMBER_INFO.phone[0]}<br>
        이메일: ${MEMBER_INFO.mail[0]}<br>
    </body>
</html>
