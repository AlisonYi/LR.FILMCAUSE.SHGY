<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2021/1/1
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主界面</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        body{
            text-align: center;
        }
        div{
            margin-top: 56px;
        }
        a{
            text-decoration : none !important;
        }
    </style>
</head>
<body>
<h1>  管理员主界面</h1>
<div>

    <h2><a href="${pageContext.request.contextPath}/Ad/AdministratorsListServlet" target="_blank">< 管理管理员</a></h2>
    <h2><a href="${pageContext.request.contextPath}/Ad/MoviesListServlet" target="_blank">管理电影 ></a></h2>
</div>

</body>
</html>
