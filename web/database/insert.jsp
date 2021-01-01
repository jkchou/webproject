<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.Data" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    Data data = new Data();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String name = request.getParameter("name");
    String describe = request.getParameter("describe");
    String user = request.getParameter("user");
    String detail = request.getParameter("detail");
    String sql = "INSERT INTO catalog (name,des,user,date,det) VALUES ('"+name+"', '"+describe+"', '"+user+"', '"+format.format(date)+"', '"+detail+"')";
    int i = data.exeU(sql);
    data.close();
%>
<br>
插入<%=i%>条数据
</body>
</html>
