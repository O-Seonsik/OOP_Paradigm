<%--
  Created by IntelliJ IDEA.
  User: 5linesys
  Date: 2020/06/06
  Time: 3:11 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>회원가입</title>
    </head>
    <body>
        <form action="/library/join" method="POST">
            아이디: <input type="text" placeholder="아이디" name="id"> <br>
            비밀번호: <input type="password" placeholder="비밀번호" name="passwd"> <br>
            비밀번호 확인: <input type="password" placeholder="비밀번호 확인" name="confirmPW"> <br>
            <input type="submit" value="회원가입">
        </form>
    </body>
</html>
