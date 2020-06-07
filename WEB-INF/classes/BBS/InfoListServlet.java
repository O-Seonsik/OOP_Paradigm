package BBS;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;


public class InfoListServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userId = request.getParameter("USERID");
        String url;
        InfoList list;

        if(userId == "" || userId == null) {
            list = getList();
            url = "?path=MemberListView.jsp";
        }else {
            list = getOne(userId);
            url = "?path=MemberInfoView.jsp";
        }

        request.setAttribute("MEMBER_INFO", list);
        RequestDispatcher dispatcher  = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private InfoList getOne(String userId) throws ServletException {
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
        } catch (Exception e) {
            throw new ServletException(e);
        }finally {
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
        return list;
    }

    private InfoList getList() throws ServletException{
        InfoList list = new InfoList();
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            ResultSet rs = stmt.executeQuery("SELECT user_name, user_id, stu_num, phone, mail FROM members");
            int index = 0;
            while(rs.next()){
                list.setId(index, rs.getString("user_id"));
                list.setName(index, rs.getString("user_name"));
                list.setStuNum(index, rs.getString("stu_num"));
                list.setPhone(index, rs.getString("phone"));
                list.setMail(index++, rs.getString("mail"));
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }finally {
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
        return list;
    }
}
