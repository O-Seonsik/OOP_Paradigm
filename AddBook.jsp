<%--
  Created by IntelliJ IDEA.
  User: 5linesys
  Date: 2020/06/07
  Time: 12:53 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>추가 하기</title>
    </head>
    <body>
        <form action="add" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="ID"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="NAME"></td>
                </tr>
                <tr>
                    <td>저자</td>
                    <td><input type="text" name="WRITER"></td>
                </tr>
                <tr>
                    <td>가격</td>
                    <td><input type="text" name="PRICE"></td>
                </tr>
                <td><input type="submit" value="저장"></td>
            </table>
        </form>
    </body>
</html>
