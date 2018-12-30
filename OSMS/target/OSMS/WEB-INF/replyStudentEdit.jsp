<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
<style>
    .all {
        background: white;
    }

    .question {
        border-bottom: 1px lightgray solid;
    }

    .louceng {
        border-bottom: 1px lightgray solid;
    }

    .answer {
        border-bottom: 1px lightgray solid;
    }

    .center {
        border-left: 1px lightgray solid;
    }

    p {
        color: gray;
    }

</style>
<jsp:include page="top.jsp"></jsp:include>
<div class="row top4">
    <div class="col-md-12">
        <div class="row all">
            <div class="col-md-2">
                <div id="mobile-menu" class="mobile-nav visible-xs visible-sm">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                        data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="index.jsp">左侧菜单</a>
                            </div>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                                <ul class="nav navbar-nav">
                                    <li><a href="<%=path%>/showMyArea">教学信息管理</a></li>
                                    <li><a href="<%=path%>/showTeachResourceManager">教学资源管理</a></li>
                                    <li class="active"><a href="<%=path%>/showReplyStudent">回复学生问题</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div>
                <ul class="nav nav-pills nav-stacked visible-lg visible-md">
                    <li role="presentation"><a href="<%=path%>/showMyArea">教学信息管理</a></li>
                    <li role="presentation"><a href="<%=path%>/showTeachResourceManager">教学资源管理</a></li>
                    <li class="active"><a href="<%=path%>/showReplyStudent">回复学生问题</a></li>
                </ul>
            </div>
            <div class="col-md-10">
                <div class="row center">
                    <div class="col-md-12 question">
                        <div class="row">
                            <div class="col-md-12">
                                <h4><a href="#">${requestScope.question.qTitle} </a></h4>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <p>
                                            <span class="glyphicon glyphicon-user"
                                                  aria-hidden="true"></span>${requestScope.askUser.uName}&nbsp;
                                            <span class="glyphicon glyphicon-time"
                                                  aria-hidden="true"></span>${requestScope.question.qTimeStr}&nbsp;
                                        </p>
                                    </div>
                                    <div class="col-md-1">
                                        <p>
                                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                            <span>${requestScope.question.qViewCount}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <hr style="height:1px;border:none;border-top:1px dashed lightgray;"/>
                            </div>
                            <div class="col-md-12">
                                ${requestScope.question.qContent}
                            </div>
                            <div class="col-md-12">
                                <hr style="height:1px;border:none;border-top:1px dashed lightgray;"/>
                            </div>
                            <div class="col-md-12 clear"></div>
                        </div>
                    </div>
                    <div class="col-md-12 louceng">
                        <h3 style="color:gray">老师答复</h3>
                    </div>
                    <div class="col-md-12 replyArea">
                        <h3 style="color:gray">回复区</h3>
                    </div>
                    <div class="col-md-12 sendReplyArea">
                        <div class="row">
                            <div class="col-md-12 clear"></div>
                            <div class="col-md-8">
                                <script id="myContainer" name="content" type="text/plain">
                                </script>
                            </div>
                            <div class="col-md-12 clear"></div>
                            <div class="col-md-12">
                                <button type="button" id="sendReply" class="btn btn-info">发表回复</button>
                            </div>
                            <div class="col-md-12 clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var ue = UE.getEditor('myContainer');

    /* 加载回复 */
    function getReplyData() {
        var rQId = ${requestScope.question.qId};
        $.post("<%=path%>/replyController/getReplyData", {"rQId": rQId}, function (data) {
            if (data.length > 0) {
                $(".louceng").after('<div class="col-md-12 answer">'
                    + '<div class="row">'
                    + '<div class="col-md-12">'
                    + '<div class="row">'
                    + '<div class="col-md-12 clear"></div>'
                    + '<div class="col-md-3">'
                    + '<p>'
                    + '<span class="glyphicon glyphicon-user" aria-hidden="true"></span>' + data[0].uName + '&nbsp;'
                    + '<span class="glyphicon glyphicon-time" aria-hidden="true"></span>' + data[0].rTimeStr + '&nbsp;'
                    + '</p>'
                    + '</div>'
                    + '</div>'
                    + '</div>'
                    + '<div class="col-md-12">'
                    + '<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
                    + '</div>'
                    + '<div class="col-md-12">'
                    + '<p>' +
                    data[0].rContent
                    + '</p>'
                    + '</div>'
                    + '</div>'
                    + '</div>');
            } else {
                $(".louceng").after('<div class="col-md-12 answer"><h1 style="color:lightgray">尚未回复</h1></div>');
            }
        }, "json");
    }

    getReplyData();
    $(function () {
        $("#sendReply").click(function () {
            var rQId = ${requestScope.question.qId};
            var rContent = ue.getContent();
            $.post("<%=path%>/replyController/replyStudent", {"rQId": rQId, "rContent": rContent}, function (data) {
                if (data.resultType == "1") {
                    $(".answer").remove();
                    showMsg("提示", "回复成功");
                    getReplyData();
                } else {
                    showMsg("提示", "回复失败,请与管理员联系");
                }
            }, "json");
        })
    })
</script>
<jsp:include page="footer.jsp"></jsp:include>
