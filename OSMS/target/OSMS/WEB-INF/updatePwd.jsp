<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta charset="utf-8">
<style>
    .updatePwdTitle {
        border: 1px lightgray solid
    }

    .updatePwdContent {
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
                    <li class="active">修改密码</li>
                </ol>
            </div>
        </div>
        <div class="row updatePwdTitle">
            <div class="col-md-2">
                <h4>修改密码</h4>
            </div>
        </div>
        <div class="row updatePwdContent">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-4 col-md-offset-4">
                        <form id="updatePwdForm" class="form-horizontal">
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">邮箱:</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="邮箱">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pwd" class="col-sm-3 control-label">密码:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pwdConfirm" class="col-sm-3 control-label">确认密码:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="pwdConfirm" name="pwdConfirm"
                                           placeholder="再次输入密码">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-8 col-sm-offset-4">
                                    <button type="button" id="updatePwdBtn" class="btn btn-default btn-lg">修改密码</button>
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
        $('#updatePwdForm').bootstrapValidator({
            message: '输入值不合法',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                pwd: {
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
                            field: 'pwd',//指定控件name
                            message: '输入的密码不一致'
                        }
                    }
                },
                email: {
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
        $('#updatePwdBtn').click(function () {
            var bv = $('#updatePwdForm').data('bootstrapValidator');
            bv.validate();
        })
    })
</script>
<jsp:include page="footer.jsp"></jsp:include>
