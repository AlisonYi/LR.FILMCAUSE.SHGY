<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2020/12/29
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
    $(function () {
        var checkAccount=false;
        var checkPassword=false;
        $("#AdmLogin").submit(function (e) {
             if(!(checkPassword&&checkAccount)){
                 e.preventDefault();
                 alert("用户名或密码不合法")
             }
        });

        $("#account").blur(function () {
            checkAccount=false;
            var tipsAccount=$("#tipsAccount");
            //获取输入的纸
            var value=$(this).val();
            var mo_account=/^\d{1,}$/;
            var flag=mo_account.test(value);
            if(flag){                           //正则判断是不是纯数字，因为id是数字，如果不是会转换报错
                checkAccount=true;
            }
        });

        $("#password").blur(function () {
            checkPassword=false;
            var tipsPassword=$("#tipsPassword");
            //获取输入的纸
            var value=$(this).val();
            if(value!=""){
                checkPassword=true;
            }
        });
    });
</script>
<style>
    #main{
        width: 420px;
        margin: 30px auto;
    }
    .H{
        margin-top: 40px;
    }
    .information{
        display: block;
        margin-top: 8px;
        height: 18px;
    }
</style>
<body>

<div id="main">
    <h3 class="text-center">管理员登录</h3>
    <form class="form-horizontal H" action="${pageContext.request.contextPath}/LoginServlet" method="post" id="AdmLogin">
        <div class="form-group ">
            <label for="account" class="col-md-3 control-label"  >Your ID</label>
            <div class="col-md-9">
                <input type="text" class=" form-control" name="account" id="account" placeholder="ID">
            </div>
        </div>

        <div class="form-group ">
            <label for="password" class="col-md-3 control-label">Password</label>

            <div class="col-md-9">
                <input type="password" class="form-control" name="password" id="password" placeholder="Password">
            </div>
        </div>

        <div class="form-group ">
            <div class="col-md-offset-5 col-md-7">
                <button type="submit" class="btn btn-default">Login</button>
            </div>
        </div>
    </form>


</div>

</body>
</html>
