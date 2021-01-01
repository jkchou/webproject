<%@ page import="bean.Data" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/31
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/main.css"/>
    <title>Title</title>
</head>
<body>
<%
    Data data = new Data();
    String des = "";
    String user = "";
    String det = "";
    int id = Integer.parseInt(request.getParameter("id"));
    String sql = "SELECT * FROM catalog WHERE id="+id;
    ResultSet rs = data.exeQ(sql);
    while (true){
        try {
            if (!rs.next()) break;
             des = rs.getString(3);
             user = rs.getString(4);
             det = rs.getString(6);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    data.close();
%>
<div class="crumb-wrap">
    <div class="crumb-list"><i class="icon-font"></i><a href="../database/page.jsp">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="table.jsp">作品管理</a><span class="crumb-step">&gt;</span><span>新增作品</span></div>
</div>
<div class="result-wrap">
    <div class="result-content">
        <form action="change.jsp" method="post" id="myform" name="myform">
            <input type="text" hidden name="id" value="<%=id%>">
            <table class="insert-tab" width="100%">
                <tbody><tr>
                    <th width="120">分类：</th>
                    <td>
                        <select name="name" id="catid" class="required">
                            <option value="大家电">大家电</option>
                            <option value="汽车电子">汽车电子</option>
                            <option value="工具类">工具类</option>
                            <option value="维修类">维修类</option>
                            <option value="电子类">电子类</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>名称:</th>
                    <td>
                        <input class="common-text required" id="title" name="des" size="50" value="<%=des%>" type="text">
                    </td>
                </tr>
                <tr>
                    <th>发布人:</th>
                    <td><input class="common-text" name="user" size="50" value="<%=user%>" type="text"></td>
                </tr>
                <tr>
                    <th>缩略图：</th>
                    <td><input name="smallimg" id="" type="file" accept="image/*"></td>
                </tr>
                <tr>
                    <th>详情：</th>
                    <td><textarea name="detail" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10" ><%=det%></textarea></td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                        <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                    </td>
                </tr>
                </tbody></table>
        </form>
    </div>
</div>
</body>
</html>
