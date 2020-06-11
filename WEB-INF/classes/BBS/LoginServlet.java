package BBS;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String id = request.getParameter("ID");
        String PW = request.getParameter("PASSWORD");
        String logout = request.getParameter("LOGOUT");

        if(logout == "" || logout == null){
            //ERROR code1 = Parameter Missing, code2 = No data
            if(id == "" || PW == "") response.sendRedirect("Login.jsp?ERROR=1");
            else {
                try {
                    Encryption encryption = new Encryption();
                    DBConnect dbConnect = new DBConnect("SELECT * FROM members WHERE user_id = ? AND passwd = ?");
                    Connection conn = dbConnect.getConn();
                    PreparedStatement stmt = dbConnect.getPstmt();
                    stmt.setString(1, id);
                    stmt.setString(2, encryption.getSHA256(PW));
                    ResultSet rs = stmt.executeQuery();
                    HttpSession session = request.getSession();
                    session.setAttribute("ID", id);
                    if(rs.next()) response.sendRedirect("/library");
                    else response.sendRedirect("Login.jsp?ERROR=2");
                } catch (Exception e) {
                    throw new ServletException(e);
                }
            }
        }

    }
}
