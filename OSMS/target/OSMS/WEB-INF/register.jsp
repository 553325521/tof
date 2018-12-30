<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta charset="utf-8">
<style>
    .registerTitle {
        border: 1px lightgray solid
    }

    .registerContent {
        border: 1px lightgray solid
    }
</style>
<jsp:include page="top.jsp"></jsp:include>
<div class="row top4">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                    <li><a href="index.jsp">首页</a></li>
                    <li class="active">注册</li>
                </ol>
            </div>
        </div>
        <div class="row registerTitle">
            <div class="col-md-2">
                <h4>注册</h4>
            </div>
        </div>
        <div class="row registerContent">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-4 col-md-offset-4">
                        <form id="registerForm" class="form-horizontal">
                            <div class="form-group">
                                <label for="uNumber" class="col-sm-3 control-label">学号:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="uNumber" name="uNumber"
                                           placeholder="请输入学号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uName" class="col-sm-3 control-label">姓名:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="uName" name="uName"
                                           placeholder="请输入用户名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uPwd" class="col-sm-3 control-label">密码:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="uPwd" name="uPwd"
                                           placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pwdConfirm" class="col-sm-3 control-label">确认密码:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="pwdConfirm" name="pwdConfirm"
                                           placeholder="再次输入密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uEmail" class="col-sm-3 control-label">邮箱:</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="uEmail" name="uEmail" placeholder="邮箱">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-8 col-sm-offset-4">
                                    <button type="button" id="registerBtn" class="btn btn-default btn-lg">注册</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('#registerForm').bootstrapValidator({
            message: '输入值不合法',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                uNumber: {
                    validators: {
                        notEmpty: {
                            message: '学号不能为空'
                        }
                    }
                },
                uName: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                uPwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                },
                pwdConfirm: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {//与指定控件内容比较是否相同，比如两次密码不一致
                            field: 'uPwd',//指定控件name
                            message: '输入的密码不一致'
                        }
                    }
                },
                uEmail: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {//验证email地址
                            message: '输入的email无效'
                        },
                    }
                }
            }
        });
        $('#uEmail').keydown(function (event) {
            if (event.keyCode == 13) $('#registerBtn').click();
        });
        $('#registerBtn').click(function () {
            var bv = $('#registerForm').data('bootstrapValidator');
            bv.validate();
            if (bv.isValid()) {
                var stuInfo = $("#registerForm").serializeArray();
                $.post("<%=path%>/userController/stuRegister", stuInfo, function (data) {
                    if (data.resultType == "1") {
                        location.href = "<%=path%>/showLogin"
                    } else {
                        showMsg("提示", data.resultContent);
                    }
                }, "json");
            }
        })
    })
</script>
<jsp:include page="footer.jsp"></jsp:include>
