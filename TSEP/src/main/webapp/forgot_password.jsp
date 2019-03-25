<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>忘记密码</title>

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<!-- Toastr style -->
<link href="<%=basePath%>css/plugins/toastr/toastr.min.css" rel="stylesheet">
<link href="<%=basePath%>css/animate.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

	<div class="passwordBox animated fadeInDown">
		<div class="row">

			<div class="col-md-12">
				<div class="ibox-content">

					<h2 class="font-bold">忘记密码</h2>

					<p>输入您的电子邮件地址，您的密码将重置并通过电子邮件发送给您邮件账户。</p>

					<div class="row">

						<div class="col-lg-12">
							<form class="m-t" role="form" id="updatePwdForm">
								<div class="form-group">
									<input type="email" name="email" id="email" class="form-control"
										placeholder="电子邮件地址">
								</div>

								<button type="button" id="updatePwdBtn"
									class="btn btn-primary block full-width m-b">发送新密码</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="float-right">
				<strong>师生交流平台</strong>
			</div>
			<div>
				<strong>Copyright</strong> 王景龙-毕业设计 &copy; 2019
			</div>
		</div>
	</div>
	<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#updatePwdBtn").click(function() {
				var param = $("#updatePwdForm").serialize();
				$.post('<%=basePath%>/updatePwd', param, function(data) {
					if (data.resultType == '0000') {
						location.href = "<%=basePath%>login.jsp";
					} else {
						toastr.options = {
							"closeButton" : true,
							"debug" : false,
							"progressBar" : true,
							"preventDuplicates" : true,
							"positionClass" : "toast-bottom-right",
							"onclick" : null,
							"showDuration" : "400",
							"hideDuration" : "1000",
							"timeOut" : "7000",
							"extendedTimeOut" : "1000",
							"showEasing" : "swing",
							"hideEasing" : "linear",
							"showMethod" : "fadeIn",
							"hideMethod" : "fadeOut"
						};
						toastr['warning'](data.resultContent, data.resultContent);
					}
				}, "json")
			})
		})
	</script>
</body>

</html>

