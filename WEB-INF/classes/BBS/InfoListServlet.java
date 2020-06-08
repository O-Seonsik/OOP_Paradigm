package BBS;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;


public class InfoListServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userId = request.getParameter("USERID");
        String strPage = request.getParameter("PAGE");
        String url;
        InfoList list;
        int page, sort;
        if(strPage == null || strPage == "") page = 1;
        else page = Integer.parseInt(strPage);

        if(userId == "" || userId == null) {
            list = getList(page);
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

    private InfoList getList(int page) throws ServletException{
        InfoList list = new InfoList();
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM members");
            if(page >= 10) list.setButton(0, true);
            else list.setButton(0, false);
            if(rs.next()){
                int total = rs.getInt("COUNT");
                if(total%10 == 0) total /= 10;
                else total = total/10 + 1;

                int pageIndex = page;
                int MAXINDEX = 10;
                if(pageIndex < 10){
                    pageIndex = 1;
                    MAXINDEX = 9;
                }
                else pageIndex = pageIndex / 10 * 10;

                for(int i = pageIndex; i < pageIndex + MAXINDEX; i++){
                    if(i > total) break;
                    list.setPage(i-pageIndex, i);
                }
                if(pageIndex + MAXINDEX <= total) list.setButton(1, true);
                else list.setButton(1, false);
            }
            rs = stmt.executeQuery("SELECT user_name, user_id, stu_num, phone, mail FROM members ORDER BY id ASC LIMIT " + (page-1)*10 + ", " + 10);
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
