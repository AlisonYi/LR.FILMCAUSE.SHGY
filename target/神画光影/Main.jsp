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
            border: 1px solid black;
            margin: 0 150px;                /*这里的200px是 跟着导航条最左和最右的左右外编剧确定的*/
            padding-top: 21px;
        }

        .wellReceivedAndToday{
            width: 100%;
            height:600px;
        }
        .wellReceived{
            display: inline-block;
            width: 780px;
            border: 1px solid yellow;
        }
        .wellReceived>h2{
            display: inline-block;
            margin-left: 10px;
            margin-bottom: 21px;
            font-size: 26px;;
            font-weight: 400;
            color: #ef4238;
        }
        .wellReceived>a{
            display: inline-block;
            padding-top: 28px;
            padding-right: 30px;
            color: #ef4238;
            font-size: 15px;
            line-height: 16px;
            float: right;

        }
        .today{
            display: inline-block;
            border: 1px solid blue;
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

        .process-wrap {
            width: 100%;
            height: 88px;
            background: url(images/Main/propaganda1.png) center center no-repeat #f4f4f4;
        }

    </style>
</head>
<body>
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
            <a class="navbar-brand" href="" style="margin-left: 200px">神画光影</a>
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
            <form class="navbar-form navbar-left">
                <div class="input-group">
                    <input type="text" class="form-control" style="width: 300px" placeholder="Search for...">
                    <span class="input-group-btn ">
                        <button class="btn btn-default" style="width: 80px" type="button">Go!</button>
                    </span>
                </div><!-- /input-group -->
            </form>

            <ul class="nav navbar-nav navbar-right" style="margin-right: 200px">
                <li><a href="${pageContext.request.contextPath}/vip/Register.jsp" target="_blank">注册</a></li>
                <li><a href="${pageContext.request.contextPath}/vip/Login.jsp" target="_blank">登录</a></li>
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
    <div class="wellReceivedAndToday">
        <div class="wellReceived">
            <h2 >正在热映</h2>
            <a src="" >全部</a>
            <form action="${pageContext.request.contextPath}/FindHotMovieServlet" id="wellReceivedForm" method="get">
                <table class="table table-no-bordered" id="wellReceivedTable">
                    <tr>
                        <c:forEach items="${requestScope.pageBean.list}" var="film" begin="0" end="3" step="1">
                            <td class="oneOfMovie " style="padding: 0">
                                <img src="${pageContext.request.contextPath}${film.post}"  class="movieImg" alt="">
                                <a href="" class="buyBlock">
                                    购票
                                </a>
                            </td>
                        </c:forEach>
                    </tr>
                    <tr>
                        <c:forEach begin="0" end="3" step="1">
                            <td class="oneOfMovie " style="padding: 0">
                                <img src="images/Main/movie1.jpg"  class="movieImg" alt="">
                                <div class="buyBlock">
                                    购票
                                </div>
                            </td>
                        </c:forEach>
                    </tr>
                    <%--   <tr>
                           <c:forEach items="${requestScope.pageBean.list}" var="film" begin="0" end="4" step="1">
                               <td>${adm.id}</td>
                               <td>${adm.name}</td>
                               <td>${adm.email}</td>
                               <td>${adm.rank}</td>
                               <td><a class="btn btn-default btn-sm"
                                      href="${pageContext.request.contextPath}/Ad/SetUpServlet?id=${adm.id}">修改</a>&nbsp;
                                   <a class="btn btn-default btn-sm"
                                      href="${pageContext.request.contextPath}/Ad/DeleteAdministratorServlet?id=${adm.id}">删除</a>
                               </td>
                           </c:forEach>
                       </tr>--%>
                </table>
            </form>

        </div>

        <div class="today">

        </div>
    </div>

    ssss
</div>

<div class="process-wrap">
</div>

</body>
</html>

