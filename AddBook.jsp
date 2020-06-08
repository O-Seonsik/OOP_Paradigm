<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-signin"  action="add" method="post">
    <h1 class="h3 mb-3 font-weight-normal">도서 추가</h1>
    <label for="ID" class="sr-only">Book ID</label>
    <input class="form-control" placeholder="도서 ID" type="text" name="ID" id="ID" required autofocus>
    <label for="NAME" class="sr-only">Book Title</label>
    <input class="form-control" placeholder="도서 제목" type="text" name="NAME" id="NAME" required>
    <label for="WRITER" class="sr-only">Book Writer</label>
    <input class="form-control" placeholder="저자" type="text" name="WRITER" id="WRITER" required>
    <label for="PRICE" class="sr-only">Book Price</label>
    <input  class="form-control" placeholder="도서 가격" type="text" name="PRICE" id="PRICE" required>
    <input class="btn btn-lg btn-primary btn-block bg-dark" style=" margin-top: 10px; width: 30%; float: right;" type="submit" value="저장">
</form>
