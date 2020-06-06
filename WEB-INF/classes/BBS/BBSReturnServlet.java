package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.sql.*;

public class BBSReturnServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String returnId = request.getParameter("ID");
        if(returnId == null || returnId == "") response.sendRedirect("/library?path=list");
        else{
            DBConnect dbConnect = new DBConnect();
            Connection conn = dbConnect.getConn();
            Statement stmt = dbConnect.getStmt();
            try{
                stmt.executeUpdate("UPDATE booksinfo SET rent = !rent WHERE id = " + returnId);
                response.sendRedirect("/library?path=list");
            }catch(Exception e){
                throw new ServletException(e);
            }finally{
                try{stmt.close();}
                catch(Exception ignored) {}
                try{conn.close();}
                catch(Exception ignored) {}
            }
        }
    }
}
