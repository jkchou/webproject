<%@ page import="bean.Data" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String describe = request.getParameter("describe");
    String user = request.getParameter("user");
    String detail = request.getParameter("detail");
    String sql = "UPDATE catalog t SET t.name = '"+name+"', t.des = '"+describe+"', t.user = '"+user+"', t.date = '"+format.format(date)+"',t.det = '"+detail+"' WHERE t.id ="+id;
    int i = data.exeU(sql);
    data.close();
%>
<br>
改变了<%=i%>条数据
</body>
</html>
