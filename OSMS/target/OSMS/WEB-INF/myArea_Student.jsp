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
                            <li class="active"><a href="showMyArea">问题管理</a></li>
                            <li><a href="showReplyManager">回复管理</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <ul class="nav nav-pills nav-stacked visible-lg visible-md">
            <li role="presentation" class="active"><a href="showMyArea">问题管理</a></li>
            <li role="presentation"><a href="showReplyManager">回复管理</a></li>
        </ul>
    </div>
    <div class="col-md-10">
        <div class="col-md-12">
            <table id="problemTable">
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('#problemTable').bootstrapTable({
            url: '<%=path%>/questionController/getQuestionByUser',
            method: 'post',
            classes: 'table table-hover table-no-bordered ',
            cache: false,//禁用缓存
            pagination: true,//启动分页
            // showPaginationSwitch:true,
            onlyInfoPagination: false,
            pageNumber: 1,//初始化table时显示的页码
            pageSize: 15,//每页条目
            dataType: 'json',
            sidePagination: 'server',
            sortable: false,
            queryParams: queryParams,
            sortable: false,//排序
            idField: 'qId',//key值栏位
            columns: [{
                field: 'qTitle',
                title: '标题',
                width: '70%',
                formatter: function (value, row, index) {
                    return "<span class='glyphicon glyphicon-paperclip' aria-hidden='true'></span>&nbsp;<a href='<%=path%>/showQuestionDetail?qId=" + row.qId + "'>" + value + "</a>";
                }
            }, {
                field: 'qReplyCount',
                title: '回答数量',
                align: 'center'
            }, {
                field: 'qTimeStr',
                title: '提问时间',
                align: 'center'
            }, {
                field: '',
                title: '操作',
                align: 'center',
                formatter: function (value, row, index) {
                    return '<button class="btn btn-default" type="button" onclick="deleteQ(' + row.qId + ')">删除</button>';
                }
            },]
        });
    })

    function deleteQ(qId) {
        $.post("<%=path%>/questionController/deleteQuestionByUser", {"qId": qId}, function (data) {
            var opt = {
                url: "<%=path%>/questionController/getQuestionByUser",
                silent: true,
            };
            $('#problemTable').bootstrapTable('refresh', opt);
            showMsg("提示", "删除成功");
        }, "json");
    }

    function queryParams(params) { //配置参数
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit, //页面大小
            offset: params.offset, //页码
        };
        return temp;
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
