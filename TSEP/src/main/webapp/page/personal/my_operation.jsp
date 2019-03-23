<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>全部动态</title>

    <link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=basePath %>css/animate.css" rel="stylesheet">
    <link href="<%=basePath %>css/style.css" rel="stylesheet">

</head>

<body>
    <div id="wrapper">
        <div id="page-wrapper" class="gray-bg" style="margin-left:0">
        <div class="wrapper wrapper-content">
            <div class="row animated fadeInRight">
               <%--  <div class="col-md-4">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h5>资料详情</h5>
                        </div>
                        <div>
                            <div class="ibox-content no-padding border-left-right">
                                <img alt="image" class="img-fluid" src="<%=basePath%>img/profile_big.jpg">
                            </div>
                            <div class="ibox-content profile-content">
                                <h4><strong>小明</strong></h4>
                                <p><i class="fa fa-map-marker"></i> 北京 123/123</p>
                                <p><i class="fa fa-qq"></i>1393936249</p>
                                <h5>
                                    我的简介
                                </h5>
                                <p>
                                    这个家伙很懒，什么都不想告诉你！
                                </p>
                                <div class="row m-t-lg">
                                    <div class="col-md-4">
                                        <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                        <h5><strong>169</strong>发表</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                        <h5><strong>28</strong>浏览量</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
                                        <h5><strong>240</strong>阅读</h5>
                                    </div>
                                </div>
                               <!--  <div class="user-button">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-envelope"></i> 发送信息</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-default btn-sm btn-block"><i class="fa fa-coffee"></i> 请喝咖啡</button>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                    </div>
                </div>
                    </div> --%>
                <div class="col-md-12">
                    <div class="ibox ">
                        <div class="ibox-title">
                            <h5>动态列表</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#" class="dropdown-item">选项 1</a>
                                    </li>
                                    <li><a href="#" class="dropdown-item">选项 2</a>
                                    </li>
                                </ul>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <div>
                            	<div class="input-group input-group-sm" style="margin-bottom: 30px">
                                    <input type="text" class="form-control" placeholder="按名称搜索..." >
                                    <div class="input-group-append">
                                        <button class="btn btn-white" type="button">搜索</button>
                                    </div>
                                </div>
                                <div class="feed-activity-list">

                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/a1.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right text-navy">1分钟前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                            <div class="actions">
                                                <a href=""  class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a href="" class="btn btn-xs btn-danger"><i class="fa fa-heart"></i> 喜欢</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/profile.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right">5分钟前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                        </div>
                                    </div>

                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/a2.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right">2小时前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                            <div class="well">
                                                我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。
                                            </div>
                                            <div class="float-right">
                                                <a href=""  class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a href=""  class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 喜欢</a>
                                                <a href="" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> 信息</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/a3.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right">2小时前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                            <div class="photos">
                                                <a target="_blank" href="http://24.media.tumblr.com/20a9c501846f50c1271210639987000f/tumblr_n4vje69pJm1st5lhmo1_1280.jpg"> <img alt="image" class="feed-photo" src="<%=basePath%>img/p1.jpg"></a>
                                                <a target="_blank" href="http://37.media.tumblr.com/9afe602b3e624aff6681b0b51f5a062b/tumblr_n4ef69szs71st5lhmo1_1280.jpg"> <img alt="image" class="feed-photo" src="<%=basePath%>img/p3.jpg"></a>
                                                </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right text-navy">5小时前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                            <div class="actions">
                                                <a href=""  class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                <a href=""  class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 喜欢</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/a5.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right">2小时前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                            <div class="well">
                                                我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。
                                            </div>
                                            <div class="float-right">
                                                <a href=""  class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/profile.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right">23小时前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                        </div>
                                    </div>
                                    <div class="feed-element">
                                        <a href="#" class="float-left">
                                            <img alt="image" class="rounded-circle" src="<%=basePath%>img/a7.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="float-right">46小时前</small>
                                            <strong>小明 </strong> 时间是一切财富中最宝贵的财富 <br>
                                            <small class="text-muted">今天下午2017.12.12 4:21 </small>
                                        </div>
                                    </div>
                                </div>

                               <!--  <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多</button> -->

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        </div>
        </div>



    <!-- Mainly scripts -->
    <script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script src="<%=basePath%>js/popper.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.js"></script>
    <script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="<%=basePath%>js/inspinia.js"></script>
    <script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>

    <!-- Peity -->
    <script src="<%=basePath%>js/plugins/peity/jquery.peity.min.js"></script>

    <!-- Peity -->
    <script src="<%=basePath%>js/demo/peity-demo.js"></script>

</body>

</html>

