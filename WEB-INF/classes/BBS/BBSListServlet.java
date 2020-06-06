package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class BBSListServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String strPage = request.getParameter("PAGE");
        String strSort = request.getParameter("SORT");
        String getReturn = request.getParameter("RETURN");
        BBSList list;
        int page, sort;
        if(strPage == null || strPage == "") page = 1;
        else page = Integer.parseInt(strPage);

        if(strSort == null || strSort == "") sort = 0;
        else sort = Integer.parseInt(strSort);
        list = readDB(sort, page);
        request.setAttribute("BBS_LIST", list);

        if(sort == 2) request.setAttribute("RETURN", getReturn);
        else request.setAttribute("RETURN", null);
        RequestDispatcher dispatcher = request.getRequestDispatcher("?path=BBSListView.jsp");
        dispatcher.forward(request, response);
    }

    private BBSList readDB(int sort, int page) throws ServletException {
        BBSList list = new BBSList();
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        int totPage = 0;
        try{
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM booksinfo");
            if(sort == 2) rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM booksinfo WHERE !rent");
            else if(sort == 3) rs = stmt.executeQuery("SELECT COUNT(*) AS COUNT FROM booksinfo WHERE rent");
            if(rs.next()) {
                ArrayList<Integer> pageInfo = new ArrayList<Integer>();
                int total = rs.getInt("COUNT");
                if(total%5 == 0) total /= 5;
                else total = total/5 + 1;

                for(int i = page/10+1; i <= page/10+10; i++){
                    if(i > total) break;
                    list.setPage(i-(total/10+1), i);
                }
            }
            if (sort == 0) rs = stmt.executeQuery("SELECT * FROM booksinfo ORDER BY id ASC LIMIT " + (page-1)*5 + ", " + 5);
            else if (sort == 1) rs = stmt.executeQuery("SELECT * FROM booksinfo ORDER BY rent_num DESC, id ASC LIMIT " + (page-1)*5 + ", " + 5);
            else if (sort == 2) rs = stmt.executeQuery("SELECT * FROM booksinfo WHERE !rent ORDER BY id ASC");
            else if (sort == 3) rs = stmt.executeQuery("SELECT * FROM booksinfo WHERE rent ORDER BY id ASC");

            for(int i = 0; i < 5; i++) {
                if (!rs.next()) break;
                list.setId(i, rs.getInt("id"));
                list.setName(i, rs.getString("name"));
                list.setWriter(i, rs.getString("writer"));
                list.setPrice(i, rs.getInt("price"));
                list.setRent(i, rs.getBoolean("rent"));
                list.setRentNum(i, rs.getInt("rent_num"));
            }
        }catch(Exception e){ throw new ServletException(e);}
        finally {
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
        return list;
    }
}
