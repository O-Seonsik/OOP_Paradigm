<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.getSession().setAttribute("ID", null);
    response.sendRedirect("Login.jsp");
%>
