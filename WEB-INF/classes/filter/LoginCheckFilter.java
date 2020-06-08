package filter;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class LoginCheckFilter implements Filter {
    public void init(FilterConfig config) throws ServletException{

    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpResponse = (HttpServletResponse)response;
        HttpSession session = httpRequest.getSession();
        if (excludeUrl(httpRequest)) {
            chain.doFilter(request, response);
        }else{
            if(session == null)  httpResponse.sendRedirect("Login.jsp");
            else {
                String id = (String) session.getAttribute("ID");
                if(id == null) httpResponse.sendRedirect("Login.jsp");
                else chain.doFilter(request, response);
            }
        }
    }
    public void destroy(){}
    private boolean excludeUrl(HttpServletRequest request) {
        String uri = request.getRequestURI().toString().trim();
        if (uri.startsWith("/library/Login.jsp") || uri.startsWith("/library/login")) return true;
        if (uri.startsWith("/library/Join.jsp") || uri.startsWith("/library/join")) return true;
        if (uri.startsWith("/library/style/login.css")) return true;
        else return false;
    }
}
