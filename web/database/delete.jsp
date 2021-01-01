<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="bean.Data" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Data data = new Data();
    int id =Integer.parseInt(request.getParameter("id"));
    String sql = "DELETE FROM catalog WHERE id ="+id;
    int i = data.exeU(sql);
%>
删除了<%=i%>条数据
</body>
</html>
