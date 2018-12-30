<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
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
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                    <li><a href="#">首页</a></li>
                    <li><a href="studentToTeacher">师生交流区</a></li>
                    <li class="active">${requestScope.question.qTitle}</li>
                </ol>
            </div>
        </div>
        <div class="row all">
            <div class="col-md-2">
                <div class="row">
                    <div class="col-md-12">
                        <img src="${requestScope.askUser.uTx}" class="img-responsive img-circle" alt="tx">
                        <div class="clear"></div>
                        <h5>提问者:${requestScope.askUser.uName}</h5>
                    </div>
                </div>
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
                </div>
            </div>
        </div>
    </div>
</div>
<script>
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
                $(".louceng").after('<div class="col-md-12 answer"><h1 style="color:lightgray">没有回复信息</h1></div>');
            }
        }, "json");
    }

    getReplyData();
</script>
<jsp:include page="footer.jsp"></jsp:include>
