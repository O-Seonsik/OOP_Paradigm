<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="/library/style/login.css">
        <title>로그인 화면입니다.</title>
    </head>
    <body class="text-center">
        <form class="form-signin" action="login" method="post" onsubmit="return checkLogin()">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <label for="ID" class="sr-only">Email address</label>
            <input class="form-control" placeholder="ID" type="text" name="ID" id="ID" required autofocus>
            <label for="password" class="sr-only">Password</label>
            <input class="form-control" placeholder="Password" type="password" name="PASSWORD" id="PASSWORD" required>
            <button style="margin-top:10px" class="btn btn-lg btn-primary btn-block bg-dark" type="submit">로그인</button>
            <a class="btn btn-lg btn-primary btn-block bg-dark" href="Join.jsp">회원가입</a>
        </form>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script>
        const checkBlank = (value) => {
            let blank_pattern = /^\s+|\s+$/g;
            if (value.replace(blank_pattern, "") == "") {
                alert("공백 문자는 사용할 수 없습니다.");
                return false;
            }
            return true;
        };

        const checkSpecial = (value) => {
            let special_pattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
            if (special_pattern.test(value) == true) return false;
            return true;
        };

        const checkLogin = () => {
            const id = document.getElementById("ID").value;
            const password = document.getElementById("PASSWORD").value;
            if(!checkSpecial(id)) {
                alert("아이디에 특수문자가 있습니다.")
                return false;
            }
            if(!checkBlank(password)) return false;
        }
        <%
            String code = request.getParameter("ERROR");
            if(code == null) code ="0";
        %>
        <% if(code.equals("1")){ %> alert("입력하지 않은 파라미터가 존재합니다.")
        <% }else if(code.equals("2")){ %> alert("입력한 아이디 혹은 비밀번호가 존재하지 않습니다.")
        <%} %>
    </script>
</html>
