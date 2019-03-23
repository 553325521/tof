<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="/page/tool/top.jsp"></jsp:include>
<div class="wrapper wrapper-content  animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox">
				<div class="ibox-title">
					<h5>问题列表</h5>
					<div class="ibox-tools">
						<a href="" class="btn btn-primary btn-xs">添加新问题</a>
					</div>
				</div>
				<div class="ibox-content">

					<div class="m-b-lg">

						<div class="input-group input-group-sm">
							<input type="text" class="form-control" placeholder="按名称搜索问题...">
							<div class="input-group-append">
								<button class="btn btn-white" type="button">搜索</button>
							</div>
						</div>

						<div class="m-t-md">

							<div class="float-right">
								<button type="button" class="btn btn-sm btn-white">
									<i class="fa fa-comments"></i>
								</button>
								<button type="button" class="btn btn-sm btn-white">
									<i class="fa fa-user"></i>
								</button>
								<button type="button" class="btn btn-sm btn-white">
									<i class="fa fa-list"></i>
								</button>
								<button type="button" class="btn btn-sm btn-white">
									<i class="fa fa-pencil"></i>
								</button>
								<button type="button" class="btn btn-sm btn-white">
									<i class="fa fa-print"></i>
								</button>
								<button type="button" class="btn btn-sm btn-white">
									<i class="fa fa-cogs"></i>
								</button>
							</div>

							<strong>发现61个问题</strong>



						</div>

					</div>

					<div class="table-responsive">
						<table class="table table-hover issue-tracker">
							<tbody>
								<tr>
									<td><span class="label label-primary">添加</span></td>
									<td class="issue-info"><a href="<%=basePath%>page/question/question_detail.jsp">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">0.52,1.041</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-primary">添加</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">3,2</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-primary">添加</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">1,2</span> 1d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-primary">添加</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">4,2</span> 3d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-warning">固定</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">1,2</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-warning">固定</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">3,2</span> 3d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-warning">固定</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">3,2</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-warning">固定</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">3,2</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-warning">固定</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">5,7</span> 4d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-warning">固定</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">2,7</span> 3d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-danger">漏洞</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">0.52,1.041</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-danger">漏洞</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">3,2</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-danger">漏洞</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">1,2</span> 1d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-danger">漏洞</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">4,2</span> 3d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-danger">漏洞</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">1,2</span> 2d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
								<tr>
									<td><span class="label label-danger">漏洞</span></td>
									<td class="issue-info"><a href="#">
											时间从何而来？为什么时间似乎是流动的？ </a> <small>
											在我们看来，宇宙万物皆是永恒变化的，所以我们产生了时间的概念。 </small></td>
									<td>火星一号</td>
									<td>2017.12.12 10:00</td>
									<td><span class="pie">3,2</span> 3d</td>
									<td class="text-right">
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
										<button class="btn btn-white btn-xs">标签</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>


</div>
<jsp:include page="/page/tool/footer.jsp"></jsp:include>
