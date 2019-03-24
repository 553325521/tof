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

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>css/cropper.min.css" rel="stylesheet">
<link href="<%=basePath%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=basePath%>css/plugins/steps/jquery.steps.css"
	rel="stylesheet">
<link href="<%=basePath%>css/animate.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">
<link
	href="<%=basePath%>css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
</head>
<style>
.checkbox label::before {
	content: "";
	display: inline-block;
	position: absolute;
	width: 20px;
	height: 20px;
	left: 0;
	margin-left: -20px;
	border: 1px solid #cccccc; <!-- 没选中时的边框颜色-- > border-radius : 3px;
	background-color: #fff; <!-- 没选中时的颜色-- > -webkit-transition : border
	0.15s ease-in-out, color 0.15s ease-in-out;
	-o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
	transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
}

.checkbox label::after {
	display: inline-block;
	position: absolute;
	width: 16px;
	height: 16px;
	left: 0;
	top: 0;
	margin-left: -19px;
	padding-left: 3px;
	padding-top: 1px;
	font-size: 13px;
	color: white;
}

.checkbox input[type="checkbox"], .checkbox input[type="radio"] {
	opacity: 0;
	z-index: 1;
}

.checkbox input[type="checkbox"]:focus+label::before, .checkbox input[type="radio"]:focus+label::before
	{
	outline: thin dotted;
	outline: 5px auto -webkit-focus-ring-color;
	outline-offset: -2px;
	background-color: black;
	border-color: black;
}

.checkbox input[type="checkbox"]:checked+label::before, .checkbox input[type="radio"]:checked+label::before
	{
	background-color: #1ab394;
	/* <!--
	选中后的背景颜色--> */
	border-color: #1ab394;
}

.checkbox input[type="checkbox"]:checked+label::after, .checkbox input[type="radio"]:checked+label::after
	{
	font-family: "FontAwesome";
	content: "\f00c";
}

.checkbox input[type="checkbox"]:disabled+label, .checkbox input[type="radio"]:disabled+label
	{
	opacity: 0.65;
}

.checkbox input[type="checkbox"]:disabled+label::before, .checkbox input[type="radio"]:disabled+label::before
	{
	background-color: #eeeeee;
	cursor: not-allowed;
}

.checkbox.checkbox-circle label::before {
	border-radius: 50%;
}

/* .row {
	margin-bottom: 5px;
} */
#photo {
	max-width: 100%;
}

.img-preview {
	width: 100px;
	height: 100px;
	overflow: hidden;
}

button {
	margin-top: 10px;
}

