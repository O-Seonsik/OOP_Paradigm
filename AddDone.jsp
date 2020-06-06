<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>도서 추가 결과</title>
    </head>
    <body>
        <%
            String result = request.getParameter("DONE");
            if (result.equals("Duplicate")) out.println("이미 있는 ID입니다.");
            else if(result.equals("Missing")) out.println("모든 데이터를 입력하세요.");
        %>
    </body>
</html>