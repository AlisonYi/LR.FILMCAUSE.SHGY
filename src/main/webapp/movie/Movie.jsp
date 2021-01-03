<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2020/12/31
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影详情</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    .myNavigationBar{
        height: 60px;
        padding-top: 5px;
    }

    .information_background{
        width: 100%;
        height: 380px;
        min-width: 1200px;
        background: #392f59 url(${pageContext.request.contextPath}/images/movie/bk1.png) no-repeat 50%;
        padding-top: 73px;
    }
    .information{
        margin: 0 180px;
        height: calc(380px - 73px);
    }
    .post{
        display: inline-block;

        border: 4px solid white;
        width: 240px;
        height: 330px;
    }
    .information_right{
        display: inline-block;
        margin-left:32px;
        vertical-align:top;
        height: inherit;
        width:620px;
    }
    .information_right_up{
        height: 155px;
        width: 340px;
        font-size: 18px;
    }
    .name{
        color: #fff;
        width: 900px;
        font-size: 26px;
        font-weight: 700;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .actorsAndDirector{
        color: #fff;
        width: 340px;
        font-size: 16px;
        margin-bottom: 14px;
    }
    td{
        border-top: 0 !important;
    }

    .information_right_down{
        width: 100%;
        height:calc(100% - 160px);
    }
    .information_right_down_button{
        display: inline-block;
        vertical-align: top;
        margin-top:36px;
        width: 255px;
    }
    .myBtn{
        display: block;
        width: 100%px;
        height: 38px;
        margin-bottom: 15px;
    }
    .carBtn{
        cursor: pointer;
        background-color: #756189;
        padding-top: 11px;
        text-align: center;
        font-size: 14px;
        line-height: 16px;
        color: #fff;
        border-radius: 2px;
    }

    .information_right_down_scoreAndSum{
        display: inline-block;
        height:100%;
        width:200px;
        margin-left:100px ;
    }
    .information_right_down_scoreAndSum *{
        display: block;
    }
    .information_right_down_scoreAndSum label{
        font-size: 13px;
        color: #fff;
        font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
        margin-bottom: 5px;
    }
    .information_right_down_scoreAndSum span{
        display: block;
        font-family: stonefont;
        font-size: 30px;
        color: #ffc600;
    }

    .commentAndOther{
        margin: 21px 150px;                /*这里的150px是 跟着导航条最左和最右的左右外编剧确定的*/
        padding-top: 21px;
        padding-left: 8px;
    }
    .comments{
        width: 700px;
        /*border:1px solid black ;*/
        position:relative;
    }
    .comments>.F{
        content: " ";
        display: inline-block;
        width: 4px;
        height: 18px;
        margin-right: 6px;
        background-color: #ef4238;
    }
    .comments>h2{
        display: inline-block;
        margin-bottom: 21px;
        font-weight: 400;
        font-size: 18px;
        color: #333;
    }
    .comments>a{
        display: inline-block;
        position:absolute;
        right:10px;
        top:15px;
        font-size: 15px;
        cursor: pointer;
        height: 30px;
        padding: 0 10px;
        border-radius: 15px;
        border: 1px solid #ef4238;
        text-align: center;
        line-height: 30px;
        color: #ef4238;
        text-decoration: none;
        font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
    }

    .person{
        width: 100%;
        height: 50px;
    }
    .comment{
        margin: 11px 21px 0 57px;
        color: #666;
        line-height: 26px;
        font-size: 14px;
        padding-bottom: 13px;
        border-bottom: 1px solid #e5e5e5;
    }

    .person>*{
        font-size: 16px;
        font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
    }
    .person>.vip_name{
        color:#333;
    }
    .person>.time{
        font-size: 15px;
        color: #999;
    }
    .person>.score{
        font-size: 15px;
        color: #ef4238;
    }

</style>
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
<div style="height: 63px"></div>

<div class="information_background">
    <div class="information">
        <%--    ${pageContext.request.contextPath}${requestScope.film.post}--%>
        <img src="${pageContext.request.contextPath}${requestScope.film.post}" alt="" class="post">
        <div class="information_right" >
            <div class="information_right_up">
                <table class="table table-no-bordered " >
                        <tr>
                            <td>
                                <span class="name">${requestScope.film.name}</span>
                            </td>
                        </tr>
                    <tr >
                        <td >
                            <span class="actorsAndDirector">演员：${requestScope.film.actors}</span>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <span class="actorsAndDirector">导演：${requestScope.film.director}</span>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="information_right_down">
                <div class="information_right_down_button">
                    <a href="${pageContext.request.contextPath}/vip/comment.jsp?id=${requestScope.film.id}" role="button" class="btn myBtn carBtn">
                        评分
                    </a>
                    <a href="${pageContext.request.contextPath}/Vip/BookingServlet?id=${requestScope.film.id}&email=${cookie.email.value}" role="button" class="btn btn-danger myBtn">
                        <c:if test="${requestScope.film.state==1}">
                            特惠购票
                        </c:if>
                        <c:if test="${requestScope.film.state==0}">
                            我超期待
                        </c:if>
                    </a>
                </div>
                <div class="information_right_down_scoreAndSum">
                    <label>电影口碑 </label>
                    <span>
                        ${requestScope.film.score} 分
                    </span>
                    <label>
                        <c:if test="${requestScope.film.state==1}">
                            销售票房
                        </c:if>
                        <c:if test="${requestScope.film.state==0}">
                            预售票房
                        </c:if>
                    </label>
                    <span style="color: #fff;">
                        ${requestScope.film.sum} 万
                    </span>
                </div>
            </div>
        </div>
    </div>

    <div class="commentAndOther">
        <div class="comments">
            <div class="F"></div>
            <h2 >影片短评</h2>
            <a href="${pageContext.request.contextPath}/vip/comment.jsp?id=${requestScope.film.id}" >写评价</a>
            <table class="table table-no-bordered">
                    <c:forEach items="${requestScope.score.list}" var="score" begin="0" step="1" end="4" >
                        <tr>
                            <td>
                                <div class="person">
                                    <span class="vip_name">${score.vipName}：</span>
                                   <br>
                                    <span style="visibility: hidden">${score.vipName}</span>

                                    <span class="time">${score.time}</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="score">${score.score} 分</span>
                                </div>
                                <div class="comment">
                                    &nbsp;&nbsp;
                                    ${score.comment}
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
            </table>
        </div>
    </div>


</div>
</body>
</html>
