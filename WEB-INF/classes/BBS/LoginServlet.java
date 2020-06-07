package BBS;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String id = request.getParameter("ID");
        String PW = request.getParameter("PASSWORD");
        String logout = request.getParameter("LOGOUT");

        if(logout == "" || logout == null){
            //ERROR code1 = Parameter Missing, code2 = No data
            if(id == "" || PW == "") response.sendRedirect("Login.jsp?ERROR=1");
            else {
                DBManager dbManager = new DBManager();
                Encryption encryption = new Encryption();
                if(dbManager.executeQuery("user_id", id, "passwd", encryption.getSHA256(PW), "members")){
                    HttpSession session = request.getSession();
                    session.setAttribute("ID", id);
                    response.sendRedirect("/library");
                }else{
                    response.sendRedirect("Login.jsp?ERROR=2");
                }
            }
        }

    }
}
