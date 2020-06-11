<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loginId = (String)session.getAttribute("ID");
    pageContext.setAttribute("loginId", loginId);
%>
<form class="form-signin" action="rent" method="get" onsubmit="return rentCheck()">
    <h1 class="h3 mb-3 font-weight-normal">도서 대여</h1>
    <label for="ID" class="sr-only">Book Title</label>
    <input class="form-control"  type="text" name = "ID" id="ID" placeholder="대여할 책 ID를 입력하세요" required autofocus>
    <input style="display: none;" type="text" name = "USERID" value="${pageScope.loginId}">
    <input class="btn btn-lg btn-primary btn-block bg-dark" style=" margin-top: 10px; width: 30%; float: right;" type="submit" value="확인">
</form>

<script>
    window.onpageshow = (event) => {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload();
    }
    const rentCheck = () => {
        const id = document.getElementById("ID").value;
        if(!checkInteger(id)) {
            alert("id는 0 이상의 정수만 입력 가능합니다.");
            return false;
        }else if(id.length > 5){
            alert("아이디는 5자리 이하의 정수입니다.")
            return false;
        }

        return true;
    }

</script>
