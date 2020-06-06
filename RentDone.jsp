<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>대여결과</title>
    </head>
    <body>
        <%
            String result = request.getParameter("DONE");
            if (result.equals("OK")) out.println("대여되었습니다.");
            else if(result.equals("NO")) out.println("대여할 수 없습니다.");
        %>
    </body>
</html>
