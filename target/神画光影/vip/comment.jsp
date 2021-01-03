<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2021/1/1
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评分</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            var checks=false;
            var checkc=false;

            $("form").submit(function (e) {
                  if(!checks||!checkc){
                    alert("评分不合法或影评大于800字");
                    e.preventDefault();
                }
            });

            $("#score").blur(function () {
                checks=false;
                var score=$("#score").val();
                if(score<=10&&score>=1)
                    checks=true;
            });

            $("#comment").blur(function () {
                checkc=false;
                var comment=$("#comment").val();
                if(comment.length<=800)
                    checkc=true;
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
    </style>
</head>
<body>
<div id="main">
    <h3 class="text-center">电影评价</h3>
    <form class="form-horizontal h" action="${pageContext.request.contextPath}/Vip/CommentServlet" method="post">
<%--        隐式获取参数id及eamil 并提交--%>
        <input type="hidden" value="${param.get("id")}" name="id">
    <input type="hidden" value="${cookie.email.value}" name="email">

        <div class="form-group H">
            <label for="score" class="col-md-3 control-label"  >评分</label>
            <div class="col-md-9">
                <input type="number" class=" form-control" name="score" id="score" placeholder="1~10 分">
            </div>

        </div>

        <div class="form-group H">
            <label for="comment" class="col-md-3 control-label">评价</label>

            <div class="col-md-9">
                <input type="text" class="form-control" name="comment" id="comment" placeholder="不超过800字">
            </div>

        </div>

        <div class="form-group H">
            <div class="col-md-offset-5 col-md-7">
                <button type="submit" class="btn btn-default">提交</button>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/MovieServlet?id=${param.get("id")}" role="button">返回</a>
            </div>
        </div>

    </form>


</div>
</body>
</html>
