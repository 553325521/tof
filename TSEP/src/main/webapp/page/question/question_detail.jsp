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

	<title>师生交流平台</title>
	<jsp:include page="/page/tool/top.jsp"></jsp:include>
	<link href="<%=basePath%>css/plugins/iCheck/custom.css" rel="stylesheet">
	<link href="<%=basePath%>css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
	<link href="<%=basePath%>css/plugins/toastr/toastr.min.css" rel="stylesheet">

</head>

<body>
<div id="wrapper">
	<div id="page-wrapper" class="gray-bg" style="margin-left:0">
		<div class="wrapper wrapper-content">
			<div class="row animated fadeInRight">
				<div class="col-md-4">
					<div class="ibox " style="margin-top: 45px;">
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
				</div>
				<div class="col-md-8">
					<div class="wrapper wrapper-content  animated fadeInRight article">
						<div class="row justify-content-md-center">
							<div class="col-lg-12">
								<div class="ibox">
									<div class="ibox-content">
										<div class="float-right" id="tagName">
											<%--<button class="btn btn-white btn-xs" type="button">标签</button>--%>
											<%--<button class="btn btn-white btn-xs" type="button">标签</button>--%>
											<%--<button class="btn btn-white btn-xs" type="button">标签</button>--%>
										</div>
										<div class="text-center article-title">
											<span class="text-muted" id="createTime"><i class="fa fa-clock-o"></i></span>
											<h1 style="font-size: 35px;" id="title">
											</h1>
										</div>
										<p id="content" style="word-break: break-all">
										</p>
										<hr>
										<div class="row">
											<div class="col-md-6">
												<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
											</div>
											<div class="col-md-6">
												<div class="small text-right">
													<h5>统计:</h5>
													<div> <i class="fa fa-comments-o"> </i> 56 评论 </div>
													<i class="fa fa-eye"> </i> 144 查看
												</div>
											</div>
										</div>

										<div class="row" style="margin-top:30px;">
											<div class="col-lg-12">

												<div class="col-lg-12 animated fadeInRight" style="padding: 0;">
													<div class="mail-box">
														<div class="mail-text h-200">

															<div id="comment" class="summernote" aria-placeholder="请输入评论">
															</div>
															<div class="clearfix"></div>
														</div>
														<div class="mail-body text-right tooltip-demo">
															<a href="" onclick="comment()" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="发表评论"><i class="fa fa-reply"></i> 发表评论</a>
														</div>
														<div class="clearfix"></div>



													</div>
												</div>
												<div class="social-feed-box">
													<div class="social-avatar">
														<a href="" class="float-left">
															<img alt="image" src="img/a1.jpg">
														</a>
														<div class="media-body">
															<a href="#">
																小明
															</a>
															<small class="text-muted">今天下午2017.12.12 4:21</small>
														</div>
													</div>
													<div class="social-body">
														<p>
															时间是一切财富中最宝贵的财富。
														</p>
													</div>
												</div>
												<div class="social-feed-box">
													<div class="social-avatar">
														<a href="" class="float-left">
															<img alt="image" src="img/a2.jpg">
														</a>
														<div class="media-body">
															<a href="#">
																小红
															</a>
															<small class="text-muted">今天下午2017.12.12 4:21</small>
														</div>
													</div>
													<div class="social-body">
														<p>
															时间是一切财富中最宝贵的财富。
														</p>
													</div>
												</div>
												<div class="social-feed-box">
													<div class="social-avatar">
														<a href="" class="float-left">
															<img alt="image" src="img/a3.jpg">
														</a>
														<div class="media-body">
															<a href="#">
																小黑
															</a>
															<small class="text-muted">今天下午2017.12.12 4:21</small>
														</div>
													</div>
													<div class="social-body">
														<p>
															时间是一切财富中最宝贵的财富。
														</p>
													</div>
												</div>
												<div class="social-feed-box">
													<div class="social-avatar">
														<a href="" class="float-left">
															<img alt="image" src="img/a5.jpg">
														</a>
														<div class="media-body">
															<a href="#">
																小白
															</a>
															<small class="text-muted">今天下午2017.12.12 4:21</small>
														</div>
													</div>
													<div class="social-body">
														<p>
															时间是一切财富中最宝贵的财富。
														</p>
													</div>
												</div>


											</div>
										</div>


									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/page/tool/footer.jsp"></jsp:include>
<!-- iCheck -->
<script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"></script>

<!-- SUMMERNOTE -->
<script src="<%=basePath%>js/plugins/summernote/summernote-bs4.js"></script>

<script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>

<script>
	var qId = "<%=request.getParameter("qId")%>";
    $(document).ready(function(){

        $('.summernote').summernote({
            height:153
        });

        $.ajax({
            type: "GET",
            url: "<%=basePath%>question_detail?qId="+qId,
            success: function (result) {
                $("#title").append(result.title);
                $("#content").append(result.content);
                $("#createTime").append(result.creatTime);
                var tag = '';
                if(result.tagName!=null && result.tagName!=""){
                    var tagName=result.tagName.split(",");
                    for(var j=0;j<tagName.length;j++){
                        tag +='<button class="btn btn-white btn-xs">'+tagName[j]+'</button>';
                    }
                    tag +='</td>';
                }
                $("#tagName").append(tag);
            }
        });

    });
    function comment() {
        var comment = $('.summernote').summernote('code');
        $.ajax({
            type: "GET",
            url: "<%=basePath%>comment/save?qId="+qId+'&comment='+comment,
            success: function (result) {
                if(result.resultType == '0000'){
                    toastr['success']('发表成功');
                }else{
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "progressBar": true,
                        "preventDuplicates": true,
                        "positionClass": "toast-bottom-right",
                        "onclick": null,
                        "showDuration": "400",
                        "hideDuration": "1000",
                        "timeOut": "7000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    };
                    toastr['success'](result.resultContent,'发表失败');
                }
            }
        });
    }

</script>

</body>

</html>

