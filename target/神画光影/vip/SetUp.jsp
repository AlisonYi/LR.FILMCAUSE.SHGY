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
    <title>个人设置</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>

    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            var checkNameFlag=false;
            var checkPasswordOFlag=false;
            var checkPasswordNFlag=false;
            var nameValue;
            var passwordNValue;
            var email="${cookie.email.value}";
            $("#email").val(email);

            $("#SetUpForm").submit(function (e) {
                if(!(checkPasswordOFlag&&(checkPasswordNFlag||checkNameFlag)&&(nameValue!=""||passwordNValue!="")))  //只有当旧密码正确，设置的名字或密码有一方是对的（有设置不为空）就可以提交，否则组织提交
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
                if(flag&& nameValue.length<=20){
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

            $("#passwordO").blur(function () {
                checkPasswordOFlag=false;
                var value=$(this).val();
                    $.post("${pageContext.request.contextPath}/CheckAccountServlet",{"email":email,"password":value},function (data){
                        if(data.msg=="true")
                            checkPasswordOFlag=true;
                        else
                            checkPasswordOFlag=false;
                },"json");
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
                    if(passwordNValue=="")
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
            height: 25px;
        }
        #main{
            width: 420px;
            margin: 30px auto;
        }
        .Hidden{
            visibility: hidden;

        }
    </style>
</head>
<body>


</form>
<div class="container" id="main">
    <h3 class="text-center">个人设置</h3>
    <form  action="${pageContext.request.contextPath}/Vip/SetUpServlet" method="post" id="SetUpForm">
        <%--        <!-- 隐藏域提交邮箱  -->--%>
                <input type="hidden" name="email" value="${cookie.email.value}" />


        <div class="form-group" id="email-group">
            <label for="email">邮箱：</label>
            <input type="email" name="email" class="col-md-6 form-control" disabled id="email" />
            <div  class="information"></div>
            <div  class="information"></div>
        </div>

        <div class="form-group" id="name-group">
            <label for="name">用户名：</label>
            <input type="text" name="name" class="form-control" id="name" placeholder="请输入用户名,1-20个字符"/>
            <label class="control-label information Hidden" ></label>
            <label id="checkName" class="control-label information " ></label>
        </div>

        <div class="form-group">
            <label for="passwordO">旧密码：</label>
            <input type="password" name="passwordO" class="form-control" id="passwordO" placeholder="请输入原密码"/>
            <div  class="information"></div>
        </div>

            <div class="form-group" id="password-group">
                <label for="passwordN">新密码：</label>
                <input type="password" name="passwordN" class="form-control" id="passwordN" placeholder="请输入密码,6-20个字符/-"/>
                <label id="checkPassword" class="control-label information "></label>
            </div>

        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit"   value="提交">
        </div>
    </form>
</div>

</body>
</html>
