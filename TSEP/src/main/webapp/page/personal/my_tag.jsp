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

<title>个人标签管理</title>

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link
	href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.css"
	rel="stylesheet">

<link href="<%=basePath%>css/animate.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">

</head>
<style>
.bootstrap-table {
	height: 350px;
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
								<h5>个人标签管理</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										<!-- </a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
										<i class="fa fa-wrench"></i>
									</a> --> <!-- <ul class="dropdown-menu dropdown-user">
										<li><a href="#" class="dropdown-item">选项 1</a></li>
										<li><a href="#" class="dropdown-item">选项 2</a></li>
									</ul> --> <a class="close-link"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content">
								<div class="fixed-table-toolbar">
									<div class="columns pull-left">
										<button type="button" class="btn  btn-primary"
											data-toggle="modal" data-target="#tag_model">
											<i class="fa fa-plus" aria-hidden="true"></i>添加
										</button>
									</div>
									<div class="modal inmodal fade" id="tag_model" tabindex="-1"
										role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header" style="padding: 10px 15px;">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">Close</span>
													</button>
													<p class="modal-title" style="text-align:left;font-size:18px">标签</p>
												</div>
												<div class="modal-body">
													<div class="col-md-10">
														<input id="tagName" type="text"
															class="form-control" placeholder="标签名称">
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-white"
														data-dismiss="modal">关闭</button>
													<button type="button" class="btn btn-primary" id="addSubmitBtn">保存</button>
												</div>
											</div>
										</div>
									</div>
									<div class="columns pull-right">
										<button class="btn btn-success" onclick="reLoad()">查询</button>
									</div>
									<div class="columns pull-right col-md-2 nopadding">
										<input  type="text" id="tagNameSearch" class="form-control"
											placeholder="标签名称查询">
									</div>
								</div>
								<table id="tagTable" data-mobile-responsive="true">
								</table>
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
	<script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<script
		src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=basePath%>js/inspinia.js"></script>
	<script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>

	<!-- Page-Level Scripts -->
	<script>
		function load() {
			$('#tagTable').bootstrapTable(
				{
					method : 'post', // 服务器数据的请求方式 get or post
					url : "<%=basePath%>/tag/list", // 服务器数据的加载地址
					//	showRefresh : true,
					//	showToggle : true,
					//	showColumns : true,
					iconSize : 'outline',
					toolbar : '#exampleToolbar',
					striped : true, // 设置为true会有隔行变色效果
					dataType : "json", // 服务器返回的数据类型
					pagination : true, // 设置为true会在底部显示分页条
					// queryParamsType : "limit",
					// //设置为limit则会发送符合RESTFull格式的参数
					singleSelect : false, // 设置为true将禁止多选
					// contentType : "application/x-www-form-urlencoded",
					// //发送到服务器的数据编码类型
					pageSize : 10, // 如果设置了分页，每页数据条数
					pageNumber : 1, // 如果设置了分布，首页页码
					//search : true, // 是否显示搜索框
					showColumns : false, // 是否显示内容下拉框（选择显示的列）
					sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
					queryParams : function(params) {
						return {
							//说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
							limit : params.limit,
							offset : params.offset
						};
					},
					// //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
					// queryParamsType = 'limit' ,返回参数必须包含
					// limit, offset, search, sort, order 否则, 需要包含:
					// pageSize, pageNumber, searchText, sortName,
					// sortOrder.
					// 返回false将会终止请求
					uniqueId : 'id',
					columns : [
	
						{
							field : 'tagName',
							title : '标签'
						},
						{
							title : '操作',
							field : 'id',
							align : 'center',
							formatter : function(value, row, index) {
								var e = '<a class="btn btn-primary btn-sm" href="#" mce_href="#" title="编辑" onclick="edit(\''
									+ row.id
									+ '\')"><i class="fa fa-edit"></i></a> ';
								var d = '<a class="btn btn-warning btn-sm" href="#" title="删除"  mce_href="#" onclick="remove(\''
									+ row.id
									+ '\')"><i class="fa fa-remove"></i></a> ';
								var f = '<a class="btn btn-success btn-sm" href="#" title="备用"  mce_href="#" onclick="resetPwd(\''
									+ row.id
									+ '\')"><i class="fa fa-key"></i></a> ';
								return d;
							}
						} ]
				});
		}
		function reLoad() {
					$('#tagTable').bootstrapTable('refresh',{query:{
						tagName : $('#tagNameSearch').val()
					}});
					$('#tagNameSearch').val("");
			/* $('#tagTable').bootstrapTable('destroy');
			load(); */
		}
		$(document).ready(function() {
			load();
		});
		
		function remove(id){
			$.post("<%=basePath%>tag/delete",{"id":id},function(data){
				if(data.resultType = '0000'){
					/* $('#tagTable').bootstrapTable('refresh',{query:{
						tagName : $('#tagNameSearch').val()
					}}); */
					$('#tagTable').bootstrapTable('destroy');
					load();
				}else{
					 toastr.options = {
	   						  "closeButton": true,
	   						  "debug": false,
	   						  "progressBar": true,
	   						  "preventDuplicates": true,
	   						  "positionClass": "toast-bottom-right",
	   						  "onclick": null,
	   						  "showDuration": "400",
	   						  "hideDuration": "1000",
	   						  "timeOut": "7000",
	   						  "extendedTimeOut": "1000",
	   						  "showEasing": "swing",
	   						  "hideEasing": "linear",
	   						  "showMethod": "fadeIn",
	   						  "hideMethod": "fadeOut"
	   						};
	   				 	toastr['warning'](data.resultContent,'标签操作');
				}
			},"json");
		}
		$(function() {
			$("#addSubmitBtn").click(function(){
				var tagName = $("#tagName").val();
				$.post("<%=basePath%>tag/add",{"tagName":tagName},function(data){
					if(data.resultType = '0000'){
						$('#tagTable').bootstrapTable('refresh',{query:{
							tagName : $('#tagNameSearch').val()
						}});
						$("#tag_model").modal('hide');
					}else{
						 toastr.options = {
		   						  "closeButton": true,
		   						  "debug": false,
		   						  "progressBar": true,
		   						  "preventDuplicates": true,
		   						  "positionClass": "toast-bottom-right",
		   						  "onclick": null,
		   						  "showDuration": "400",
		   						  "hideDuration": "1000",
		   						  "timeOut": "7000",
		   						  "extendedTimeOut": "1000",
		   						  "showEasing": "swing",
		   						  "hideEasing": "linear",
		   						  "showMethod": "fadeIn",
		   						  "hideMethod": "fadeOut"
		   						};
		   				 	toastr['warning'](data.resultContent,'标签操作');
					}
				},"json");
			})			
		})
	</script>

</body>

</html>

