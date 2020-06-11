<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-signin"  action="add" method="post" onsubmit="return check()">
    <h1 class="h3 mb-3 font-weight-normal">도서 추가</h1>
    <label for="ID" class="sr-only">Book ID</label>
    <input class="form-control" style="margin-bottom:5px;" placeholder="도서 ID" type="text" name="ID" id="ID" required autofocus>
    <label for="NAME" class="sr-only">Book Title</label>
    <input class="form-control" style="margin-bottom:5px;" placeholder="도서 제목" type="text" name="NAME" id="NAME" required>
    <label for="WRITER" class="sr-only">Book Writer</label>
    <input class="form-control" style="margin-bottom:5px;" placeholder="저자" type="text" name="WRITER" id="WRITER" required>
    <label for="PRICE" class="sr-only">Book Price</label>
    <input class="form-control" style="margin-bottom:5px;" placeholder="도서 가격" type="text" name="PRICE" id="PRICE" required>
    <input class="btn btn-lg btn-primary btn-block bg-dark" style=" margin-top: 10px; width: 30%; float: right;" type="submit" value="저장">
</form>
<script>
    window.onpageshow = (event) => {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload();
    }
    const check = () => {
        const id = document.getElementById("ID").value;
        const title = document.getElementById("NAME").value;
        const writer = document.getElementById("WRITER").value;
        const price = document.getElementById("PRICE").value;
        if(!checkInteger(id)) {
            alert("id는 0 이상의 정수만 입력 가능합니다.");
            return false;
        }
        if(!checkBlank(title)) return false;
        if(!checkBlank(writer)) return false;
        if(!checkInteger(price)) {
            alert("가격은 0이상의 정수만 입력 가능합니다.")
            return false;
        }
        return true;
    }

</script>
