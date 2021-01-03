<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2021/1/2
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索结果</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
    a{
        text-decoration : none !important;
    }
    .main {
        /*border: 1px solid black;*/
        margin: 0 211px;                /*这里的150px是 跟着导航条最左和最右的左右外编剧确定的*/
        padding-top: 21px;
    }
    .searchBox{
        width: 100%;
        min-width: 1200px;
        background: #47464a;
        height: 100px;
    }
    .movie{
        width:460px;
        height:220px;
        margin:40px 0 0 30px;
    }
    .movieImg{
         display: inline-block;
         width:160px;
         height: 100%;
     }
    .movie_info{
        vertical-align: top;
        display: inline-block;
        width:calc(460px - 170px);
        height: 100%;
        padding-left:21px;
    }
    .name{
        margin:  27px 0 11px 0;
        width:100%;
        /*text-align: center;*/
        /*dispay: block;*/
        font-size: 26px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .score{
        width: 100%;
        margin-bottom: 13px;
        color: #ffb400;
        height: 31px;
        line-height: 31px;
        font-size: 26px;
    }
    .actorsAndDirector{
        font-size: 16px;
        color: #333;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        padding: 2px 0;
    }
    .guess{
        padding: 2px;
        color: #999;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        font-size: 14px;
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

            <ul class="nav navbar-nav navbar-right" style="margin-right: 200px">
                <li><a href="${pageContext.request.contextPath}/vip/Register.jsp" target="_blank">注册</a></li>
                <li><a href="${pageContext.request.contextPath}/vip/Login.jsp" target="_blank">登录</a></li>
            </ul>


        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="searchBox">

</div>
<div class="main">
    <h2 style="color:#ef4238">搜索结果</h2>
    <table class="table table-no-bordered" id="wellReceivedTable">
<%--        双重循环：每打印2列就换一行 --%>
    <c:forEach begin="0" end="${requestScope.pageBean.searchRows-1}"  step="1"  varStatus="i">
    <tr>
      <c:forEach  begin="${(i.index)*2}" end="${(i.index)*2+1}" items="${requestScope.pageBean.list}" var="film" varStatus="s" step="1">
            <td style="padding: 0 ;border:0">
                <div class="movie">
                    <a href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}"><img src="${pageContext.request.contextPath}${film.post}"  class="movieImg" alt=""></a>
                    <div class="movie_info">
                        <div class="name"><a href="${pageContext.request.contextPath}/MovieServlet?id=${film.id}">${film.name}</a>  </div>
                        <div class="score">${film.score}</div>
                        <div class="actorsAndDirector">${film.actors}</div>
                        <div class="actorsAndDirector">${film.director}</div>
                        <div class="guess">猜你想搜</div>
                    </div>
                </div>
            </td>
      </c:forEach>
    </tr>
</c:forEach>

    </table>
</div>

</body>
</html>
