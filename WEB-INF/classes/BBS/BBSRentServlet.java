package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;


public class BBSRentServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Connection conn = null;
        PreparedStatement stmt = null;
        String rentId = request.getParameter("ID");
        String userId = request.getParameter("USERID");
        if(rentId == null || rentId == "") response.sendRedirect("/library?path=RentDone.jsp?DONE=NO");
        else{
            try{
                DBConnect dbConnect = new DBConnect("SELECT rent FROM booksinfo WHERE id = ?");
                conn = dbConnect.getConn();
                stmt = dbConnect.getPstmt();
                stmt.setString(1, rentId);
                ResultSet rs = stmt.executeQuery();
                boolean rentStat = false;
                if(rs.next() && rs.getBoolean("rent")){
                    stmt = conn.prepareStatement( "UPDATE booksinfo SET rent_num = rent_num+1, rent = !rent,  rent_by = ? WHERE id = ?");
                    stmt.setString(1, userId);
                    stmt.setString(2, rentId);
                    stmt.executeUpdate();
                    response.sendRedirect("/library?path=RentDone.jsp?DONE=OK");
                } else response.sendRedirect("/library?path=RentDone.jsp?DONE=NO");
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
