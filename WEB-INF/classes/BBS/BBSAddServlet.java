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
                String SQL = "INSERT INTO booksinfo (id, name, writer, price) VALUES (" + id + ", '" + name + "', '" + writer + "', " + price + ")";
                result(SQL);
                response.sendRedirect("/library?path=list");
            }else{
                //Duplicate
                response.sendRedirect("/library?path=AddDone.jsp?DONE=Duplicate");
            }
        }
    }
    private boolean check(int id) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        ResultSet rs = null;
        try{
            rs = stmt.executeQuery("SELECT * FROM booksinfo WHERE id = " + id);
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

    private void result(String SQL) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            stmt.executeUpdate(SQL);
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
