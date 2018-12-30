<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="utf-8">
 <!-- 配置文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
<jsp:include page="top.jsp"></jsp:include>
		<div class="row top4">
					<div class="col-md-2">
						<div id="mobile-menu" class="mobile-nav visible-xs visible-sm">
							<nav class="navbar navbar-default">
							  <div class="container-fluid">
							    <!-- Brand and toggle get grouped for better mobile display -->
							    <div class="navbar-header">
							      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
							        <span class="sr-only">Toggle navigation</span>
							        <span class="icon-bar"></span>
							        <span class="icon-bar"></span>
							        <span class="icon-bar"></span>
							      </button>
							      <a class="navbar-brand" href="index.jsp">左侧菜单</a>
							    </div>
							    <!-- Collect the nav links, forms, and other content for toggling -->
							    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
							      <ul class="nav navbar-nav">
							         <li class="active"><a href="<%=path%>/showMyArea">教学信息管理</a></li>
									 <li><a href="<%=path%>/showTeachResourceManager">教学资源管理</a></li>
									 <li><a href="<%=path%>/showReplyStudent">回复学生问题</a></li>
							      </ul>
							    </div><!-- /.navbar-collapse -->
							  </div><!-- /.container-fluid -->
							</nav>
						</div>
						<ul class="nav nav-pills nav-stacked visible-lg visible-md">
						  <li role="presentation" class="active"><a href="<%=path%>/showMyArea">教学信息管理</a></li>
						  <li role="presentation"><a href="<%=path%>/showTeachResourceManager"">教学资源管理</a></li>
						  <li role="presentation"><a href="<%=path%>/showReplyStudent">回复学生问题</a></li>
						</ul>
					</div>
					<div class="col-md-10">
					    <div class="row">
					    	<div class="col-md-12">
					    		 <p>
								  <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
								  		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								  </button>
								  <button type="button" id="deleteBtn" class="btn btn-default btn-sm">
								  		<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
								  </button>
								  <button type="button" id="updateBtn" class="btn btn-default btn-sm">
								  		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								  </button>
								</p>
								<!-- Modal -->
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">教学信息管理</h4>
									      </div>
									      <div class="modal-body">
									           <div class="row">
										          	<div class="col-md-12">
										          		<form>
														  <div class="form-group">
														    <label for="title">标题:</label>
														    <input type="text" class="form-control" id="ntitle" placeholder="教学信息标题">
														    <input type="hidden" id="nId"/>
														  </div>
														  <div class="form-group">
														  	 <h6>内容:</h6>
														  	  <script id="myContainer" name="nContent" type="text/plain">
   															  </script>
														  </div>
														</form>
										          	</div>
										          </div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									        <button type="button"  id="addSubmit" class="btn btn-primary">完成</button>
									      </div>
									    </div>
									  </div>
									</div>
					    	</div>
					    	<div class="col-md-12">
					    		<table id="teachInfoTable">
					    		</table>
					    	</div>	
					    </div>
					</div>
				</div>
<script type="text/javascript">
		$(function(){
			var param = 0 ;
			 var ue = UE.getEditor('myContainer');
			 var anRow;
			 $("#updateBtn").click(function(){
				 var selectArray = $('#teachInfoTable').bootstrapTable('getSelections');
				 if(selectArray.length == 1){
					 param = 1;
					 anRow = selectArray[0];
					 $("#addSubmit").attr("param","1");
					 $('#myModal').modal('show');
				 }else{
					 showMsg("操作错误","编辑只能选择一行");
				 }
			 })
			 $("#deleteBtn").click(function(){
				 var selectArray = $('#teachInfoTable').bootstrapTable('getSelections');
				 if(selectArray.length < 1){
					 showMsg("操作错误","请选择删除行");
				 }else{
					 var selectArray = $('#teachInfoTable').bootstrapTable('getSelections');
					 var ids ="";
					 for(var i = 0;i < selectArray.length;i++){
						 ids += selectArray[i].nId+",";
					 }
					 ids = ids.substring(0,ids.length-1);
					 $.post("<%=path%>/noticeController/deleteNotices",{"ids":ids},function(data){
							if(data.resultType == "1"){
								var opt = {
								        url: "<%=path%>/noticeController/getNoticeData",
								        silent: true,
								    };
							    $('#teachInfoTable').bootstrapTable('refresh',opt);
								showMsg("提示","删除成功");
							}else{
								showMsg("提示","删除失败，请与管理员联系");
							}
						},"json");
				 }
			 })
			 $('#myModal').on('show.bs.modal', function (e) {
				  if(param == 1){
					  $("#ntitle").val(anRow.nTitle);
					  $("#nId").val(anRow.nId);
					  ue.setContent(anRow.nContent);
					  param = 0;
				  }else{
					  $("#ntitle").val("");
					  ue.setContent("");
				  }
			 })
			$("#addSubmit").click(function(){
				var title = $("#ntitle").val();
				var content = ue.getContent();
				if($("#addSubmit").attr("param") != '1'){
					$.post("<%=path%>/noticeController/addNotice",{"nTitle":title,"nContent":content},function(data){
						if(data.resultType == "1"){
							$('#myModal').modal('hide');
							var opt = {
							        url: "<%=path%>/noticeController/getNoticeData",
							        silent: true,
							    };
						    $('#teachInfoTable').bootstrapTable('refresh',opt);
							showMsg("提示","添加成功");
						}else{
							showMsg("提示","添加失败，请与管理员联系");
						}
					},"json");
				}else{
					var nId = $("#nId").val();
					$.post("<%=path%>/noticeController/updateNotice",{"nId":nId,"nTitle":title,"nContent":content},function(data){
						if(data.resultType == "1"){
							$('#myModal').modal('hide');
							var opt = {
							        url: "<%=path%>/noticeController/getNoticeData",
							        silent: true,
							    };
						    $('#teachInfoTable').bootstrapTable('refresh',opt);
							showMsg("提示","更改成功");
						}else{
							showMsg("提示","更改失败，请与管理员联系");
						}
					},"json");
				}
			})
			$("#teachInfoTable").bootstrapTable({
			      url: '<%=path%>/noticeController/getNoticeData',
			      method: 'post',
			      classes:'table table-hover table-bordered ',
			      cache: false,//禁用缓存
			      pagination: true,//启动分页
			     // showPaginationSwitch:true,
			      onlyInfoPagination:false,
			      pageNumber: 1,//初始化table时显示的页码
			      pageSize: 15,//每页条目
			      dataType:'json',
			      sidePagination:'server',
			      sortable:false,
			      queryParams: queryParams,
			      sortable: false,//排序
			      idField: 'nId',//key值栏位
			    onLoadSuccess:function(){
			    	$("#teachInfoTable").bootstrapTable('uncheckAll');
			    	$("#teachInfoTable").bootstrapTable('hideColumn','nId');
			    },
			    columns:[{  
			        field: 'checkbox',  
			        checkbox:true
			    },{  
			        field: 'nId',  
			        title: '编号' ,
			    },{  
			        field: 'nTitle',  
			        title: '标题' ,
			        width:'70%',
			    },{  
			        field: 'nTimeStr',  
			        title: '发表时间' ,
			         align:'center'  
			    },]
			   });
	    })
		function queryParams(params) { //配置参数 
		var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
		limit: params.limit, //页面大小 
		offset: params.offset, //页码 
		}; 
		return temp; 
		} 
</script>
<jsp:include page="footer.jsp"></jsp:include>
