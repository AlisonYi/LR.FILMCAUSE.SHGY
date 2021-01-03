<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2020/12/30
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加管理员</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>

    $(function () {
        var checkName=false;
        var checkPassword=false;
        var checkEmail=false;

        $("#addForm").submit(function () {
            return checkName&&checkPassword&&checkEmail;
        });

        //验证邮箱
        $("#email").blur(function() {
            checkEmail=false;
            //获取输入的纸
            var value=$(this).val();
            var tipsEmail=$("#tipsEmail");
            if(value=="")
                return;
            //判断邮箱是否合法,管理员输入的就不验证是否合法了，让type=email自己验证
                //发送ajax请求判断邮箱是否唯一，返回数据格式:{"PnumExit":true,"msg":"此邮箱太受欢迎，请换一个"}
                //{"PnumExit":false,"msg":"此邮箱可用"}
                $.post("${pageContext.request.contextPath}/CheckEmailServlet",{"email":value},function (data) {
                    if(data.msg=="success"){
                        tipsEmail.css("color","green");
                        tipsEmail.html(data.info);
                        checkEmail=true;
                    }else{
                        tipsEmail.css("color","red");
                        tipsEmail.html(data.info);
                    }
                },"json");
            });

        //验证name
        $("#name").blur(function() {
            checkName=false;
            //获取输入的纸
            var value=$(this).val();
            var mo_name=/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;  //含中文、1-20个字符。
            var flag=mo_name.test(value);
            var tipsName = $("#tipsName");
            if(flag){
                $.post("${pageContext.request.contextPath}/CheckNameServlet",{"name":value},function (data) {
                    if(data.msg=="success"){
                        tipsName.css("color","green");
                        tipsName.html(data.msg);
                        checkName=true;
                    }else{
                        tipsName.css("color","red");
                        tipsName.html(data.msg);
                    }
                },"json");
            }else{
                tipsName.css("color","red");
                tipsName.html("宁输入的名字不合法呢");
            }
        });

        //验证密码
        $("#password").blur(function() {
            checkPassword=false;
            var value=$(this).val();
            var mo_password=/^[a-zA-Z0-9_-]{6,20}$/;
            var flag=mo_password.test(value);
            var tipsPassword = $("#tipsPassword");
            if(flag){
                tipsPassword.css("color","green");
                tipsPassword.html("密码可用");
                checkPassword=true;
            }else{
                tipsPassword.css("color","red");
                tipsPassword.html("密码不合法");
            }
        });

        //重置的画，要把所有的判断条件置为false，并且把提示清空
        $("#reset").click(function () {
           checkName=false;
           checkPassword=false;
           checkEmail=false;
           $("#tipsPassword").html("");
            $("#tipsPassword").html("");
            $("#tipsPassword").html("");
        });
    });
</script>
    <style>
        .information{
            height: 18px;
        }
    </style>
</head>

<body>
<div class="container" style="width: 520px">
    <h3 style="text-align: center">添加管理员表</h3>

    <form action="${pageContext.request.contextPath}/Ad/AddAdministratorServlet" method="post" id="addForm">
        <div class="form-group">
            <label for="name">昵称：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入昵称">
        </div>
        <div class="information" id="tipsName"></div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
        </div>
        <div class="information" id="tipsPassword"></div>

        <div class="form-group">
            <label for="email">邮箱：</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱地址"/>
        </div>
        <div id="tipsEmail" class="information"></div>

        <div class="form-group">
            <label for="rank">等级：</label>
            <input type="number" class="form-control" id="rank" name="rank" placeholder="请输入等级"/>
        </div>

        <div  class="information"></div>
        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" type="reset" value="重置" id="reset"/>
            <input class="btn btn-default" type="button" value="返回" onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/Ad/AdministratorsListServlet'">

        </div>
    </form>
</div>
</body>
</html>
