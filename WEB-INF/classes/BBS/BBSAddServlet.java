package BBS;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class BBSAddServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("ID");
        String name = request.getParameter("NAME");
        String writer = request.getParameter("WRITER");
        String price = request.getParameter("PRICE");
        if(id == "" || name == "" || writer == "" || price == "") {
            // parameter missing
            response.sendRedirect("/library?path=AddDone.jsp?DONE=Missing");
        }else{
            if(check(Integer.parseInt(id))){
                result(id, name, writer, price);
                response.sendRedirect("/library?path=list");
            }else{
                //Duplicate
                response.sendRedirect("/library?path=AddDone.jsp?DONE=Duplicate");
            }
        }
    }
    private boolean check(int id) throws ServletException {
        DBConnect dbConnect = new DBConnect("SELECT * FROM booksinfo WHERE id = ?");
        Connection conn = dbConnect.getConn();
        PreparedStatement stmt = dbConnect.getPstmt();
        ResultSet rs = null;
        try{
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if(rs.next()) return false;
            else return true;
        }catch(Exception e){
            throw new ServletException(e);
        }finally{
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
    }

    private void result(String id, String name, String writer, String price) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        PreparedStatement stmt = dbConnect.getPstmt();
        try{
            stmt = conn.prepareStatement("INSERT INTO booksinfo (id, name, writer, price) VALUES (?, ?, ?, ?)");
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, writer);
            stmt.setString(4, price);
            stmt.executeUpdate();
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
