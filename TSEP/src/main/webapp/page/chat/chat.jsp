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
							<div id="load-friend-icon"
								style="position:absolute;top: 40%;left: 40%;">
								<img style="width:25px;height:25px;"
									src="<%=basePath%>img/icon/load.gif" alt="">
							</div>
							<div class="chat-users">
								<div class="users-list">
									<!-- 好友列表 -->
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
			<button type="button" id="send" class="btn btn-w-m btn-primary">发送</button>
		</div>
	</div>

</div>
<jsp:include page="/page/tool/footer.jsp"></jsp:include>
<script type="text/javascript">
	
	var ws; //一个ws对象就是一个通话管理
	var target = "ws://localhost/TSEP/chat?username=${sessionScope.SESSION_USER.id}-${sessionScope.SESSION_USER.nickName}-${sessionScope.SESSION_USER.userTx}";
	var username = "${sessionScope.SESSION_USER.nickName}";
	//界面离开监听
	<%-- function onbeforeunload_handler() {
		$.post('<%=basePath%>user/accessOrOutChat',{"operation":"out"},function(data){
			ws.send("update_friend_list");
			ws.close();
		},"json");
		
		return "确认退出?";
	} --%>
	<%-- window.onbeforeunload = function() {
		$.post('<%=basePath%>user/accessOrOutChat',{"operation":"out"},function(data){
			ws.send("update_friend_list");
			ws.close();
		},"json");
		return "";
	}; --%>
	window.addEventListener('beforeunload', function (e) {
		
		//debugger;
		$.ajaxSettings.async = false;
		$.post('<%=basePath%>user/accessOrOutChat',{"operation":"out"},function(data){
			var msgObj = {"msgType":"update_friend_list","msgContent":""};
			ws.send(JSON.stringify(msgObj));
			ws.close();
		},"json");
		//console.log(123);
	  // Cancel the event
	  //e.preventDefault();
	  // Chrome requires returnValue to be set
	  //e.returnValue = '';
	});
	//更新好友列表
	function refreshFriendList(){
		$.post('<%=basePath%>user/loadAllFriend',null,function(data){
			$(".users-list").empty();
			for(var i = 0; i < data.length;i++){
				if(data[i].attribute1 == '0'){
					$(".users-list").append(`<div class="chat-user">
							<span class="float-right label label-warning">${"${data[i].attribute3}"}</span> <img
							class="chat-avatar" src="${"${data[i].userTx}"}" alt="">
						<div class="chat-user-name">
							<a href="javascript:void(0)">${"${data[i].nickName}"}</a>
						</div>
					</div>`);
				}else{
					$(".users-list").append(`<div class="chat-user">
							<span class="float-right label label-primary">${"${data[i].attribute3}"}</span> <img
							class="chat-avatar" src="${"${data[i].userTx}"}" alt="">
						<div class="chat-user-name">
							<a href="javascript:void(0)">${"${data[i].nickName}"}</a>
						</div>
					</div>`);
				}
				
			}
			$("#load-friend-icon").css("display","none");
		},"json");
	}
	

	$(function() {
		/* refreshFriendList(); */
		//根据浏览器的不同区创建不同的websocket对象
		if ('WebSocket' in window) {
			ws = new WebSocket(target);
		} else if ('MozWebSocket' in window) {
			ws = new MozWebSocket(target);
		} else {
			alert('WebSocket is not supported by this browser.');
			return;
		}
		/* window.onbeforeunload = onbeforeunload_handler; */
		//发送消息
		ws.onmessage = function(event) {
			var obj = JSON.parse(event.data);
			if(obj.msgType == 'self'){ //第一次进入聊天室(添加动态、更改在线状态)
				$.post('<%=basePath%>user/accessOrOutChat',{"operation":"access"},function(data){
					if(data.resultType == '0000'){
						toastr.options = {
		   						  "closeButton": true,
		   						  "debug": false,
		   						  "progressBar": true,
		   						  "preventDuplicates": true,
		   						  "positionClass": "toast-bottom-right",
		   						  "onclick": null,
		   						  "showDuration": "400",
		   						  "hideDuration": "1000",
		   						  "timeOut": "2000",
		   						  "extendedTimeOut": "1000",
		   						  "showEasing": "swing",
		   						  "hideEasing": "linear",
		   						  "showMethod": "fadeIn",
		   						  "hideMethod": "fadeOut"
		   						};
		   				 	toastr['success']("欢迎"+data.resultContent+"来到聊天室",'聊天室通知');
					}
				},"json");
			}else if(obj.msgType == 'update_friend_list'){
				refreshFriendList();
			}else{
				if (obj.currentUser == username) {
					/* ${sessionScope.SESSION_USER.userTx} */
					$(".chat-discussion").append(`<div class="chat-message right">
							<img class="message-avatar" src="${"${obj.userTx}"}"
							alt="">
						<div class="message">
							<a class="message-author" href="#">${"${obj.currentUser}"}</a> <span
								class="message-date"> ${"${obj.msgTime}"} </span> <span
								class="message-content"> ${"${obj.context}"}  </span>
						</div>
					</div>`);
				} else {
					$(".chat-discussion").append(`<div class="chat-message left">
							<img class="message-avatar" src="${"${obj.userTx}"}"
							alt="">
						<div class="message">
							<a class="message-author" href="#">${"${obj.currentUser}"}</a> <span
								class="message-date"> ${"${obj.msgTime}"} </span> <span
								class="message-content">${"${obj.context}"}</span>
						</div>
					</div>`);
				}
			}
		};
		ws.close = function() {
			//关闭websocket
			ws.close();
		};
		$("#send").click(function() {
			var msgContent = $(".message-input").val();
			var msgObj = {"msgType":"chat_msg","msgContent":msgContent};
			ws.send(JSON.stringify(msgObj));
			$(".message-input").val("");
		})
	})
</script>
