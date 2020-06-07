package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.ResultSet;

public class JoinServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("ID");
        String name = request.getParameter("NAME");
        String passwd = request.getParameter("PASSWORD");
        String confirm = request.getParameter("confirmPW");
        String stuNum = request.getParameter("STU_NUM");
        String phone = request.getParameter("PHONE");
        String mail = request.getParameter("MAIL");

        //ERROR code1 = Parameter Missing, code2 = Duplicate ID code3 = Unknown
        if(id == "" || name == "" || passwd == "" || confirm == "" || stuNum == "" || phone == "" || mail == "") response.sendRedirect("Join.jsp?ERROR=1");
        else if(passwd.equals(confirm)){
            DBManager dbManager = new DBManager();
            try{
                if(dbManager.executeQuery("user_id", id, "members")) response.sendRedirect("Join.jsp?ERROR=2");
                else{
                    Encryption encryption = new Encryption();
                    dbManager.updateQuery("INSERT INTO members (user_name, user_id, passwd, stu_num, phone, mail) VALUES ('" + name + "', '" + id + "', '" + encryption.getSHA256(confirm) + "', " + Integer.parseInt(stuNum) + ", '" + phone + "', '" + mail + "')");
                    response.sendRedirect("Login.jsp");
                }
            }catch(Exception e) {
                throw new ServletException(e);
            }
        }else response.sendRedirect("Join.jsp?ERROR=3");
    }
}