#result {
	width: 150px;
	height: 150px;
}
</style>
<body>

	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg" style="margin-left:0">
			<div class="loginColumns animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox">
							<!-- <div class="ibox-title">
								<h5>向导与验证</h5>
							</div> -->
							<div class="ibox-content">
								<h2>师生交流平台</h2>
								<p>请按照以下步骤操作，完成注册</p>

								<form id="form" action="#" class="wizard-big">
									<h1>选择身份</h1>
									<fieldset>
										<!-- <h2>选择身份</h2> -->
										<div class="row">
											<div class="col-lg-8">
												<div class="form-group"
													style="margin-top: 20%;margin-left: 20%">
													<div class="checkbox checkbox-circle">
														<input id="radio1" class="styled" checked type="radio"
															name="my_id"> <label for="radio1"
															class="font-bolder"> 我是学生 </label>
													</div>
													<div class="checkbox checkbox-circle">
														<input id="radio2" class="styled" type="radio"
															name="my_id"> <label for="radio2"
															class="font-bolder"> 我是老师 </label>
													</div>

												</div>
												<!-- <div class="form-group">
													<label>密码 *</label> <input id="password" name="password"
														type="text" class="form-control required">
												</div>
												<div class="form-group">
													<label>确认密码 *</label> <input id="confirm" name="confirm"
														type="text" class="form-control required">
												</div> -->
											</div>
											<div class="col-lg-4">
												<div class="text-center">
													<div style="margin-top: 20px">
														<i class="fa fa-sign-in"
															style="font-size: 180px;color: #e5e5e5 "></i>
													</div>
												</div>
											</div>
										</div>

									</fieldset>
									<h1>确认科目</h1>
									<fieldset>
										<!-- <h2>档案信息</h2> -->
										<div class="row">
											<div class="col-lg-8">
												<div class="form-group"
													style="margin-top: 20%;margin-left: 20%">
													<input id="name" name="t_subject" type="text"
														class="form-control required"  placeholder="请输入科目名称">
												</div>
											</div>
											<div class="col-lg-4">
												<div class="text-center">
													<div style="margin-top: 20px">
														<i class="fa fa-sign-in"
															style="font-size: 180px;color: #e5e5e5 "></i>
													</div>
												</div>
											</div>
											<!-- <div class="col-lg-6">
												<div class="form-group">
													<label>电子邮件 *</label> <input id="email" name="email"
														type="text" class="form-control required email">
												</div>
												<div class="form-group">
													<label>地址 *</label> <input id="address" name="address"
														type="text" class="form-control">
												</div>
											</div> -->
										</div>
									</fieldset>

									<h1>输入个人信息</h1>
									<fieldset>
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label>用户名*</label> <input id="username" name="username"
														type="text" class="form-control required">
												</div>

												<div class="form-group">
													<label>密码 *</label> <input id="password" name="password"
														type="password" class="form-control required">
												</div>
												<div class="form-group">
													<label>确认密码 *</label> <input id="confirm" name="confirm"
														type="password" class="form-control required">
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label>昵称*</label> <input id="nickname" name="nickname"
														type="text" class="form-control required">
												</div>
												<div class="form-group">
													<label>真实姓名*</label> <input id="realname" name="realname"
														type="text" class="form-control required">
												</div>
												<div class="form-group">
													<label>邮箱*</label> <input id="email" name="email"
														type="email" class="form-control required">
												</div>
											</div>
										</div>
										<!-- <div class="text-center" style="margin-top: 120px">
											<h2>头像上传</h2>
										</div> -->
									</fieldset>

									<h1>上传头像</h1>
									<fieldset>
										<div class="row">
											<div class="col-sm-12 text-center">
												<label for="file" class="btn btn-danger"> <span>选择图片</span>
													<input type="file" name="file" id="file"
													accept="image/gif, image/jpeg, image/png"
													onchange="changeFile()" class="sr-only">
												</label>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6 col-sm-offset-2">
												<img src="" id="photo">
											</div>
											<div class="col-sm-2">
												<div>
													<p>预览(128*128)：</p>
													<div class="img-preview"></div>
												</div>
												<button class="btn btn-primary" onclick="crop()">裁剪图片</button>
												<div>
													<br />
													<p>结果：</p>
													<img  alt="裁剪结果" id="result">
												</div>
											</div>
										</div>

									</fieldset>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="footer">
				<div class="float-right">
					<strong>师生交流平台</strong>
				</div>
				<div>
					<strong>毕业设计</strong> 师生交流平台 &copy; 2019
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

	<!-- Steps -->
	<script src="<%=basePath%>js/plugins/steps/jquery.steps.min.js"></script>

	<!-- Jquery Validate -->
	<script src="<%=basePath%>js/plugins/validate/jquery.validate.min.js"></script>


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
				width : 300, // 裁剪后的长宽
				height : 300
			}).toBlob(function(blob) {
				// 裁剪后将图片放到指定标签
				$target.attr('src', URL.createObjectURL(blob));
			});
			var cas=$('#photo').cropper('getCroppedCanvas');
	        var base64url=cas.toDataURL('image/jpeg');
	        console.info(base64url);
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
		;
		$(document).ready(function() {
			initCropper($('#photo'), $('#file'));
			$("#wizard").steps();
			$("#form").steps({
				bodyTag : "fieldset",
				onStepChanging : function(event, currentIndex, newIndex) {
					// Always allow going backward even if the current step contains invalid fields!
					if (currentIndex > newIndex) {
						return true;
					}
	
					// Forbid suppressing "Warning" step if the user is to young
					if (newIndex === 3 && Number($("#age").val()) < 18) {
						return false;
					}
	
					var form = $(this);
	
					// Clean up if user went backward before
					if (currentIndex < newIndex) {
						// To remove error styles
						$(".body:eq(" + newIndex + ") label.error", form).remove();
						$(".body:eq(" + newIndex + ") .error", form).removeClass("error");
					}
	
					// Disable validation on fields that are disabled or hidden.
					form.validate().settings.ignore = ":disabled,:hidden";
	
					// Start validation; Prevent going forward if false
					return form.valid();
				},
				onStepChanged : function(event, currentIndex, priorIndex) {
					// Suppress (skip) "Warning" step if the user is old enough.
					if (currentIndex === 2 && Number($("#age").val()) >= 18) {
						$(this).steps("下一个");
					}
	
					// Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
					if (currentIndex === 2 && priorIndex === 3) {
						$(this).steps("上一个");
					}
				},
				onFinishing : function(event, currentIndex) {
					var form = $(this);
	
					// Disable validation on fields that are disabled.
					// At this point it's recommended to do an overall check (mean ignoring only disabled fields)
					form.validate().settings.ignore = ":disabled";
	
					// Start validation; Prevent form submission if false
					return form.valid();
				},
				onFinished : function(event, currentIndex) {
					var form = $(this);
					console.info("finish");
					// Submit form input
					//form.submit();
				}
			}).validate({
				errorPlacement : function(error, element) {
					element.before(error);
				},
				rules : {
					confirm : {
						equalTo : "#password"
					}
				}
			});
		});
	</script>

</body>

</html>

