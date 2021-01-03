<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>神画光影</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $(function () {

        <c:if test="${requestScope.ifFirst !='yes'}">
               $("#show").submit();

        </c:if>

    });
</script>
    <style>
        .myNavigationBar{
            height: 60px;
            padding-top: 5px;
        }
        .LBT{
            width: 1420px;
            margin: 0 auto;
        }

        .main {
            /*border: 1px solid black;*/
            margin: 0 150px;                /*这里的150px是 跟着导航条最左和最右的左右外编剧确定的*/
            padding-top: 21px;
        }

        .modelOne{
            width: 100%;
        }
        .modelOne_left{
            display: inline-block;
            width: 780px;
            margin-bottom: 50px;
        }
        .modelOne_left>h2{
            display: inline-block;
            margin-left: 10px;
            margin-bottom: 21px;
            font-size: 26px;;
            font-weight: 400;
            color: #ef4238;
        }
        .modelOne_left>a{
            display: inline-block;
            padding-top: 28px;
            padding-right: 30px;
            color: #ef4238;
            font-size: 15px;
            line-height: 16px;
            float: right;

        }

        .comingSoon>h2,.comingSoon>a{
            color: #2d98f3!important;
        }

        .modelOne_right{
            display: inline-block;
            float: right;
            width: calc(100% - 820px);
        }
        .modelOne_right>h2{
            display: block;
            margin-bottom: 21px;
            color: #ef4238;
            font-size: 26px;
            font-weight: 400;
        }
        .oneOfMovie{
            display: inline-block;
            width: 170px;
            height: 295px;
            margin-right: 10px;
            margin-left:10px;
            border: 1px solid beige;
        }
        .movieImg{
            display: block;
            width: 100%;
            height: 250px;
        }
        .buyBlock{
            display: block;
            padding-top: 10px;
            width: 100%;
            text-align: center;
            color: red;
        }
        .rank{
            color: #ef4238;
            display: inline-block;
            width: 20px;
            font-size: 18px;
            line-height: 35px;
        }
        .name{
            display: inline-block;
            max-width: 190px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-size: 16px;
            color: #333;
            vertical-align: top;
            line-height: 35px;
        }
        .sum{
            display: inline-block;
            color: #ef4238;
            float: right;
            font-size: 14px;
            line-height: 35px;
        }

        .process-wrap {
            width: 100%;
            height: 88px;
            background: url(images/Main/propaganda1.png) center center no-repeat #f4f4f4;
        }

    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/FindDataToMainServlet" id="show"></form>
<%--导航条--%>
<nav class="navbar navbar-default navbar-fixed-top myNavigationBar"  id="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display
            汉堡 -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="margin-left: 200px">神画光影</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">首页 <span class="sr-only">(current)</span></a>
                    </li>
                    <li><a href="#">影片</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">位置 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
<%--                action="${pageContext.request.contextPath}/"--%>
                <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/SearchServlet">
                    <div class="input-group">
                        <input type="text" class="form-control" style="width: 300px" placeholder="Search for..." name="condition">
                        <span class="input-group-btn ">
                        <button class="btn btn-default" style="width: 80px" type="submit">Go!</button>
                    </span>
                    </div><!-- /input-group -->
                </form>

                <ul class="nav navbar-nav navbar-right" style="margin-right: 190px">
                    <li><a href="${pageContext.request.contextPath}/vip/Register.jsp" target="_blank">注册</a></li>
                    <li><a href="${pageContext.request.contextPath}/vip/Login.jsp" target="_blank">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/vip/SetUp.jsp" target="_blank">个人设置</a></li>
                </ul>


            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
<div style="height: 63px"></div>
<%--轮播图--%>
<div id="carousel-example-generic" class="carousel slide LBT" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="images/Main/LBT1.jpg" alt="...">
            <div class="carousel-caption">
                神画光影
            </div>
        </div>
        <div class="item">
            <img src="images/Main/LBT2.jpg" alt="...">
            <div class="carousel-caption">
                LR.Filmcause
            </div>
        </div>
        <div class="item">
            <img src="images/Main/LBT3.jpg" alt="...">
            <div class="carousel-caption">
                广告招租
            </div>
        </div>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<%--主体内容--%>
