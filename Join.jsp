<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>회원가입</title>
    </head>
    <body>
        <form action="join" method="POST" onsubmit="return checkParameter()">
            아이디: <input type="text" placeholder="아이디" name="ID" id="ID"> <br>
            이름: <input type="text" placeholder="이름" name="NAME" id="NAME"> <br>
            비밀번호: <input type="password" placeholder="비밀번호" name="PASSWORD" id="PASSWORD"> <br>
            비밀번호 확인: <input type="password" placeholder="비밀번호 확인" name="confirmPW" id="confirmPW"> <br>
            <input type="submit" value="회원가입">
        </form>
    </body>
    <script>
        <%
            String code = request.getParameter("ERROR");
            if(code == null) code ="0";
        %>
        <% if(code.equals("1")){ %>
            alert("입력하지 않은 파라미터가 존재합니다.")
        <% }else if(code.equals("2")){ %>
            alert("동일한 아이디가 존재합니다.")
        <% }else if(code.equals("3")){ %>
            alert("알수없는 오류로 회원가입에 실패했습니다.")
        <% } %>
        const checkParameter = () => {
            const ID = document.getElementById("ID").value
            const NAME = document.getElementById("NAME").value;
            const PW = document.getElementById("PASSWORD").value
            const PWC = document.getElementById("confirmPW").value

            if(!ID || !NAME || !PW || !PWC || PW != PWC) {
                if (!ID) alert("아이디를 입력하세요")
                else if (!NAME) alert("이름을 입력하세요")
                else if (!PW) alert("비밀번호를 입력하세요")
                else if (!PWC) alert("비밀번호 확인을 입력하세요")
                else if (PW != PWC) alert("비밀번호와, 비밀번호 확인이 다릅니다.")
                return false;
            }

            return true;
        }
    </script>
</html>
