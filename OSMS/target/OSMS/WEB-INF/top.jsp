<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>OS教育平台</title>
    <style type="text/css">
        .top1 {
            background: url(<%=path%>/img/topbg.png) repeat-x;
            height: 40px;
            line-height: 40px;
            margin: auto;
        }

        .top2 {
            background: #F5F5F3
        }

        .top2 .search {
            margin-top: 5%;
        }

        .last-problem {
            border: 1px lightgray solid;
            height: 50px
        }

        .new {
            margin-top: 1%
        }

        .clear {
            height: 10px
        }

        .separate {
            height: 2px;
            border: 2px gray solid
        }

        .table-area {
            background: white
        }

        .top5 {
            background: lightgray
        }

        .download-icon {
            background: #2ebb96;
            border-radius: 50%;
        }

        .top6 {
            background: black;
            height: 50px;
        }

        .top6 p {
            color: white
        }
    </style>
    <!-- css文件 -->
    <link rel="stylesheet" type="text/css" href="<%=path%>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/bootstrap-3.3.7-dist/css/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/fileinput.css">
    <!-- js文件 -->
    <script src="<%=path%>/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/fileinput.js"></script>
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap-table.min.js"></script>
    <script src="<%=path%>/bootstrap-3.3.7-dist/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/fileinput_locale_zh.js"></script>
    <script src="<%=path%>/js/bootstrapValidator.js"></script>
</head>
<body>
<div class="container">
    <div class="top">
        <div class="row top1">
            <div class="col-md-3 col-xs-9 col-md-offset-9 col-xs-offset-3">
                <c:choose>
                    <c:when test="${sessionScope.SESSION_USER == null}">
                        <a class="btn btn-default login" href="showLogin" role="button">登录</a>
                        <a class="btn btn-default register" href="showRegister" role="button">注册</a>
                        <a class="btn btn-default lookpwd" href="showUpdatePwd" role="button">找回密码</a>
                    </c:when>
                    <c:otherwise>
                        <p style="color:#337ab7"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                ${sessionScope.SESSION_USER.uName}
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            <a href="<%=path %>/loginOut">退出登录</a></p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="row top2">
            <div class="col-md-4 logo">
                <h2><a href="index.html"><img src="<%=path%>/img/logo.png" class="img-responsive" alt="logo"></a></h2>
            </div>
            <div class="col-md-4 col-xs-12 search col-md-offset-3">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="输入搜索内容">
                    <span class="input-group-btn">
							        <button class="btn btn-default" type="button">
							        	<span class="glyphicon  glyphicon-search" style="font-size:20px"
                                              aria-hidden="true"></span>
							        </button>
							      </span>
                </div>
            </div>

        </div>
        <div class="row top3">
            <div class="col-md-12 clear"></div>
            <div class="col-md-12">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.action">首页</a>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="studentArea"><span>同学交流区</span></a></li>
                                <li><a href="showTeachInfo">教学信息区</a></li>
                                <li><a href="studentToTeacher">师生交流区</a></li>
                                <li><a href="showTeachResource">教学资源区</a></li>
                                <li><a href="showMyArea">个人专区</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
        </div>

        <div class="modal fade msg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
             style="z-index:1300">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="msgTitle"></h4>
                    </div>
                    <div class="modal-body" id="msgContent">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function showMsg(title, content) {
                $("#msgTitle").text(title);
                $("#msgContent").text(content);
                $(".msg").modal("show");
            }

        </script>