<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="alert alert-dark" role="alert">
<%
    String result = request.getParameter("DONE");
    if (result.equals("Duplicate")) out.println("이미 있는 ID입니다.");
    else if(result.equals("Missing")) out.println("모든 데이터를 입력하세요.");
%>
</div>
<button type="button" class="btn btn-lg btn-primary btn-block bg-dark" style="width:30%; float: right;" onclick="location='https://test.oseonsik.com/library/?path=AddBook.jsp'">돌아가기</button>