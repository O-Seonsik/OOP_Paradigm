package BBS;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;


public class InfoListServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String userId = request.getParameter("USERID");
        InfoList list = new InfoList();
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            ResultSet rs = stmt.executeQuery("SELECT user_name, user_id, stu_num, phone, mail FROM members WHERE user_id = '" + userId +"'");
            if(rs.next()){
                list.setId(0, rs.getString("user_id"));
                list.setName(0, rs.getString("user_name"));
                list.setStuNum(0, rs.getString("stu_num"));
                list.setPhone(0, rs.getString("phone"));
                list.setMail(0, rs.getString("mail"));
            }

            request.setAttribute("MEMBER_INFO", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("?path=MemberInfoView.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }finally {
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
    }
}
