<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <jsp:include page="/main/top.jsp"></jsp:include>
</div>
<div class="container clearfix" style="display: flex;position: relative;width: 100% ">
    <div class="sidebar-wrap" style="display: flex;flex-direction: column;width: 15%">
        <div class="sidebar-title" style="display: flex;width:100%;text-align: center">
            <h1><span style="text-align: center">菜单</span></h1>
        </div>
        <div class="sidebar-content"style="display: flex;width: 100%;">
            <jsp:include page="/main/left.jsp"></jsp:include>
        </div>
    </div>
    <div  style="width: 85%;display: flex">
        <iframe name="iframe" id="iframePage" src="/database/page.jsp" scrolling="no" style="margin: 0;padding: 0;width: 100%" frameborder="0" ></iframe>
    </div>
</div>
</body>
</html>