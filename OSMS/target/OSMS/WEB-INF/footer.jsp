<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="row top5">
    <div class="col-md-4">
        <h2>联系我们</h2>
        <p>QQ:1393936249</p>
        <p>微信:wjl_dangdang</p>
    </div>
    <div class="col-md-6 col-md-offset-2">
        <h2>移动端下载(未启用)</h2>
        <div class="row">
            <div class="col-md-2 col-xs-3 download-icon">
                <a href="#" id="" style="">
                    <img src="<%=path%>/img/apple.png" class="img-responsive" style="margin-left:20%" alt="apple">
                </a>
            </div>
            <div class="col-md-2 col-xs-3 download-icon">
                <a href="#" id="">
                    <img src="<%=path%>/img/android.png" style="margin-left:20%" class="img-responsive" alt="android">
                </a>
            </div>
            <div class="col-md-2 col-xs-3 download-icon">
                <a href="#" id="">
                    <img src="<%=path%>/img/cp.png" style="margin-left:20%" class="img-responsive" alt="computer">
                </a>
            </div>
        </div>
    </div>
</div>
<div class="row top6">
    <div class="col-md-5 col-xs-10 col-md-offset-4 col-xs-offset-2">
        <p style="margin:auto;" class="right">Copyright @ Yaofengxia 2018-2019 &nbsp;&nbsp;All rights reserved.</p>
    </div>
</div>
</div>
</div>
<script type="text/javascript">
    $(function () {
        var test = window.location.href;
        var r = test.substring(test.lastIndexOf('/') + 1);
        if (r == "studentArea" || r.indexOf("showQuestionDetail") != -1) {
            $('.navbar-nav > li').removeClass('active');
            $("a[href='studentArea']").parent().addClass('active');
        } else if (r == "showTeachInfo" || r.indexOf("showTeachInfoDetail") != -1) {
            $('.navbar-nav > li').removeClass('active');
            $("a[href='showTeachInfo']").parent().addClass('active');
        } else if (r == "studentToTeacher" || r.indexOf("showStudentToTeacherDetail") != -1) {
            $('.navbar-nav > li').removeClass('active');
            $("a[href='studentToTeacher']").parent().addClass('active');
        } else if (r == "showTeachResource") {
            $('.navbar-nav > li').removeClass('active');
            $("a[href='showTeachResource']").parent().addClass('active');
        } else if (r == "index.jsp") {
            $('.navbar-nav > li').removeClass('active');
        } else if (r == "showMyArea") {
            $('.navbar-nav > li').removeClass('active');
            $("a[href='showMyArea']").parent().addClass('active');
        } else if (r == "showLogin") {
            $('.navbar-nav > li').removeClass('active');
        } else if (r == "showRegister") {
            $('.navbar-nav > li').removeClass('active');
        } else if (r == "index.action") {
            $('.navbar-nav > li').removeClass('active');
        } else {
            $('.navbar-nav > li').removeClass('active');
        }

        /* 	$(".navbar-nav li").click(function(){
                $('.navbar-nav > li').removeClass('active');
                $(this).addClass('active');
                window.location.href=$(this).find('a').attr("id");
            }); */
    })
</script>
</body>
</html>