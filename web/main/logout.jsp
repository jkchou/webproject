<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("/login");
%>
</body>
</html>
