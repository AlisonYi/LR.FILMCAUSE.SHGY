<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2020/12/29
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>用户登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    #main{
        width: 420px;
        margin: 30px auto;
    }
    .H{
        margin-top: 40px;
    }
</style>
<body>

<div id="main">
    <h3 class="text-center">用户登录</h3>
    <form class="form-horizontal h" action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <div class="form-group H">
            <label for="account" class="col-md-3 control-label"  >Email/name</label>

            <div class="col-md-9">
                <input type="text" class=" form-control" name="account" id="account" placeholder="Email/name">
            </div>

        </div>

        <div class="form-group H">
            <label for="password" class="col-md-3 control-label">Password</label>

            <div class="col-md-9">
                <input type="password" class="form-control" name="password" id="password" placeholder="Password">
            </div>

        </div>

        <div class="form-group H">
            <div class="col-md-offset-5 col-md-7">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
    </form>


</div>

</body>
</html>
