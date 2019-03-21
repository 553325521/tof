<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="/page/tool/top.jsp"></jsp:include>
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox ">
				<div class="ibox-content">

					<strong>在线交流</strong> 可以对一些问题进行现场讨论
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">

			<div class="ibox chat-view">

				<div class="ibox-title">
					<small class="float-right text-muted">最后消息：2017年12月26日星期一
						18:39:23</small> 在线交流
				</div>


				<div class="ibox-content">

					<div class="row">

						<div class="col-md-9 ">
							<div class="chat-discussion">

								<div class="chat-message left">
									<img class="message-avatar" src="<%=basePath%>img/a1.jpg"
										alt="">
									<div class="message">
										<a class="message-author" href="#"> 小明 </a> <span
											class="message-date"> 2017年12月25日星期五 - 11:12:36 </span> <span
											class="message-content"> 聊天互动内容信息 </span>
									</div>
								</div>
								<div class="chat-message right">
									<img class="message-avatar" src="<%=basePath%>img/a4.jpg"
										alt="">
									<div class="message">
										<a class="message-author" href="#"> 小明 </a> <span
											class="message-date"> 2017年12月25日星期五 - 11:12:36 </span> <span
											class="message-content"> 聊天互动内容信息 </span>
									</div>
								</div>
								<div class="chat-message right">
									<img class="message-avatar" src="<%=basePath%>img/a2.jpg"
										alt="">
									<div class="message">
										<a class="message-author" href="#"> 小明 </a> <span
											class="message-date"> 2017年12月25日星期五 - 11:12:36 </span> <span
											class="message-content"> 聊天互动内容信息 </span>
									</div>
								</div>
								<div class="chat-message left">
									<img class="message-avatar" src="<%=basePath%>img/a5.jpg"
										alt="">
									<div class="message">
										<a class="message-author" href="#"> 小明 </a> <span
											class="message-date"> 2017年12月25日星期五 - 11:12:36 </span> <span
											class="message-content"> 聊天互动内容信息 </span>
									</div>
								</div>
								<div class="chat-message right">
									<img class="message-avatar" src="<%=basePath%>img/a6.jpg"
										alt="">
									<div class="message">
										<a class="message-author" href="#"> 小明 </a> <span
											class="message-date"> 2017年12月25日星期五 - 11:12:36 </span> <span
											class="message-content"> 聊天互动内容信息 </span>
									</div>
								</div>

							</div>

						</div>
						<div class="col-md-3">
							<div class="chat-users">


								<div class="users-list">
									<div class="chat-user">
										<img class="chat-avatar" src="<%=basePath%>img/a4.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="<%=basePath%>img/a1.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="float-right label label-primary">在线</span> <img
											class="chat-avatar" src="<%=basePath%>img/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="float-right label label-primary">在线</span> <img
											class="chat-avatar" src="<%=basePath%>img/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="<%=basePath%>img/a5.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="<%=basePath%>img/a6.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="<%=basePath%>img/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="float-right label label-primary">在线</span> <img
											class="chat-avatar" src="<%=basePath%>img/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">小明</a>
										</div>
									</div>


								</div>

							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="chat-message-form">

								<div class="form-group">

									<textarea class="form-control message-input" name="message"
										placeholder="输入聊天消息"></textarea>
								</div>
								<!-- <div class="form-chat">
									<div class="input-group input-group-sm">
											<button class="btn btn-primary" type="button">发送</button>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<div class="row">
		<div class="col-lg-3" style="margin-left: 88%;">
			<button type="button" class="btn btn-w-m btn-primary">发送</button>
		</div>
	</div>

</div>
<jsp:include page="/page/tool/footer.jsp"></jsp:include>