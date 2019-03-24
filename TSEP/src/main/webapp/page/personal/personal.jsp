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
<link href="<%=basePath%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=basePath%>css/animate.css" rel="stylesheet">
<link href="<%=basePath%>css/iframe/style.css" rel="stylesheet">
</head>
<style>
.content-tabs {
	border-bottom: solid 1px #e7eaec !important;
}

.fixed-nav .navbar-brand {
	background: #1ab394;
	color: #fff;
	padding: 15px 25px;
	font-size: 18px;
	line-height: 31px;
}

.daohang>li>a {
	color: #676a6c;
}

.nav.navbar-right>li>a {
	color: #676a6c;
}
</style>
<body class="fixed-nav">

	<div id="wrapper">

		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<img alt="image" class="rounded-circle"
								src="<%=basePath%>img/profile_small.jpg" /> <a
								data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
								class="block m-t-xs font-bold">个人中心</span> <!-- 	<span class="text-muted text-xs block">menu <b class="caret"></b></span> -->
							</a>
							<!-- <ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="dropdown-item" href="login.html">Logout</a></li>
							</ul> -->
						</div>
						<!-- <div class="logo-element">IN+</div> -->
					</li>
					<li class="active"><a class="J_menuItem"
						href="<%=basePath%>page/personal/myinfo.jsp"> <i class="fa fa-user-circle"></i> <span
							class="nav-label">个人信息</span>
					</a></li>
					<li><a class="J_menuItem" href="<%=basePath%>page/personal/my_operation.jsp"> <i
							class="fa fa-star-o"></i> <span class="nav-label">全部动态</span>
					</a></li>
					<li><a class="J_menuItem" href="minor.html"> <i
							class="fa fa-th-large"></i> <span class="nav-label">Minor
								view</span>
					</a></li>
				</ul>

			</div>
		</nav>

		<div id="page-wrapper" class="white-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-fixed-top white-bg" role="navigation">
					<!-- <div class="navbar-header">
						
						 <a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"> <i class="fa fa-bars"></i>
						</a>
						<form role="search" class="navbar-form-custom" method="post"
							action="#">
							<div class="form-group">
								<input type="text" placeholder="Search for something..."
									class="form-control" name="top-search" id="top-search">
							</div>
						</form>
					</div>	 -->
					<a href="#" class="navbar-brand">师生交流平台</a>
					<ul class="daohang nav navbar-nav mr-auto"
						style="flex-direction: row">
						<li class=""><a class="active_s" aria-expanded="false"
							role="button" href="<%=basePath%>index.jsp"> 首页</a></li>
						<li><a aria-expanded="false" role="button"
							href="<%=basePath%>page/question/question.jsp">学习专区</a></li>
						<li><a aria-expanded="false" role="button"
							href="<%=basePath%>page/teaching_resources/teaching_resources.jsp">教学资源</a></li>
						<li><a aria-expanded="false" role="button"
							href="<%=basePath%>page/chat/chat.jsp">在线交流</a></li>
						<li><a aria-expanded="false" role="button"
							href="<%=basePath%>page/joke_board/joke_board.jsp">搞笑便签</a></li>
						<li><a aria-expanded="false" role="button"
							style="color:#19aa8d"
							href="<%=basePath%>page/personal/personal.jsp">个人中心</a></li>
					</ul>
					<ul class="nav navbar-top-links navbar-right">
						<li style="padding: 20px"><span
							class="m-r-sm text-muted welcome-message">欢迎来到师生交流平台</span></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
								<span class="label label-warning">16</span>
						</a>
							<ul class="dropdown-menu dropdown-messages dropdown-menu-right">
								<li>
									<div class="dropdown-messages-box">
										<a class="dropdown-item float-left" href="profile.html"> <img
											alt="image" class="rounded-circle"
											src="<%=basePath%>img/a7.jpg">
										</a>
										<div class="media-body">
											<small class="float-right">46 小时前</small> <strong>小明</strong>
											评论了 <strong>小红</strong>. <br> <small class="text-muted">2017.10.06
												7:58</small>
										</div>
									</div>
								</li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a class="dropdown-item float-left" href="profile.html"> <img
											alt="image" class="rounded-circle"
											src="<%=basePath%>img/a4.jpg">
										</a>
										<div class="media-body ">
											<small class="float-right text-navy">5 小时前</small> <strong>小红</strong>
											打电话给了 <strong>小黑</strong>. <br> <small
												class="text-muted">2017.10.06 7:58</small>
										</div>
									</div>
								</li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a class="dropdown-item float-left" href="profile.html"> <img
											alt="image" class="rounded-circle"
											src="<%=basePath%>img/profile.jpg">
										</a>
										<div class="media-body ">
											<small class="float-right">23 小时前</small> <strong>小黑</strong>
											点赞了 <strong>小红</strong>. <br> <small class="text-muted">2017.10.06
												7:58</small>
										</div>
									</div>
								</li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="text-center link-block">
										<a href="mailbox.html" class="dropdown-item"> <i
											class="fa fa-envelope"></i> <strong>阅读所有消息</strong>
										</a>
									</div>
								</li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
								class="label label-primary">8</span>
						</a>
							<ul class="dropdown-menu dropdown-alerts"
								style="margin-left: -680%;">
								<li><a href="mailbox.html" class="dropdown-item">
										<div>
											<i class="fa fa-envelope fa-fw"></i> 你有16条消息 <span
												class="float-right text-muted small">4 分钟前</span>
										</div>
								</a></li>
								<li class="dropdown-divider"></li>
								<li><a href="profile.html" class="dropdown-item">
										<div>
											<i class="fa fa-twitter fa-fw"></i> 3 个新的关注者 <span
												class="float-right text-muted small">12 分钟前</span>
										</div>
								</a></li>
								<li class="dropdown-divider"></li>
								<li><a href="grid_options.html" class="dropdown-item">
										<div>
											<i class="fa fa-upload fa-fw"></i> 重启服务器 <span
												class="float-right text-muted small">4 分钟前</span>
										</div>
								</a></li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="text-center link-block">
										<a href="notifications.html" class="dropdown-item"> <strong>查看所有信息</strong>
											<i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul></li>


						<li><a href="<%=basePath%>/login.jsp"> <i class="fa fa-sign-out"></i>
								注销
						</a></li>
					</ul>

				</nav>
			</div>
			<div class="row content-tabs"></div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="<%=basePath%>page/personal/myinfo.jsp" frameborder="0" data-id="<%=basePath%>page/personal/myinfo.jsp"
					seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					10GB of <strong>250GB</strong> Free.
				</div>
				<div>
					<strong>Copyright</strong> Example Company &copy; 2014-2018
				</div>
			</div>

		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
	<script src="<%=basePath%>js/popper.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=basePath%>js/iframe/contabs.js"></script>
	<!-- Custom and plugin javascript -->
	<script src="<%=basePath%>js/inspinia.js"></script>
	<script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>
</body>

</html>
