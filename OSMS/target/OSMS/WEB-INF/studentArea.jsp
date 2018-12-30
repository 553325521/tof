<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<style>

    .myInfo {
        background: url(<%=path%>/img/title.gif) repeat-x;
        height: 40px;
    }
</style>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="row top4">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                    <li><a href="#">首页</a></li>
                    <li class="active">同学交流区</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <c:if test="${sessionScope.SESSION_USER != null}">
                <div class="col-md-2">
                    <div class="row">
                        <div class="col-md-12 myInfo">
                            <p>我的信息</p>
                        </div>
                        <div class="col-md-12">
                            <img src="${sessionScope.SESSION_USER.uTx}" class="img-responsive center-block img-rounded"
                                 alt="tx">
                            <div class="clear"></div>
                            <p>注册名称: ${sessionScope.SESSION_USER.uName}</p>
                        </div>
                        <div class="col-md-12">
                            <a class="btn btn-primary" role="button" data-toggle="modal" data-target="#myModal"
                               id="askQuestion">我要提问</a>
                            <!-- Modal -->
                            <div class="modal fade " id="myModal" tabindex="" role="dialog"
                                 aria-labelledby="myModalLabel">
                                <div class="modal-dialog " role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel"><span style="color:#337ab7"
                                                                                            class="glyphicon glyphicon-question-sign"
                                                                                            aria-hidden="true"></span>我要提问
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <form>
                                                        <div class="form-group">
                                                            <label for="title">标题:</label>
                                                            <input type="text" class="form-control" id="title"
                                                                   placeholder="问题主要内容">
                                                        </div>
                                                        <div class="form-group">
                                                            <h6>内容:</h6>
                                                            <script id="myContainer" name="content" type="text/plain">
                                                            </script>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                            </button>
                                            <button type="button" class="btn btn-primary" id="finish">完成</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs" id="tabChange">
                            <li role="presentation" class="active"><a href="javacript:void(0)">待解决</a></li>
                            <li role="presentation"><a href="javacript:void(0)">已解决</a></li>
                        </ul>
                    </div>
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-12 clear"></div>
                    <div class="col-md-12" style="background:url(<%=path%>/img/title.gif)">
                        <span class="glyphicon glyphicon-chevron-right"></span><span id="titleSpan">未解决列表
										</span>
                    </div>
                    <div class="col-md-12">
                        <table id="problemTable">

                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
    $(function () {
        var ue = UE.getEditor('myContainer');
        $("#finish").click(function () {
            var title = $("#title").val();
            var content = ue.getContent();
            $.post("<%=path%>/questionController/addStudentQuestion", {
                "qTitle": title,
                "qContent": content
            }, function (data) {
                if (data.resultType == "1") {
                    var opt = {
                        url: "<%=path%>/questionController/getQuestionData",
                        silent: true,
                        query: {
                            type: 0,
                            state: 0,
                        }
                    };
                    $('#problemTable').bootstrapTable('refresh', opt);
                    $("#myModal").modal("hide");
                    showMsg("提示", "添加成功");
                } else if (data.resultContent == "未登录") {
                    location.href = "<%=path%>/showLogin";
                } else {
                    $("#myModal").modal("hide");
                    showMsg("提示", "添加失败");
                }
            }, "json");
        })
        $("#tabChange li").click(function () {
            if ($(this).text() == "已解决") {
                $("#titleSpan").text("已解决列表");
                var opt = {
                    url: "<%=path%>/questionController/getQuestionData",
                    silent: true,
                    query: {
                        type: 0,
                        state: 1,
                    }
                };
                $('#problemTable').bootstrapTable('refresh', opt);
            } else {
                var opt = {
                    url: "<%=path%>/questionController/getQuestionData",
                    silent: true,
                    query: {
                        type: 0,
                        state: 0,
                    }
                };
                $('#problemTable').bootstrapTable('refresh', opt);
                $("#titleSpan").text("未解决列表");
            }
            $("#tabChange li").removeClass("active");
            $(this).addClass("active");
        });

        $('#problemTable').bootstrapTable({
            url: '<%=path%>/questionController/getQuestionData',
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
            ajaxOptions: {'state': '0', 'type': '0'},
            onClickCell: function (field, value, row, $element) {
                //alert(row.SystemDesc);
            },
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
            },]
        });
    })

    function queryParams(params) { //配置参数
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit, //页面大小
            offset: params.offset, //页码
            state: 0,
            type: 0,
        };
        return temp;
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>
