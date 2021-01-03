<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2021/1/2
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加电影</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            var filmFlag=false;
            var stateFlag=false;
            var priceFlag=false;
            $("#id").blur(function () {
                filmFlag=false;
                var id=$("#id").val();
                $.post("${pageContext.request.contextPath}/CheckMovieIdServlet",{"id":id},function (data) {
                    if(data.msg=="true")
                        filmFlag=true;
                },"json");
            });

            $("#form").submit(function (e) {
                if(!(filmFlag||stateFlag||priceFlag)){
                    alert("输入不合法");
                    e.preventDefault();
                }
            });

            $("#state").blur(function () {
                stateFlag=false;
                var state=$("#state").val();
                if(state>=-1&&state<=1)
                    stateFlag=true;
            });

            $("#price").blur(function () {
                priceFlag=false;
                var price=$("#price").val();
                if(price>0)
                    priceFlag=true;
            });
        });


    </script>

    <style>
        #main{
            width: 780px;
            margin: 30px auto;
        }
    </style>
</head>
<body>
<div id="main">
    <h3 class="text-center" style="margin-bottom: 30px;">添加电影</h3>
    <form class="form-horizontal"   action="${pageContext.request.contextPath}/Ad/AddMovieServlet" id="form" enctype ="multipart/form-data" method="post">
        <div class="form-group">
            <label for="id" class="col-sm-2 control-label">ID</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="id" name="id">
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">电影名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name">
            </div>
        </div>

        <div class="form-group">
            <label for="actors" class="col-sm-2 control-label">演员</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="actors" name="actors">
            </div>
        </div>

        <div class="form-group">
            <label for="director" class="col-sm-2 control-label">导演</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="director" name="director">
            </div>
        </div>

        <div class="form-group">
            <label for="state" class="col-sm-2 control-label">状态</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="state" placeholder="0待映，1上映，-1下映" name="state">
            </div>
        </div>


        <div class="form-group">
            <label for="price" class="col-sm-2 control-label">票价</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="price" name="price">
            </div>
        </div>

        <div class="form-group">
            <label for="post" class="col-sm-2 control-label">海报上传</label>
            <input type="file" id="post" name="post" accept="image/jpeg" >
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Sign in</button>
                <input class="btn btn-default" type="button" value="返回" onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/Ad/MoviesListServlet'">
            </div>
        </div>
    </form>
</div>
</body>
</html>
