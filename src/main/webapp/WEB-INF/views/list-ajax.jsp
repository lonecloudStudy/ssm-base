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
            <button class="btn btn-primary" data-toggle="modal" data-target="#user-add-model">新增</button>
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

<!-- Modal -->
<div class="modal fade" id="user-add-model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" placeholder="请输入名字" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="sex">性别:</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex1" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="Email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-10">
                            <select name="department.name" id="dept" class="form-control">
                                <c:forEach items="${applicationScope.departments}" var="department">
                                    <option value="${department.id}">${department.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn-user-save">保存</button>
            </div>
        </div>
    </div>
</div>
<script>
    var total = 9999;
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
                            total = msg.data.pageInfo.total;
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
                        var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append(
                                $("<span></span>").addClass("glyphicon glyphicon-pencil")
                        ).append("编辑  ");
                        var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append(
                                $("<span></span>").addClass("glyphicon glyphicon-trash")
                        ).append("删除  ");
                        delBtn.click(function () {
                            delUser(user.id);
                        });
                        var editTr = $("<td></td>").append(editBtn).append(delBtn);
                        var $tr = $("<tr></tr>").append(userId).append(userName).append(userSex).append(userEmail).append(userDept).append(editTr).appendTo($table);
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
                    } else {
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
                    } else {
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
                        if (num == data.pageInfo.pageNum) {
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
    //    function validate_form() {
    //        if (validate("#name", /^[a-z0-9_-\u2E80-\u9FFF]{3,16}$/, "用户名错误,请输入3-16位中文或者英文")) {
    //            if (validate("#email", /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/, "邮箱错误")) {
    //                return true;
    //            }
    //        }
    //        return false;
    //    }
    <%--$("#name").change(function () {--%>
    <%--$.ajax({--%>
    <%--url: "${ctx}/checkUserName",--%>
    <%--type: "POST",--%>
    <%--data: {--%>
    <%--name: $(this).val()--%>
    <%--},--%>
    <%--success: function (data) {--%>
    <%--if (data.code == "ERROR") {--%>

    <%--}--%>
    <%--}--%>
    <%--})--%>
    <%--});--%>
    //    /**
    //     * 校验函数
    //     * @param ele
    //     * @param reg
    //     * @param errMsg
    //     * @param fn 特殊校验函数
    //     */
    //    function validate(ele, reg, errMsg) {
    //        var $ele = $(ele);
    //        $ele.parent().removeClass("has--success has-error");
    //        $ele.next("span").text("");
    //        if (!reg.test($ele.val())) {
    //            $ele.parent().addClass("has-error");
    //            $ele.parent().append($("<span></span>").addClass("has-error").append(errMsg));
    //            return false;
    //        } else {
    //            $ele.parent().addClass("has-success");
    //        }
    //        return true;
    //    }
    //保存
    $("#btn-user-save").click(function () {
//        if (!validate_form()) {
//            return false;
//        }
        var data = $("#user-add-model form").serialize();
        $.ajax({
            url: "${ctx}/user",
            type: "POST",
            data: data,
            success: function (data) {
                if (data.code == "SUCCESS") {
                    alert(data.message);
                }
                $("#user-add-model").modal("hide");
                toPage(total);
            }
        })
    });

    $('#user-add-model form')
            .bootstrapValidator({
                //lanuage:"zh_CN",
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        validators: {
                            notEmpty: {},
                            stringLength: {
                                min: 6,
                                max: 30,
                            },
                            remote: {
                                url: '${ctx}/checkUserName',
                                type: "POST",
                                delay: 2000,
                                message: '用户名已经存在'
                            },
                            regexp: {
                                regexp: /[\u4e00-\u9fa5_a-zA-Z0-9_]{4,10}/,
                                message: "用户名不能通过认证"
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {},
                            emailAddress: {}
                        }
                    }
                }
            })
            .on('success.form.bv', function (e) {
                // Prevent form submission
                e.preventDefault();

                // Get the form instance
                var $form = $(e.target);

                // Get the BootstrapValidator instance
                var bv = $form.data('bootstrapValidator');

                // Use Ajax to submit form data
                $.post($form.attr('action'), $form.serialize(), function (result) {
                    console.log(result);
                }, 'json');
            });
    function delUser(id) {
        $.ajax(
                {
                    url: "${ctx}/user/",
                    type: "POST",
                    data: {
                        id: id,
                        _method: "DELETE"
                    },
                    success:function (data) {
                        if(data.code=="SUCCESS"){
                            alert("删除成功");
                            window.location.reload();
                        }
                    },
                    error:function () {
                        alert("请求失败");
                    }
                }
        )
    }
</script>
</body>
</html>
