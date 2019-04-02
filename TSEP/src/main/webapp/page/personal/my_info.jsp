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

<title>个人信息修改</title>

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>css/cropper.min.css" rel="stylesheet">
<link href="<%=basePath%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=basePath%>css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="<%=basePath%>css/animate.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">

<link
	href="<%=basePath%>css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">

</head>
<style>
	.select-bg {
    	background-image:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAAA3NCSVQICAjb4U/gAAAABlBMVEXMzMz////TjRV2AAAACXBIWXMAAArrAAAK6wGCiw1aAAAAHHRFWHRTb2Z0d2FyZQBBZG9iZSBGaXJld29ya3MgQ1M26LyyjAAAABFJREFUCJlj+M/AgBVhF/0PAH6/D/HkDxOGAAAAAElFTkSuQmCC");
	}
</style>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg" style="margin-left:0">
			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox ">
							<div class="ibox-title">
								<h3>个人资料</h3>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
										<i class="fa fa-wrench"></i>
									</a>
									<!-- <ul class="dropdown-menu dropdown-user">
										<li><a href="#" class="dropdown-item">选项 1</a></li>
										<li><a href="#" class="dropdown-item">选项 2</a></li>
									</ul> -->
									<a class="close-link"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content">
								<form method="post" id="modifyForm">
									<div class="form-group  row">
										<div class="col-4">
											<div class="text-center">
												<img alt="image" id="userTx" class="rounded-circle m-t-xs img-fluid"
													src="${sessionScope.SESSION_USER.userTx}">
												<div class="m-t-xs font-bold">
													<a href="#modal-form" data-toggle="modal">修改头像</a>
												</div>
												<div id="modal-form" class="modal fade" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-body">
																<div class="row">
																	<div class="col-sm-6 col-sm-offset-2 select-bg">
																		<img src="" id="photo">
																	</div>
																	<div class="col-sm-2">
																		<label for="file" class="btn btn-danger"> <span>选择图片</span>
																			<input type="file" name="file" id="file"
																			accept="image/gif, image/jpeg, image/png"
																			onchange="changeFile()" class="sr-only">
																		</label>
																		<div>
																			<p>预览(200*200)：</p>
																			<div class="img-preview"></div>
																		</div>
																		<button class="btn btn-primary" type="button"
																			onclick="crop()">裁剪图片</button>
																		<div>
																			<br />
																			<p>结果：</p>
																			<img alt="" src="<%=basePath%>/img/img_bg.png" id="result">
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-4 col-sm-offset-2" style="margin-top: 5%;margin-left: 60%;">
																		<button class="btn btn-white btn-lg" id="closeModifyImg" type="button">取消</button>
																		<button class="btn btn-primary btn-lg" id="modifyTxBtn" type="button">修改</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-8">
											<h3>
												<strong>${sessionScope.SESSION_USER.nickName}</strong>
											</h3>
											<address>
												身份 >>${sessionScope.SESSION_USER.userType == '0' ? '学生':'老师'}<br>
												姓名 >>${sessionScope.SESSION_USER.realName}<br> 
												邮箱>>${sessionScope.SESSION_USER.email}<br> 
												手机>>${sessionScope.SESSION_USER.userPhone == null ? '尚未完善':sessionScope.SESSION_USER.userPhone}<br>
												QQ>>${sessionScope.SESSION_USER.userQq == null ? '尚未完善':sessionScope.SESSION_USER.userQq}<br>
											</address>
											<p>个人简介&nbsp;${sessionScope.SESSION_USER.userIntro == null ? '无':sessionScope.SESSION_USER.userIntro}</p>
										</div>
									</div>
									<h4>
										资料修改<i class="fa fa-pencil fa-fw"></i>
									</h4>
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">昵称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" value="${sessionScope.SESSION_USER.nickName}" id="nickName" name="nickName"/>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">姓名</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" value="${sessionScope.SESSION_USER.realName}" id="realName" name="realName"/>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">邮箱</label>
										<div class="col-sm-10">
											<input type="email" class="form-control" disabled value="${sessionScope.SESSION_USER.email}" id="email" name="email"/>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">手机</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" value="${sessionScope.SESSION_USER.userPhone}" id="userPhone" name="userPhone"/>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">QQ</label>
										<div class="col-sm-10">
											<input type="number" class="form-control" value="${sessionScope.SESSION_USER.userQq}" id="userQq" name="userQq"/>
										</div>
									</div>
									
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">简介</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="3" id="userIntro" name="userIntro" class="userIntro">${sessionScope.SESSION_USER.userIntro}</textarea>
										</div>
									</div>
									<div class="hr-line-dashed"></div>
									<div class="form-group row">
										<div class="col-sm-4 col-sm-offset-2">
											<button class="btn btn-white btn-sm" type="button">取消</button>
											<button class="btn btn-primary btn-sm" type="button" id="saveUpdateBtn">保存更改</button>
										</div>
									</div>
								</form>
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
	<script src="<%=basePath%>js/cropper.min.js"></script>
	<script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=basePath%>js/inspinia.js"></script>
	<script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>
	<!-- iCheck -->
	<script src="<%=basePath%>js/plugins/iCheck/icheck.min.js"></script>
	<script>
	var uploadedImageURL = undefined;
	// 修改自官方demo的js
	var initCropper = function(img, input) {
		var $image = img;
		var options = {
			aspectRatio : 1, // 纵横比
			viewMode : 2,
			preview : '.img-preview' // 预览图的class名
		};
		$image.cropper(options);
		var $inputImage = input;
		var uploadedImageURL;
		if (URL) {
			// 给input添加监听

		} else {
			$inputImage.prop('disabled', true).addClass('disabled');
		}
	}
	var crop = function() {
		var $image = $('#photo');
		var $target = $('#result');
		$image.cropper('getCroppedCanvas', {
			width : 200, // 裁剪后的长宽
			height : 200
		}).toBlob(function(blob) {
			// 裁剪后将图片放到指定标签
			$target.attr('src', URL.createObjectURL(blob));
		});
	}
	function changeFile() {
		var options = {
			aspectRatio : 1, // 纵横比
			viewMode : 2,
			preview : '.img-preview' // 预览图的class名
		};
		var $image = $('#photo');
		var $inputImage = $('#file');
		var files = $inputImage[0].files;
		var file;
		/* if (!$image.data('cropper')) {
			return;
		} */
		if (files && files.length) {
			file = files[0];
			// 判断是否是图像文件
			if (/^image\/\w+$/.test(file.type)) {
				// 如果URL已存在就先释放
				if (uploadedImageURL) {
					URL.revokeObjectURL(uploadedImageURL);
				}
				uploadedImageURL = URL.createObjectURL(file);
				// 销毁cropper后更改src属性再重新创建cropper
				$image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
				$inputImage.val('');
			} else {
				window.alert('请选择一个图像文件！');
			}
		}
	}
		$(document).ready(function() {
			initCropper($('#photo'), $('#file'));
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});
			$('#closeModifyImg').click(function(){
				$("#modal-form").modal('hide');
			});
			$('#modifyTxBtn').click(function(){
				var cas = $('#photo').cropper('getCroppedCanvas');
				var base64url = cas.toDataURL('image/jpeg');
				$("#userTx").attr("src",base64url);
				$("#modal-form").modal('hide');
			})
			$('#saveUpdateBtn').click(function(){
				var param = $("#modifyForm").serialize();
				console.info(param);
				$.post("<%=basePath%>/user/modifyMyInfo",param,function(data){
					
				},"json");
			})
		});
	</script>
</body>

</html>


