<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<style>
    .content {
        background: #eeeeeb
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
                    <li><a href="showTeachInfo">教学信息区</a></li>
                    <li class="active">内容查看</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-1 content">
                <div class="row">
                    <div class="col-md-12">
                        <h3>${requestScope.n.nTitle}</h3>
                    </div>
                    <div class="col-md-12">
                        <hr style="height:1px;border:none;border-top:1px solid #3179b5;"/>
                    </div>
                    <div class="col-md-12">
                        ${requestScope.n.nContent}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {

    })
</script>
<jsp:include page="footer.jsp"></jsp:include>
