<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alison易
  Date: 2020/12/30
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理管理员</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            //删除选中
            $("#DeSelect").click(function () {
                if (confirm("宁确定要删除选中吗？？？")) {
                    //还要判断选择是否为空
                    var ids=$("[name='check']");
                    var j;
                    for(j=0;j<ids.length;j++){
                        if(ids[j].checked)
                            break;
                    }
                    if(j <ids.length){                //如果j<数组的长度，就说明又人被选中，所以退出了循环，所以选择不是空的，可以提交表单
                        $("#DeSelectForm").submit()
                    }
                }
            });
                //全选
            $("#SelectAll").click(function(){
                //获取系列表所有的pnum
                var checks=$("[name='check']");
                for(var i=0;i<checks.length;i++){
                    checks[i].checked=this.checked;         //所有的checked属性都跟头走
                }
            });
        });
    </script>

    <style>
        td, th {
            text-align: center;
        }

        .bot2 {
            float: right;
            margin: 5px;
        }

        .bot1 {
            float: left;
        }

        #font {
            font-size: 23px;
            margin-left: 13px;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">管理员信息列表</h3>

    <div class="bot1">
        <form class="form-inline" action="${pageContext.request.contextPath}/Ad/FindAdministratorByPageServlet" method="get">
            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" class="form-control" name="id" id="id" placeholder="123" value="${requestScope.condition.id[0]}">   <!-- 因为是一个数组所以要写【0】-->
            </div>
            <div class="form-group">
                <label for="name">昵称</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Jane Doe" value="${requestScope.condition.name[0]}">
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="jane.doe@example.com" value="${requestScope.condition.email[0]}">
            </div>
            <div class="form-group">
                <label for="rank">等级</label>
                <input type="text" class="form-control" name="rank" id="rank" placeholder="5" value="${requestScope.condition.rank[0]}">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div class="bot2">
        <a class="btn btn-primary"
           href="${pageContext.request.contextPath}/administrator/AddAdministrator.jsp">添加管理员</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="DeSelect">删除选中</a>
    </div>

    <div>
        <form id="DeSelectForm" action="${pageContext.request.contextPath}/Ad/DeleteAdministratorServlet" method="post">
            <table border="1" class="table table-bordered table-hover">
                <tr class="success">
                    <th><input type="checkbox"  id="SelectAll"></th>
                    <th>ID</th>
                    <th>昵称</th>
                    <th>邮箱</th>
                    <th>等级</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.pageBean.list}" var="adm" varStatus="s">
                    <tr>
                        <td><input type="checkbox" name="check" value="${adm.id}"></td>
                        <td>${adm.id}</td>
                        <td>${adm.name}</td>
                        <td>${adm.email}</td>
                        <td>${adm.rank}</td>
                        <td><a class="btn btn-default btn-sm"
                               href="${pageContext.request.contextPath}/Ad/SetUpServlet?id=${adm.id}">修改</a>&nbsp;
                            <a class="btn btn-default btn-sm"
                               href="${pageContext.request.contextPath}/Ad/DeleteAdministratorServlet?id=${adm.id}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>

    <%-- 分页条  --%>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <%--判断是不是第一页，是第一页就不能再减了(也就是不变)，不是就可以 --%>
                <c:if test="${requestScope.pageBean.currentPage==1}">
                    <li class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.pageBean.currentPage!=1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/Ad/FindAdministratorByPageServlet?rows=${requestScope.STABLE_ROW}&currentPage=${requestScope.pageBean.currentPage-1}&id=${requestScope.condition.id[0]}&name=${requestScope.condition.name[0]}&email=${requestScope.condition.email[0]}&rank=${requestScope.condition.rank[0]}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <%--中间的分页条    --%>
                <c:forEach begin="1" end="${requestScope.pageBean.totalPage}" var="i" step="1">
                    <c:if test="${requestScope.pageBean.currentPage!=i}">
                        <li><a href="${pageContext.request.contextPath}/Ad/FindAdministratorByPageServlet?rows=${requestScope.STABLE_ROW}&currentPage=${i}&id=${requestScope.condition.id[0]}&name=${requestScope.condition.name[0]}&email=${requestScope.condition.email[0]}&rank=${requestScope.condition.rank[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${requestScope.pageBean.currentPage==i}">
                        <li class="active"><a href="javascript:void(0);">${i}</a></li>
                    </c:if>
                </c:forEach>

                <%--判断是不是最后，是就不能再加了(也就是不变)，不是就可以 --%>
                <c:if test="${requestScope.pageBean.currentPage==requestScope.pageBean.totalPage}">
                    <li class="disabled">
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.pageBean.currentPage!=requestScope.pageBean.totalPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/Ad/FindAdministratorByPageServlet?rows=${requestScope.STABLE_ROW}&currentPage=${requestScope.pageBean.currentPage+1}&id=${requestScope.condition.id[0]}&name=${requestScope.condition.name[0]}&email=${requestScope.condition.email[0]}&rank=${requestScope.condition.rank[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <span id="font">
                       共${requestScope.pageBean.totalCount}条记录，共${requestScope.pageBean.totalPage}页
                    </span>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
