<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-signin" action="rent" method="get">
    <h1 class="h3 mb-3 font-weight-normal">도서 대여</h1>
    <label for="ID" class="sr-only">Book Title</label>
    <input class="form-control"  type="text" name = "ID" id="ID" placeholder="대여할 책 ID를 입력하세요" required autofocus>
    <input class="btn btn-lg btn-primary btn-block bg-dark" style=" margin-top: 10px; width: 30%; float: right;" type="submit" value="확인">
</form>
