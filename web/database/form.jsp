<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/12/30
  Time: 19:04
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
    <div class="crumb-list"><i class="icon-font"></i><a href="index.html">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">系统设置</span></div>
</div>
<div class="result-wrap">
    <form action="#" method="post" id="myform" name="myform">
        <div class="config-items">
            <div class="config-title">
                <h1><i class="icon-font">&#xe00a;</i>网站信息设置</h1>
            </div>
            <div class="result-content">
                <table width="100%" class="insert-tab">
                    <tbody><tr>
                        <th width="15%"><i class="require-red">*</i>域名：</th>
                        <td><input type="text" id="" value="#" size="85" name="keywords" class="common-text"></td>
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>站点标题：</th>
                        <td><input type="text" id="" value="『前端迷』-专注于前端领域的探索与实践" size="85" name="title" class="common-text"></td>
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>关键字：</th>
                        <td><input type="text" id="" value="前端, 前端设计, 前端开发, 设计, 开发, 前端资源, CSS, JavaScript, Ajax, Html5" size="85" name="keywords" class="common-text"></td>
                    </tr>
                    <tr>
                        <th><i class="require-red">*</i>描述：</th>
                        <td><input type="text" id="" value="『前端迷』，分享前端设计资源和前端开发技术的专业博客！" size="85" name="description" class="common-text"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input type="submit" value="提交" class="btn btn-primary btn6 mr10">
                            <input type="button" value="返回" onClick="history.go(-1)" class="btn btn6">
                        </td>
                    </tr>
                    </tbody></table>
            </div>
        </div>

    </form>
</div>

</body>
</html>
