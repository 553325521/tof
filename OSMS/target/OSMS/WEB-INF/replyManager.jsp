<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta charset="utf-8">
<jsp:include page="top.jsp"></jsp:include>
<div class="row top4">
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
                            <li><a href="showMyArea">问题管理</a></li>
                            <li class="active"><a href="showReplyManager">回复管理</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <ul class="nav nav-pills nav-stacked visible-lg visible-md">
            <li role="presentation"><a href="showMyArea">问题管理</a></li>
            <li role="presentation" class="active"><a href="showReplyManager">回复管理</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <div class="next"></div>
    </div>
</div>
<script type="text/javascript">
    function getReplyDataByUser() {
        $.post("<%=path%>/replyController/getReplyDataByUser", null, function (data) {
            if (data.length > 0) {
                $.each(data, function (i, n) {
                    $(".next").after('<div class="row reply">'
                        + '<div class="col-md-12">'
                        + '<div class="col-md-12">'
                        + '<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
                        + '</div>'
                        + '<div class="col-md-12">'
                        + '<pre>问题:“' + n.qTitle + '”</pre>'
                        + '</div>'
                        + '<div class="col-md-12">'
                        + '<h4>回复内容:</h4><div>'
                        + n.rContent
                        + '</div></div>'
                        + '<div class="col-md-2 col-md-offset-10">'
                        + '<button class="btn btn-default" type="button" onclick="deleteByRId(' + n.rId + ')">删除</button>'
                        + '</div>'
                        + '<div class="col-md-12 clear"></div>'
                        + '</div>'
                        + '</div>'
                        + '<div class="col-md-12">'
                        + '<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
                        + '</div>'
                        + '<div class="col-md-12 clear"></div>');
                });
            }
        }, "json");
    }

    getReplyDataByUser();

    function deleteByRId(rId) {
        $.post("<%=path%>/replyController/deleteReply", {"rId": rId}, function (data) {
            $(".reply").remove();
            getReplyDataByUser();
            showMsg("提示", "删除成功");
        }, "json");
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
