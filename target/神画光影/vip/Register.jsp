<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2019/11/30
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>用户注册</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

     <script>
      $(function () {
          var checkNameFlag=false;
          var checkEmailFlag=false;
          var checkPasswordFlag=false;
          var checkCheckCodeFlag=false;
          var returnCodeValue=0;
          var returnEmailValue;
          var    emailValue;
          $("#getCheckCode").click(function () {
              if(checkEmailFlag){
                  $.post("${pageContext.request.contextPath}/GetCheckCodeServlet",{email:emailValue},function (data) {
                      returnCodeValue=data.code;
                      returnEmailValue=data.email;
                  },"json");
              }
          });

          $("#password").blur(function() {
              checkPasswordFlag=false;              //默认为false，只有当所有过滤条件都通过时才为true
              var password_group=$("#password-group");
              var checkPasswordInfo = $("#checkPassword");
              //获取输入的纸
              var value=$(this).val();
              var mo_password=/^[a-zA-Z0-9_-]{6,20}$/;
              var flag=mo_password.test(value);
              if(flag&&value.length<=20&&value.length>=6){
                  password_group.removeClass("has-error");
                  password_group.addClass("has-success");
                  checkPasswordInfo.html("密码合法");
                          checkPasswordFlag=true;
              }else{
                  checkPasswordInfo.html("密码不合法");
                  checkPasswordInfo.removeClass("Hidden");
                  password_group.addClass("has-error");
              }
          });
          $("#name").blur(function() {
              checkNameFlag=false;              //默认为false，只有当所有过滤条件都通过时才为true
              var name_group=$("#name-group");
              var checkNameInfo = $("#checkName");
              //获取输入的纸
              var value=$(this).val();
              var mo_name=/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;  //含中文、1-20个字符。
              var flag=mo_name.test(value);                     //正则校验
              if(flag&& value.length<=20){
                  $.post("${pageContext.request.contextPath}/CheckNameServlet",{name:value},function (data){
                      checkNameInfo.removeClass("Hidden");
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
                  checkNameInfo.html("用户名不合法");
                  checkNameInfo.removeClass("Hidden");
                  name_group.addClass("has-error");
              }
          });
          $("#email").blur(function() {
             checkEmailFlag=false;              //默认为false，只有当所有过滤条件都通过时才为true
              var email_group=$("#email-group");
              var checkEmailInfo = $("#checkEmail");
              //获取输入的纸
                  emailValue=$(this).val();
              var mo_email=/^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*\.[a-z]{2,}$/;
              var flag=mo_email.test(emailValue);                     //正则校验
              if(flag){
                  $.post("${pageContext.request.contextPath}/CheckEmailServlet",{email:emailValue},function (data){
                      checkEmailInfo.removeClass("Hidden");
                        if(data.msg =="fail"){
                            email_group.addClass("has-error");
                            checkEmailInfo.html(data.info);
                        }else{
                            email_group.removeClass("has-error");
                            email_group.addClass("has-success");
                            checkEmailInfo.html(data.info);
                            checkEmailFlag=true;
                        }
                    },"json");          //jason为接收到的响应数据的格式
                }else{
                  checkEmailInfo.html("邮箱不合法");
                  checkEmailInfo.removeClass("Hidden");
                   email_group.addClass("has-error");
                }
            });

          function checkCheckCode(){
              //默认为false，只有当所有过滤条件都通过时才为true
              //获取输入的纸
             var value=$(this).val();
              if(returnCodeValue==value&&emailValue==returnEmailValue&&returnCodeValue!=0){
                  checkCheckCodeFlag=true;
                          return true;
              }else{
                  checkCheckCodeFlag=false;
                  alert("验证码错误或邮箱已更改");
                  return false;
              }
          }

          $("#VipRegisterForm").submit(function (e) {
              //验证验证码
              checkCheckCodeFlag=false;
              var value=$("#checkCode").val();
              var emailV=$("#email").val();
              alert(emailV==returnEmailValue);
              if(value!=""&&returnCodeValue==value&&emailV==returnEmailValue){
                  checkCheckCodeFlag=true;
              }else{
                  alert("mismatching");
                  checkCheckCodeFlag=false;
              }


              if(!(checkEmailFlag&&checkNameFlag&&checkPasswordFlag&&checkCheckCodeFlag))
                  e.preventDefault();
          });
        });
    </script>
    <style>
        .information{
            display: block;
            margin-top: 8px;
            height: 18px;
        }
        .Hidden{
            visibility: hidden;
        }
        #main{
            width: 420px;
            margin: 30px auto;
        }
    </style>
</head>
<body>
<div class="container" id="main">
    <h3 class="text-center">用户注册</h3>
    <form action="${pageContext.request.contextPath}/VipRegisterServlet" method="post" id="VipRegisterForm" >
<%--        <!-- 隐藏域提交邮箱密码  -->--%>
<%--        <input type="hidden" name="email" value="${user.pnum}">--%>
<%--        <input type="hidden" name="password" value="${user.password}">--%>

    <div class="form-group" id="email-group">
        <label for="email">邮箱：</label>
        <div class="form-inline row " style="margin:0;">
            <input type="email" name="email" class="col-md-6 form-control" id="email" placeholder="请输入邮箱"/>
            <button class="pull-right btn btn-default" type="button" id="getCheckCode">获取验证码</button>
        </div>
            <label id="checkEmail" class="control-label Hidden information"></label>
    </div>


        <div class="form-group" id="name-group">
            <label for="name">用户名：</label>
            <input type="text" name="name" class="form-control" id="name" placeholder="请输入用户名,1-20个字符"/>
            <label id="checkName" class="control-label Hidden information"></label>
        </div>


        <div class="form-group" id="password-group">
            <label for="password">密码：</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码,6-20个字符/-"/>
            <label id="checkPassword" class="control-label Hidden information"></label>
        </div>

    <div class="form-group" id="checkCode-group">
        <label for="checkCode">验证码：</label>
        <input type="text" name="checkCode" class="form-control" id="checkCode" placeholder="请输入验证码"/>
        <label id="checkCheckCode" class="control-label Hidden information"></label>
    </div>

        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit"   value="提交">
        </div>
    </form>
</div>
</body>
</html>