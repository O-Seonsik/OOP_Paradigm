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
            throw new ServletException(e);
        }finally{
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
    }

    // 데이터베이스 입력값 유효성 검사
    public boolean executeQuery(String key, String value, String table) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + " WHERE " + key +  " = '" + value + "'");
            if(rs.next()) return true;
            else return false;
        }catch (Exception e){
            throw new ServletException();
        }finally{
            try{stmt.close();}
            catch(Exception ignored) {}
            try{conn.close();}
            catch(Exception ignored) {}
        }
    }

    // 데이터베이스 입력값 유효성 검사
    public boolean executeQuery(String key1, String value1, String key2, String value2, String table) throws ServletException {
        DBConnect dbConnect = new DBConnect();
        Connection conn = dbConnect.getConn();
        Statement stmt = dbConnect.getStmt();
        try{
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + " WHERE " + key1 + " = '" + value1 + "' AND " + key2 + " = '" + value2 +"'");
            if(rs.next()) return true;
            else return false;
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
