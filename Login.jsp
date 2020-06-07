<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>로그인 화면입니다.</title>
    </head>
    <body>
        <form action="login" method="post" onsubmit="return checkParameter()">
            아이디: <input type="text" name="ID" id="ID"> <br>
            패스워드: <input type="password" name="PASSWORD" id="PASSWORD"> <br>
            <input type="submit" value="로그인">
        </form>
        <a href="Join.jsp">회원가입</a>
    </body>
    <script>
        <%
            String code = request.getParameter("ERROR");
            if(code == null) code ="0";
        %>
        <% if(code.equals("1")){ %> alert("입력하지 않은 파라미터가 존재합니다.")
        <% }else if(code.equals("2")){ %> alert("입력한 아이디 혹은 비밀번호가 존재하지 않습니다.")
        <%} %>

        const checkParameter = () => {
            const ID = document.getElementById("ID").value
            const PW = document.getElementById("PASSWORD").value

            if(!ID  || !PW ) {
                if (!ID) alert("아이디를 입력하세요")
                else if (!PW) alert("비밀번호를 입력하세요")
                return false;
            }
            return true;
        }
    </script>
</html>
