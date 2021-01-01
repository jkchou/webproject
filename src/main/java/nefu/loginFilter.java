package nefu;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = "/index.jsp",filterName = "loginFilter")
public class loginFilter implements Filter {
    protected FilterConfig filterConfig;
    public void destroy() {
        filterConfig = null;
    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession();
        String reqURL = request.getRequestURI();
        if(reqURL.contains("login")){
            chain.doFilter(req,resp);
        }
        else if(session.getAttribute("login")==null){
            response.sendRedirect("login.html");
        }else if(session.getAttribute("login").equals("true")){
            chain.doFilter(req,resp);
        }else response.sendRedirect("login.html");
    }

    public void init(FilterConfig config) throws ServletException {
        config = filterConfig;
    }

}
