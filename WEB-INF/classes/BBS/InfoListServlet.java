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
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            DBConnect dbConnect = new DBConnect("SELECT user_name, user_id, stu_num, phone, mail FROM members WHERE user_id = ?");
            conn = dbConnect.getConn();
            stmt = dbConnect.getPstmt();
            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();
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
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            DBConnect dbConnect = new DBConnect("SELECT COUNT(*) AS COUNT FROM members");
            conn = dbConnect.getConn();
            stmt = dbConnect.getPstmt();
            ResultSet rs = stmt.executeQuery();
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
            stmt = conn.prepareStatement("SELECT user_name, user_id, stu_num, phone, mail FROM members ORDER BY id ASC LIMIT ?, ?");
            stmt.setInt(1,(page-1)*10);
            stmt.setInt(2, 10);
            rs = stmt.executeQuery();
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
