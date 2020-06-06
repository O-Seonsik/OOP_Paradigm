package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class JoinServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        PrintWriter out = response.getWriter();
        out.println("test");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
//        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String confirm = request.getParameter("confirmPW");

        out.println(id);
        out.println(passwd);
        out.println(confirm);
        if(passwd.equals(confirm)) out.println("success");
        else out.println("fail");
    }
}
