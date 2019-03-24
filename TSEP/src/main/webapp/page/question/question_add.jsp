<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="/page/tool/top.jsp"></jsp:include>
<link href="<%=basePath%>css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="<%=basePath%>css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-md-4">
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
		</div>
		<div class="col-md-8">
			<div class="ibox ">
				<div class="ibox-title">
					<h2>添加新问题</h2>
				</div>
				<div class="ibox-content">
					<form method="post" id="questionForm">
						<div class="form-group  row"><label class="col-sm-2 col-form-label">标题</label>

							<div class="col-sm-10"><input type="text" name="question_title" class="form-control"></div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group  row"><label class="col-sm-2 col-form-label">内容</label>
							<div class="mail-box">
								<div class="mail-text h-200">
									<div class="summernote">
										<br/>
										<br/>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group  row"><label class="col-sm-2 col-form-label">正常</label>

							<div class="col-sm-10"><input type="text" class="form-control"></div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group  row"><label class="col-sm-2 col-form-label">正常</label>

							<div class="col-sm-10"><input type="text" class="form-control"></div>
						</div>
						<div class="hr-line-dashed"></div>
						<div class="form-group row">
							<div class="col-sm-4 col-sm-offset-2">
								<button class="btn btn-white btn-sm" type="submit">取消</button>
								<button class="btn btn-primary btn-sm" type="submit">保存更改</button>
							</div>
						</div>
					</form>
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
