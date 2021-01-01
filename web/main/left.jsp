<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/30
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/main.css"/>
    <style>
        .sub-menu1{border-top: 1px solid #e5e5e5;background: #fff;}
        .sub-menu1 li{padding-left: -2px}
    </style>
</head>
<body>
<ul class="sidebar-list"  style="width:100%">
    <li>
        <ul class="sub-menu1" style="width:100%;text-align: center">
            <li><a target="iframe" href="./database/page.jsp"><i class="icon-font">&#xe008;</i>系统概述</a></li>
            <li><a target="iframe" href="./database/table.jsp"><i class="icon-font">&#xe005;</i>查看数据</a></li>
            <li><a target="iframe" href="./database/insert.html"><i class="icon-font">&#xe006;</i>添加数据</a></li>
        </ul>
    </li>
</ul>
</body>
</html>
