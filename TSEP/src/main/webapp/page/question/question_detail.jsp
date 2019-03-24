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
							<div class="col-lg-13">
								<div class="ibox">
									<div class="ibox-content">
										<div class="float-right">
											<button class="btn btn-white btn-xs" type="button">标签</button>
											<button class="btn btn-white btn-xs" type="button">标签</button>
											<button class="btn btn-white btn-xs" type="button">标签</button>
										</div>
										<div class="text-center article-title">
											<span class="text-muted"><i class="fa fa-clock-o"></i> 2017年10月28日</span>
											<h1 style="font-size: 35px;">
												时间从何而来？为什么时间似乎是流动的？
											</h1>
										</div>
										<p>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。通过时间，我们可以研究事物的变化。然而，关于时间的本质，还有待我们进一步探究。
										</p>
										<p>
											时间流动是真实还是错觉？<br>
											之所以有些人认为时间流动是错觉，是因为当人们停下来思考时，无法理解时间流动究竟意味着什么。我们常说时间就像河流一样流动，这样的意思是河流的水在某一时刻处于与前一时刻不同的地方。换言之，水相对于时间移动。然而，时间并不能随着时间而流动，时间就是时间。

											很多人误以为时间不流动就是意味着没有时间，时间不存在。然而，这是无稽之谈。时间当然存在，我们用时钟来测量它。时钟不是测量时间的流逝，而是测量时间的间隔。在事件之间存在时间间隔，这就是时钟所测量的。
										</p>
										<p>
											The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek,
										</p>
										<p>
											Two driven jocks help fax my big quiz. Quick, Baz, get my woven flax jodhpurs! "Now fax quiz Jack!" my brave ghost pled. Five quacking zephyrs jolt my wax bed. Flummoxed by job, kvetching W. zaps Iraq. Cozy sphinx waves quart jug of bad milk. A very bad quack might jinx zippy fowls. Few quips galvanized the mock jury box. Quick brown dogs jump over the lazy fox. The jay, pig, fox, zebra, and my wolves quack! Blowzy red vixens fight for a quick jump. Joaquin Phoenix was gazed by MTV for luck. A wizard’s job is to vex chumps quickly in fog. Watch "Jeopardy!", Alex Trebek's fun TV quiz game. Woven silk pyjamas exchanged for blue quartz. Brawny gods just
										</p>
										<p>
											Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my junk TV quiz. How quickly daft jumping zebras vex.
										</p>
										<hr>
										<div class="row">
											<div class="col-md-6">
												<h5>标签:</h5>
												<button class="btn btn-primary btn-xs" type="button">标签</button>
												<button class="btn btn-white btn-xs" type="button">标签</button>
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

															<div class="summernote">
																请输入评论
																<br/>
																<br/>

															</div>
															<div class="clearfix"></div>
														</div>
														<div class="mail-body text-right tooltip-demo">
															<a href="mailbox.html" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" title="发表评论"><i class="fa fa-reply"></i> 发表评论</a>
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

<script>
    $(document).ready(function(){

        $('.summernote').summernote({
            height:153
        });

    });

</script>

</body>

</html>

