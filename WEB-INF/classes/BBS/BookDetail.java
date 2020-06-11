package BBS;


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class BookDetail extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        String get = request.getParameter("GET");
        if(get == "" || get == null) response.sendRedirect("/library");
        else{
            DBConnect dbConnect =new DBConnect("SELECT * FROM booksinfo WHERE id = ?");
            Connection conn =dbConnect.getConn();
            PreparedStatement stmt = dbConnect.getPstmt();
            try{
                stmt.setString(1, get);
                ResultSet rs = stmt.executeQuery();
                if(rs.next()){
                    BBSList list = new BBSList();
                    list.setId(0, rs.getInt("id"));
                    list.setName(0, rs.getString("name"));
                    list.setWriter(0, rs.getString("writer"));
                    list.setPrice(0, rs.getInt("price"));
                    list.setRent(0, rs.getBoolean("rent"));
                    list.setRentNum(0, rs.getInt("rent_num"));
                    list.setRentBy(0, rs.getString("rent_by"));
                    request.setAttribute("BBS_LIST", list);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("?path=DetailView.jsp");
                    dispatcher.forward(request, response);
                }else response.sendRedirect("/library");
            }catch(Exception e){
                throw new ServletException(e);
            }finally {
                try{stmt.close();}
                catch(Exception ignored){}
                try{conn.close();}
                catch(Exception ignored){}
            }

        }
    }
}
