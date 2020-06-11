package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JoinServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
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
            try{
                DBConnect dbConnect = new DBConnect("SELECT * FROM members WHERE user_id = ?");
                Connection conn = dbConnect.getConn();
                PreparedStatement stmt = dbConnect.getPstmt();
                stmt.setString(1, id);
                ResultSet rs = stmt.executeQuery();
                boolean checked = false;
                if(!rs.next()) checked = true;
                if(checked){
                    Encryption encryption = new Encryption();
                    stmt = conn.prepareStatement("INSERT INTO members (user_name, user_id, passwd, stu_num, phone, mail) VALUES (?, ?, ?, ?, ?, ?)");
                    stmt.setString(1, name);
                    stmt.setString(2, id);
                    stmt.setString(3, encryption.getSHA256(confirm));
                    stmt.setString(4, stuNum);
                    stmt.setString(5, phone);
                    stmt.setString(6, mail);
                    response.sendRedirect("Login.jsp");
                    stmt.executeUpdate();
                }else response.sendRedirect("Join.jsp?ERROR=2");
            }catch(Exception e) {
                throw new ServletException(e);
            }
        }else response.sendRedirect("Join.jsp?ERROR=3");
    }
}
