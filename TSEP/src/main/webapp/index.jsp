<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="page/tool/top.jsp"></jsp:include>
<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-lg-4">
			<div class="ibox ">
				<div class="ibox-title">
					<span class="label label-success float-right">总</span>
					<h5>浏览量</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">1026</h1>
					<div class="stat-percent font-bold text-success">
						<i class="fa fa-level-up"></i>
					</div>
					<small>总浏览量</small>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="ibox ">
				<div class="ibox-title">
					<span class="label label-info float-right">总</span>
					<h5>问题</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">1523</h1>
					<div class="stat-percent font-bold text-info">
						<i class="fa fa-level-up"></i>
					</div>
					<small>发表数量</small>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="ibox ">
				<div class="ibox-title">
					<span class="label label-primary float-right">总</span>
					<h5>阅读</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">1222</h1>
					<div class="stat-percent font-bold text-navy">
						<i class="fa fa-level-up"></i>
					</div>
					<small>阅读数量</small>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-8">
			<div class="ibox ">
				<div class="ibox-title">
					<h5>最近提问</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content table-responsive">
					<table class="table table-hover no-margins">
						<thead>
							<tr>
								<th>标题</th>
								<th>日期</th>
								<th>作者</th>
								<th>访问量</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 11:20</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 24%</td>
							</tr>
							<tr>
								<td><span class="label label-warning">已取消</span></td>
								<td><i class="fa fa-clock-o"></i> 10:40</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 66%</td>
							</tr>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 01:30</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 54%</td>
							</tr>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 02:20</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 12%</td>
							</tr>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 09:40</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 22%</td>
							</tr>
							<tr>
								<td><span class="label label-primary">已完成</span></td>
								<td><i class="fa fa-clock-o"></i> 04:10</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 66%</td>
							</tr>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 12:08</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 23%</td>
							</tr>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 12:08</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 23%</td>
							</tr>
							<tr>
								<td><small>进行中...</small></td>
								<td><i class="fa fa-clock-o"></i> 12:08</td>
								<td>小明</td>
								<td class="text-navy"><i class="fa fa-level-up"></i> 23%</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-lg-4">
			<div class="ibox ">
				<div class="ibox-title">
					<h5>最新消息</h5>
					<div class="ibox-tools">
						<span class="label label-warning-light float-right">10条消息未读</span>
					</div>
				</div>
				<div class="ibox-content">

					<div>
						<div class="feed-activity-list">

							<div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/profile.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right">5分钟</small> <strong>小王</strong>
									晚上要一起去吃饭吗 <br> <small class="text-muted">2017.12.12
										12:00</small>

								</div>
							</div>

							<div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/a2.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right">2个月</small> <strong>小王</strong> 查看了
									<strong>晚上睡觉有必要把路由器关掉么？</strong><br> <small
										class="text-muted">2017.12.12 12:00</small>
								</div>
							</div>
							<div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/a3.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right">2小时</small> <strong>小王</strong> 查看了
									<strong>晚上睡觉有必要把路由器关掉么？</strong>.<br> <small
										class="text-muted">2017.12.12 12:00</small>
								</div>
							</div>
							<!-- <div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/a4.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right text-navy">5小时</small> <strong>小王</strong>
									查看了 <strong>晚上睡觉有必要把路由器关掉么？</strong><br> <small
										class="text-muted">2017.12.12 12:00</small>
									<div class="actions">
										<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i>
											赞 </a> <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i>
											喜欢</a>
									</div>
								</div>
							</div> -->
							<!-- <div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/a5.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right">2小时</small> <strong>小王</strong> 评论了
									<strong>晚上睡觉有必要把路由器关掉么？</strong><br> <small
										class="text-muted">2017.12.12 12:00</small>
									<div class="well">
										人生就好像你搭乘一辆火车，沿途有不同的景色，不同的站台，和不同的人上车，也会过了这个景点到下一个景点，到下一个站台，不同的人上下车，那些都是过客，重要的是自己的旅程。
									</div>
									<div class="float-right">
										<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i>
											赞 </a>
									</div>
								</div>
							</div> -->
							<div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/profile.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right">23h ago</small> <strong>小王</strong>
									评论了 <strong>晚上睡觉有必要把路由器关掉么？</strong><br> <small
										class="text-muted">2017.12.12 12:00</small>
								</div>
							</div>
							<div class="feed-element">
								<a class="float-left" href="profile.html"> <img alt="image"
									class="rounded-circle" src="img/a7.jpg">
								</a>
								<div class="media-body ">
									<small class="float-right">46h ago</small> <strong>小王</strong>
									评论了 <strong>晚上睡觉有必要把路由器关掉么？</strong><br> <small
										class="text-muted">2017.12.12 12:00</small>
								</div>
							</div>
						</div>

						<button class="btn btn-primary btn-block m-t">
							<i class="fa fa-arrow-down"></i> 加载更多
						</button>

					</div>

				</div>
			</div>

		</div>



	</div>
	<jsp:include page="page/tool/footer.jsp"></jsp:include>