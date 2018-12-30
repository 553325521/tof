<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta charset="utf-8">
<jsp:include page="top.jsp"></jsp:include>
<div class="row top4">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                    <li><a href="#">首页</a></li>
                    <li class="active">最新信息</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-11   last-problem">
                <div class="new">最新问题</div>
            </div>
        </div>
        <div class="row clear"></div>
        <div class="row">
            <!-- Single button -->
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-default dropdown-toggle" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                    提问问题 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="studentArea">与同学交流</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="studentToTeacher">向老师请教</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 clear"></div>
            <div class="col-md-12 separate"></div>
        </div>
        <div class="row">
            <div class="col-md-12 clear"></div>
            <div class="col-md-12">
                <div class="btn-group" role="group" aria-label="menuBtn">
                    <button type="button" class="btn btn-default">最新教学信息</button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class=" col-md-12 clear"></div>
            <div class="col-md-12 table-area">
                <table id="teachInfoTable">
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#teachInfoTable").bootstrapTable({
            url: '<%=path%>/noticeController/getLastNoticeData',
            method: 'post',
            classes: 'table table-hover table-no-bordered ',
            cache: false,//禁用缓存
            // showPaginationSwitch:true,
            onlyInfoPagination: false,
            dataType: 'json',
            sidePagination: 'server',
            sortable: false,
            queryParams: queryParams,
            sortable: false,//排序
            idField: 'nId',//key值栏位
            columns: [{
                field: 'nTitle',
                title: '标题',
                width: '70%',
                formatter: function (value, row, index) {
                    return "<span class='glyphicon glyphicon-volume-up' aria-hidden='true'></span>&nbsp;<a href='<%=path%>/showTeachInfoDetail?nId=" + row.nId + "'>" + value + "</a>";
                }
            }, {
                field: 'nTimeStr',
                title: '发表时间',
                align: 'center'
            },]
        });
    })

    function queryParams(params) { //配置参数
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit, //页面大小
            offset: params.offset, //页码
        };
        return temp;
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
