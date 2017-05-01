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
                <tbody class="user-table">
                </tbody>
            </table>
        </div>
    </div>
    <%--显示数量--%>
    <div class="row">
        <%--文字信息--%>
        <div class="col-md-4" id="page_info">

        </div>
        <%--分页条--%>
        <div class="col-md-8">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    $(
            function () {
                toPage(1);

                function toPage(pageNum) {
                    $.ajax({
                        url: "${ctx}/users",
                        data: {
                            pn: pageNum
                        },
                        type: "POST",
                        success: function (msg) {
                            //
                            //alert("success");
                            build_users_table(msg.data);
                            build_page_info(msg.data);
                            build_page_nav(msg.data);
                        },
                        error: function () {
                            alert("失败");
                        }
                    })
                }

                /**
                 * 构建表格
                 * @param data
                 */
                function build_users_table(data) {
                    //清除数据
                    var $table = $(".user-table");
                    $table.empty();
                    //获取用户信息
                    var users = data.pageInfo.list;
                    $.each(users, function (index, user) {
                        var userId = $("<td></td>").append(user.id);
                        var userName = $("<td></td>").append(user.name);
                        var userSex = $("<td></td>").append(user.sex == 'M' ? "男" : "女");
                        var userEmail = $("<td></td>").append(user.email);
                        var userDept = $("<td></td>").append(user.department);
                        var editTr = $("<td></td>").append(
                                $("<button></button>").addClass("btn btn-primary btn-sm").append(
                                        $("<span></span>").addClass("glyphicon glyphicon-pencil")
                                ).append("编辑  ")
                        ).append(
                                $("<button></button>").addClass("btn btn-danger btn-sm").append(
                                        $("<span></span>").addClass("glyphicon glyphicon-trash")
                                ).append("删除  ")
                        )
                        $("<tr><tr/>").append(userId).append(userName).append(userSex).append(userEmail).append(userDept).append(editTr).appendTo($table);

                    });
                }

                /**
                 * 构建表格信息
                 * @param data
                 */
                function build_page_info(data) {
                    $("#page_info").empty().append("当前" + data.pageInfo.pageNum +
                            "页,总" + data.pageInfo.pages +
                            "页,总共" + data.pageInfo.total +
                            "条记录")
                }

//        <li><a href="">首页</a></li>
//                <li>
//                <a href="" aria-label="Previous">
//                <span aria-hidden="true">&laquo;</span>
//        </a>
//        </li>
//        <li class="active"><a href=""></a></li>
//                <li><a href=""></a></li>
//                <li>
//                <a href="" aria-label="Next">
//                <span aria-hidden="true">&raquo;</span>
//        </a>
//        </li>
//        <li><a href="">末页</a></li>
                /**
                 *构建表格底部分页栏
                 * @param data
                 */
                function build_page_nav(data) {
                    var $nav = $(".pagination");
                    $nav.empty();//清空数据
                    var first = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
                    var last = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
                    var previous = $("<li></li>").append($("<a></a>").append($("<span></span>").append("<<")).attr("href", "#"));
                    var next = $("<li></li>").append($("<a></a>").append($("<span></span>").append(">>")).attr("href", "#"));
                    if (data.pageInfo.hasPreviousPage == false) {
                        first.addClass("disabled");
                        previous.addClass("disabled");
                    }else{
                        first.click(function () {
                            toPage(1);
                        });
                        previous.click(function () {
                            toPage(data.pageInfo.prePage);
                        })
                    }
                    if (data.pageInfo.hasNextPage == false) {
                        last.addClass("disabled");
                        next.addClass("disabled");
                    }else{
                        last.click(function () {
                            toPage(data.pageInfo.pages);
                        });
                        next.click(function () {
                            toPage(data.pageInfo.nextPage)
                        });
                    }
                    $nav.append(first).append(previous);
                    $.each(data.pageInfo.navigatepageNums, function (index, num) {
                        var indexBlock = $("<li></li>").append($("<a></a>").append(num).attr("href", "#"));
                        //判断是不是当前页
                        if (num  == data.pageInfo.pageNum) {
                            indexBlock.addClass("active");
                        }
                        indexBlock.click(function () {
                            toPage(num);
                        });
                        indexBlock.appendTo($nav);
                    })
                    $nav.append(next)
                    $nav.append(last);
                }
            });
</script>
</body>
</html>
