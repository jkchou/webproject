<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="bean.Data" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Data data = new Data();
    String name = request.getParameter("name");
    String password = request.getParameter("ps");
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
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else request.getRequestDispatcher("/login.html").forward(request,response);
        data.close();
    }catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
