<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="/library/style/login.css">
        <title>회원가입</title>
    </head>
    <body class="text-center">
        <form class="form-signin" action="join" method="POST" onsubmit="return checkJoin()">
            <h1 class="h3 mb-3 font-weight-normal">Welcome!</h1>
            <label for="ID" class="sr-only">ID</label>
            <input class="form-control" type="text" placeholder="아이디" name="ID" id="ID" required autofocus>
            <label for="NAME" class="sr-only">Name</label>
            <input class="form-control" type="text" placeholder="이름" name="NAME" id="NAME" required>
            <label for="PASSWORD" class="sr-only">Password</label>
            <input class="form-control" type="password" placeholder="비밀번호" name="PASSWORD" id="PASSWORD" required>
            <label for="confirmPW" class="sr-only">Confirm</label>
            <input class="form-control" type="password" placeholder="비밀번호 확인" name="confirmPW" id="confirmPW" required>
            <label for="STU_NUM" class="sr-only">Student Number</label>
            <input class="form-control" type="text" placeholder="학번" name="STU_NUM" id="STU_NUM" required>
            <label for="PHONE" class="sr-only">Phone number</label>
            <input class="form-control" type="tel" placeholder="휴대전화" name="PHONE" id="PHONE" required>
            <label for="MAIL" class="sr-only">Email address</label>
            <input class="form-control" type="email" placeholder="이메일" name="MAIL" id="MAIL" required>

            <input style="margin-top: 10px;" class="btn btn-lg btn-primary btn-block bg-dark" type="submit" value="회원가입">
        </form>
    </body>
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

        const checkInteger = (value) => {
            if (!(/^(\-|\+)?([0-9]+)$/.test(value) && parseInt(value) > 0)) return false;
            return true;
        };

        const checkJoin = () => {
            const id = document.getElementById("ID").value;
            const name = document.getElementById("NAME").value;
            const password = document.getElementById("PASSWORD").value;
            const confirm = document.getElementById("confirmPW").value;
            const stuNum = document.getElementById("STU_NUM").value;
            const phone = document.getElementById("PHONE").value;
            const mail = document.getElementById("MAIL").value;
            if(!checkSpecial(id)){
                alert("아이디에 특수문자를 사용할 수 없습니다.");
                return false;
            }
            if(!checkSpecial(name)){
                alert("이름에 특수문자를 사용할 수 없습니다.")
                return false;
            }
            if(!checkBlank(password)) return false;
            if(!checkBlank(confirm)) return false;
            if(!checkInteger(stuNum)){
                alert("학번에는 0이상의 정수만 입력 가능합니다.")
                return false;
            }
            if(!checkBlank(phone)) return false;
            if(!checkBlank(mail)) return false;
        }
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
    </script>
</html>
