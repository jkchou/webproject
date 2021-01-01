package nefu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import bean.Data;
import com.sun.org.apache.bcel.internal.generic.NEW;

@WebServlet("/login")
public class login extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/web?serverTimezone=GMT";
    static final String USER = "root";
    static final String PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("ps");
        Data data = new Data();
        String sql = "SELECT name,password FROM user";
        try {
            ResultSet rs = data.exeQ(sql);
            boolean flag =false;
            while (rs.next()){
                String name_db = rs.getString("name");
                String password_db = rs.getString("password");
                if(name.equals(name_db)&&password.equals(password_db)){
                    flag = true;
                    break;
                }
            }
            if(flag){
                request.getSession().setAttribute("login","true");
                request.getSession().setAttribute("userName",name);
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }else request.getRequestDispatcher("/login.html").forward(request,response);
            data.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.html").forward(request,response);
    }
}
