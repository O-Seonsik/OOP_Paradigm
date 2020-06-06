package BBS;

import javax.servlet.ServletException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBManager {
    // 데이터베이스에 값 입력, 조작, 삭제 - return 필요 없음
    public void updateQuery(String SQL) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            stmt.executeUpdate(SQL);
        }catch (Exception e){
            throw new ServletException();
        }finally{
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
    }

    // 데이터베이스 값 조회 - return 필요
    public ResultSet executeQuery(String SQL) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        ResultSet rs = null;
        try{
            rs = stmt.executeQuery(SQL);
            return rs;
        }catch (Exception e){
            throw new ServletException();
        }finally{
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
    }
}