<div class="main">
    <div class="modelOne">
<%--        热映--%>
        <div class="modelOne_left">
            <h2 >正在热映</h2>
            <a href="${pageContext.request.contextPath}/SearchServlet?state=1" >全部</a>
                <table class="table table-no-bordered" id="wellReceivedTable">
                    <tr>
                        <c:forEach items="${requestScope.pageBeanHotMovie.list}" var="film" begin="0" end="3" step="1">
                            <td class="oneOfMovie " style="padding: 0">
                                <img src="${pageContext.request.contextPath}${film.post}"  class="movieImg" alt="">
                                <a href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}" class="buyBlock">
                                    购票
                                </a>
                            </td>
                        </c:forEach>
                    </tr>
                    <tr style="height: 20px"> </tr>
                    <tr>
                        <c:forEach items="${requestScope.pageBeanHotMovie.list}" var="film" begin="4" end="7" step="1">
                            <td class="oneOfMovie " style="padding: 0">
                                <img src="${pageContext.request.contextPath}${film.post}"  class="movieImg" alt="">
                                <a href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}" class="buyBlock">
                                    购票
                                </a>
                            </td>
                        </c:forEach>
                    </tr>
                </table>
        </div>
<%--        票房排行--%>
        <div class="modelOne_right">
                <h2>销售票房</h2>
                <table class="table table-no-bordered table-hover" id="BoxOfficeTable">
                    <c:forEach items="${requestScope.pageBeanBoxOfficeMovie.list}" var="film" begin="0" end="4" step="1" varStatus="i">
                        <tr >
                            <td style="border-top: 0">
                                <a style="display: block" href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}">
                                    <span class="rank"> ${i.index+1}</span>
                                    <span class="name">${film.name}</span>
                                    <span class="sum">${film.sum} 万</span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
    </div>

    <div class="modelOne">
<%--        待映--%>
        <div class="modelOne_left comingSoon">
            <h2 >即将上映</h2>
            <a href="${pageContext.request.contextPath}/SearchServlet?state=0" >全部</a>
                <table class="table table-no-bordered" id="comeSoonTable">
                    <tr>
                        <c:forEach items="${requestScope.pageBeanComingSoonMovie.list}" var="film" begin="0" end="3" step="1">
                            <td class="oneOfMovie " style="padding: 0">
                                <img src="${pageContext.request.contextPath}${film.post}"  class="movieImg" alt="">
                                <a href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}" class="buyBlock">
                                    预览
                                </a>
                            </td>
                        </c:forEach>
                    </tr>
                    <tr style="height: 20px"> </tr>
                    <tr>
                        <c:forEach items="${requestScope.pageBeanComingSoonMovie.list}" var="film" begin="4" end="7" step="1">
                            <td class="oneOfMovie " style="padding: 0">
                                <img src="${pageContext.request.contextPath}${film.post}"  class="movieImg" alt="">
                                <a href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}" class="buyBlock">
                                    预览
                                </a>
                            </td>
                        </c:forEach>
                    </tr>

                </table>
        </div>
<%--        预售票房--%>
        <div class="modelOne_right">
            <h2>预售票房</h2>
            <table class="table table-no-bordered table-hover" id="MostExceptedTable">
                <c:forEach items="${requestScope.pageBeanMostExpectMovie.list}" var="film" begin="0" end="4" step="1" varStatus="i">
                        <tr>
                            <td style="border-top: 0">
                                <a style="display: block" href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}">
                                    <span class="rank"> ${i.index+1}</span>
                                    <span class="name">${film.name}</span>
                                    <span class="sum">${film.sum} 万</span>
                                </a>
                            </td>
                        </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</div>

</body>
</html>

