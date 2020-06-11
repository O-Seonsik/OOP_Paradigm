package BBS;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class BBSListServlet extends HttpServlet {
    private Connection conn;
    private PreparedStatement stmt = null;

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
        try{
            DBConnect dbConnect;
            if(sort == 2) dbConnect = new DBConnect("SELECT COUNT(*) AS COUNT FROM booksinfo WHERE !rent");
            else if(sort == 3) dbConnect = new DBConnect("SELECT COUNT(*) AS COUNT FROM booksinfo WHERE rent");
            else dbConnect = new DBConnect("SELECT COUNT(*) AS COUNT FROM booksinfo");

            Connection conn = dbConnect.getConn();
            PreparedStatement stmt = dbConnect.getPstmt();
            ResultSet rs = stmt.executeQuery();
            if(page >= 10) list.setButton(0, true);
            else list.setButton(0, false);
            if(rs.next()) {
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

            if(sort == 0) stmt = conn.prepareStatement("SELECT * FROM booksinfo ORDER BY id ASC LIMIT ?, ?");
            else if (sort == 1) stmt = conn.prepareStatement("SELECT * FROM booksinfo ORDER BY rent_num DESC, id ASC LIMIT ?, ?");
            else if (sort == 2) stmt = conn.prepareStatement("SELECT * FROM booksinfo WHERE !rent ORDER BY id ASC LIMIT ?, ?");
            else if (sort == 3) stmt = conn.prepareStatement("SELECT * FROM booksinfo WHERE rent ORDER BY id ASC LIMIT ?, ?");
            stmt.setInt(1,(page-1)*10);
            stmt.setInt(2, 10);
            rs = stmt.executeQuery();

            for(int i = 0; i < 10; i++) {
                if (!rs.next()) break;
                list.setId(i, rs.getInt("id"));
                list.setName(i, rs.getString("name"));
                list.setWriter(i, rs.getString("writer"));
                list.setPrice(i, rs.getInt("price"));
                list.setRent(i, rs.getBoolean("rent"));
                list.setRentNum(i, rs.getInt("rent_num"));
                list.setRentBy(i, rs.getString("rent_by"));
            }
        } catch(Exception e){ throw new ServletException(e);}
        finally {
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
        return list;
    }
}
