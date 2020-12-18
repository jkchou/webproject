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
        String reqURL = request.getServletPath();
        if(!(reqURL.equals("/login"))){
            if(!session.getAttribute("login").equals("true")||session.getAttribute("login")==null){
                response.sendRedirect("/login");
                return;
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        config = filterConfig;
    }

}
