<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="/library/style/login.css">
        <title>로그인 화면입니다.</title>
    </head>
    <body class="text-center">
        <form class="form-signin" action="login" method="post" onsubmit="return checkParameter()">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <label for="ID" class="sr-only">Email address</label>
            <input class="form-control" placeholder="ID" type="text" name="ID" id="ID" required autofocus>
            <label for="password" class="sr-only">Password</label>
            <input class="form-control" placeholder="Password" type="password" name="PASSWORD" id="PASSWORD" required>
            <button style="margin-top:10px" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
            <a class="btn btn-lg btn-primary btn-block" href="Join.jsp">회원가입</a>
        </form>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
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
