<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="bean.Data" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/30
  Time: 19:06
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
<div class="crumb-wrap">
    <div class="crumb-list"><i class="icon-font"></i><a href="page.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">作品管理</span></div>
</div>
<div class="search-wrap">
    <div class="search-content">
        <form action="#" method="post">
            <table class="search-tab">
                <tr>
                    <th width="70">关键字:</th>
                    <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                    <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="result-wrap">
            <table class="result-tab" width="100%">
                <tr>
                    <th>ID</th>
                    <th>分类</th>
                    <th>名称</th>
                    <th>发布人</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                <%
                    request.setCharacterEncoding("utf-8");
                    String keywords = request.getParameter("keywords");
                    int p=1;
                    if(request.getParameter("p")!=null){
                        try{
                            p=Integer.parseInt(request.getParameter("p"));}
                        catch(NumberFormatException e){
                            p=1;
                        }
                    }
                    int pagesize=10;//10行一页
                    int totalpage;//总页数
                    Data data = new Data();
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    String sql2="";
                    if(keywords==null){
                        sql2 = "SELECT count(*) as totalrecord FROM web.catalog";
                    }
                    else sql2 = "SELECT count(*) as totalrecord FROM web.catalog WHERE name like '%"+keywords+"%' or des like '%"+keywords+"%' or user like '%"+keywords+"%' or det like '%"+keywords+"%' ";
                    ResultSet rs=data.exeQ(sql2);
                    rs.next();
                    int totalRows=rs.getInt(1);
                    if(totalRows%pagesize==0){
                        totalpage=totalRows/pagesize;}
                    else{
                        totalpage=totalRows/pagesize+1;
                    }
                    if(p>totalpage)
                        p=totalpage;
                    request.setCharacterEncoding("utf-8");
                    String sql = "";
                    if(keywords==null){
                        sql = "SELECT * FROM web.catalog";
                    }
                    else sql = "SELECT * FROM web.catalog WHERE name like '%"+keywords+"%' or des like '%"+keywords+"%' or user like '%"+keywords+"%' or det like '%"+keywords+"%' ";
                    rs = data.exeQ(sql);
                    rs.absolute((p-1)*pagesize+1);
                    for(int i=0;i<10;i++){
                        if((p-1)*pagesize+1<0)
                            break;
                        out.print("<tr>");
                        out.print("<td>"+rs.getInt(1)+"</td>");
                        out.print("<td>"+rs.getString(2)+"</td>");
                        out.print("<td>"+rs.getString(3)+"</td>");
                        out.print("<td>"+rs.getString(4)+"</td>");
                        out.print("<td>"+rs.getDate(5)+"</td>");
                        out.println("<td><a target=\"iframe\" href=\"detail.jsp?id="+rs.getInt(1)+"\">详情</a>/<a target=\"iframe\" href = \"alter.jsp?id="+rs.getInt(1)+"\">修改</a>/<a target=\"iframe\" href = \"delete.jsp?id="+rs.getInt(1)+"\" onclick=\"if(confirm('确定删除?')==false)return false;\">删除</a></td>");
                        out.println("</tr>");
                        if(!rs.next())
                            break;
                    }
                    data.close();
                %></table>
    <h4 align="center">一共有<%=totalRows %>条 当前<%=p %>页/共<%=totalpage %> 页</h4>
    <%

        if(p==1){
            out.print("<div class=\"list-page\"><a href=table.jsp?p="+(p+1)+">下一页</a>");
            out.print("<a href=table.jsp?p="+totalpage+">尾页</a></div>");
        }
        else if(p==totalpage){
            out.print("<div class=\"list-page\"><a href=table.jsp?p=1>首页</a>");
            out.print("<a href=table.jsp?p="+(p-1)+">上一页</a></div>");
        }
        else{
            out.print("<div class=\"list-page\"><a href=table.jsp?p=1>首页</a>");
            out.print("<a href=table.jsp?p="+(p-1)+">上一页</a>");
            out.print("<a href=table.jsp?p="+(p+1)+">下一页</a>");
            out.print("<a href=table.jsp?p="+totalpage+">尾页</a></div>");
        }

    %>
</div>
    </form>
</div>
</body>
</html>
