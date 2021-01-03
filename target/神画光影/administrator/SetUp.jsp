<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2020/12/29
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设置</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            var checkNameFlag=false;
            var checkPasswordNFlag=false;
            var nameValue;
            var passwordNValue;
            $("#id").val("${requestScope.id}");
            $("#rank").val("${requestScope.rank}");
            $("#email").val("${requestScope.adEmail}");

            $("#SetUpForm").submit(function (e) {
                if(!((checkPasswordNFlag&&nameValue!="")||(checkNameFlag&&passwordNValue!=""))) //设置的名字或密码有一方是对的（有设置不为空）就可以提交，否则组织提交
                    e.preventDefault();
            });

            $("#name").blur(function() {
                checkNameFlag=false;                                  //默认为false，只有当所有过滤条件都通过时才为true
                var name_group=$("#name-group");
                var checkNameInfo = $("#checkName");
                //获取输入的纸
                 nameValue=$(this).val();
                var mo_name=/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;  //含中文、1-20个字符。
                var flag=mo_name.test(nameValue);                     //正则校验
                if(flag&& value.length<=20){
                    $.post("${pageContext.request.contextPath}/checkNameServlet",{name:nameValue},function (data){
                        if(data.msg =="fail"){
                            name_group.addClass("has-error");
                            checkNameInfo.html(data.info);
                        }else{
                            name_group.removeClass("has-error");
                            name_group.addClass("has-success");
                            checkNameInfo.html(data.info);
                            checkNameFlag=true;
                        }
                    },"json");          //jason为接收到的响应数据的格式
                }else{
                    if(nameValue=="")
                        checkNameFlag=true;
                    else{
                        checkNameInfo.html("用户名不合法");
                        name_group.addClass("has-error");
                    }
                }
            });

            $("#passwordN").blur(function() {
                checkPasswordNFlag=false;              //默认为false，只有当所有过滤条件都通过时才为true
                var password_group=$("#password-group");
                var checkPasswordInfo = $("#checkPassword");
                //获取输入的纸
                 passwordNValue=$(this).val();
                var mo_password=/^[a-zA-Z0-9_-]{6,20}$/;
                var flag=mo_password.test(passwordNValue);
                if(flag&&passwordNValue.length<=20&&passwordNValue.length>=6){
                    password_group.removeClass("has-error");
                    password_group.addClass("has-success");
                    checkPasswordInfo.html("密码合法");
                    checkPasswordNFlag=true;
                }else{
                    if(passwordNValue!=null&&passwordNValue=="")
                        checkPasswordNFlag=true;
                    else{
                        checkPasswordInfo.html("密码不合法");
                        password_group.addClass("has-error");
                    }
                }
            });
        });
    </script>

    <style>
        .information{
            display: block;
            margin-top: 8px;
            height: 20px;
        }
        #main{
            width: 420px;
            margin: 30px auto;
        }
    </style>
</head>
<body>


</form>
<div class="container" id="main">
    <h3 class="text-center">个人设置</h3>
    <form  action="${pageContext.request.contextPath}/Ad/UpdateServlet" method="post" id="SetUpForm">
        <%--        <!-- 隐藏域提交id  -->--%>
                <input type="hidden" name="id" value="${requestScope.id}" />

            <div class="form-group" id="email-group">
                <label for="id">ID：</label>
                <input type="text" name="id" class="col-md-6 form-control" disabled id="id" />
                <div  class="information"></div>
                <div  class="information"></div>
            </div>

        <div class="form-group" id="email-group">
            <label for="email">邮箱：</label>
            <input type="email" name="email" class="col-md-6 form-control" disabled id="email" />
            <div  class="information " ></div>
        </div>

        <div class="form-group" id="name-group">
            <label for="name">昵称：</label>
            <input type="text" name="name" class="form-control" id="name" placeholder="请输入昵称,1-20个字符"/>
            <label id="checkName" class="control-label information " ></label>
        </div>

            <div class="form-group" id="password-group">
                <label for="passwordN">新密码：</label>
                <input type="password" name="passwordN" class="form-control" id="passwordN" placeholder="请输入密码,6-20个字符/-"/>
                <label id="checkPassword" class="control-label information "></label>
            </div>

            <div class="form-group" id="email-group">
                <label for="rank">等级：</label>
                <input type="text" name="rank" class="col-md-6 form-control" disabled id="rank" />
                <div  class="information"></div>
                <div  class="information"></div>
            </div>

        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit"   value="提交">
            <input class="btn btn-default" type="button" value="返回" onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/Ad/AdministratorsListServlet'">
        </div>
    </form>
</div>

</body>
</html>
