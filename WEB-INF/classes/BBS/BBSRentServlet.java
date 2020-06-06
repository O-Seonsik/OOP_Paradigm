package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;


public class BBSRentServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String rentId = request.getParameter("ID");
        if(rentId == null || rentId == "") response.sendRedirect("/library/RentDone.jsp?DONE=NO");
        else{
            DBConnect dbConnect = new DBConnect();
            Connection conn = dbConnect.getConn();
            Statement stmt = dbConnect.getStmt();
            try{
                ResultSet rs = stmt.executeQuery("SELECT rent FROM booksinfo WHERE id = " + rentId);
                boolean rentStat = false;
                if(rs.next() && rs.getBoolean("rent")){
                    stmt.executeUpdate(" UPDATE booksinfo SET rent_num = rent_num+1, rent = !rent WHERE id = " + rentId);
                    response.sendRedirect("/library/RentDone.jsp?DONE=OK");
                } else response.sendRedirect("/library/RentDone.jsp?DONE=NO");
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
