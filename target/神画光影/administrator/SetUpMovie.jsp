<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2021/1/1
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>电影修改</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(function () {



        $ ("#id").val("${requestScope.film.id}");
        $ ("#name").val("${requestScope.film.name}");
        $ ("#actors").val("${requestScope.film.actors}");
        $ ("#director").val("${requestScope.film.director}");
        $ ("#score").val("${requestScope.film.score}");
        $ ("#sellOrExpectSum").val("${requestScope.sellOrExpectSum}");
        $ ("#sum").val("${requestScope.film.sum}");
        $("#price").attr("placeholder","${requestScope.film.price}");

        var checkState=false;
        var checkPrice=false;
        var state, price;
        $("#form").submit(function (e) {
            if(state==""&&price=="") {
                alert("填写不合法1");
                e.preventDefault();
            }else if(!checkState||!checkPrice){
                alert("填写不合法");
                e.preventDefault();
            }
        });

        $("#price").blur(function () {
            checkPrice=false;
             price=$("#price").val();
            if(price>0)
                checkPrice=true;
            else if(price=="")
                checkPrice=true;
        });

        $("#state").blur(function () {
            checkState=false;
             state=$("#state").val();
            if(state<=1&&state>=-1)
                checkState=true;
            else if(state=="")
                checkState=true;
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
        <h3 class="text-center" style="margin-bottom: 30px;">电影修改</h3>
        <form class="form-horizontal"   action="${pageContext.request.contextPath}/Ad/UpDateMovieServlet" id="form">
            <%--        <!-- 隐藏域提交id ,disable的值不会提交好像，所以要自己在提交一个 -->--%>
            <input type="hidden" name="id" value="${requestScope.film.id}" />

            <div class="form-group">
                <label for="id" class="col-sm-2 control-label">ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="id" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">电影名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="actors" class="col-sm-2 control-label">演员</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="actors" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="director" class="col-sm-2 control-label">导演</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="director" disabled >
                </div>
            </div>

            <div class="form-group">
                <label for="state" class="col-sm-2 control-label">状态</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="state" placeholder="0待映，1上映，-1下映" name="state">
                </div>
            </div>

            <div class="form-group">
                <label for="score" class="col-sm-2 control-label">评分</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="score" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="price" class="col-sm-2 control-label">票价</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="price" name="price">
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">
                    <c:if test="${requestScope.film.state==0}">
                        预售量
                    </c:if>
                    <c:if test="${requestScope.film.state!=0}">
                        销售量
                    </c:if>
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="sellOrExpectSum" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="price" class="col-sm-2 control-label" disabled>票房</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="sum" disabled>
                </div>
            </div>

            <div class="form-group">
                <div >
                    <button type="submit" class="btn btn-default col-md-offset-3 col-md-2">提交</button>
                    <input class="btn btn-default col-md-offset-3 col-md-2" type="button" value="返回" onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/Ad/MoviesListServlet'">
                </div>
            </div>
        </form>
    </div>
</body>
</html>
