<%--
  Created by IntelliJ IDEA.
  User: lonecloud
  Date: 17/4/30
  Time: 下午5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="commons/common.jsp" %>
<html>
<head>
    <title>员工列表界面</title>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--显示按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>id</th>
                    <th>名字</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>开发部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.sex=='M'?"男":"女"}</td>
                        <td>${user.email}</td>
                        <td>${user.department.name}</td>
                        <td>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示数量--%>
    <div class="row">
        <%--文字信息--%>
        <div class="col-md-4">
            当前${pageInfo.pageNum}页,总${pageInfo.pages }页,总共${pageInfo.total}条记录
        </div>
        <%--分页条--%>
        <div class="col-md-8">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${ctx}/list?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${ctx}/list?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                        <c:if test="${pageInfo.pageNum==num}">
                            <li class="active"><a href="${ctx}/list?pn=${num}">${num}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=num}">
                            <li><a href="${ctx}/list?pn=${num}">${num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${ctx}/list?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${ctx}/list?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
