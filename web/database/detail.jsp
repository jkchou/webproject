<%@ page import="bean.Data" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>
<body>
<table class="result-tab" width="100%">
    <tr>
        <th>ID</th>
        <th>分类</th>
        <th>名称</th>
        <th>发布人</th>
        <th>更新时间</th>
        <th>详情</th>
    </tr>

<%
    Data data = new Data();
    String id = request.getParameter("id");
    String sql = "SELECT * FROM catalog WHERE id="+id;
    ResultSet rs = data.exeQ(sql);
    try {
        while (rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getDate(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("</tr>");
        }
    }catch (SQLException throwables) {
        throwables.printStackTrace();
    }

%>
</table>
</body>
</html>
