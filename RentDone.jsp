<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="alert alert-dark" role="alert">
<%
    String result = request.getParameter("DONE");
    if (result.equals("OK")) out.println("대여되었습니다.");
    else if(result.equals("NO")) out.println("대여할 수 없습니다.");
%>
</div>
<button type="button" class="btn btn-lg btn-primary btn-block bg-dark" style="width:30%; float: right;" onclick="location='https://test.oseonsik.com/library/?path=Rent.jsp'">돌아가기</button>