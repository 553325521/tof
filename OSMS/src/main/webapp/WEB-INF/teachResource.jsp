<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<style>
 .myInfo{background:url(<%=path%>/img/title.gif) repeat-x;height:40px;}
 span{color:gray}
</style>
<jsp:include page="top.jsp"></jsp:include>
		<div class="row top4">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-12">
								<ol class="breadcrumb">
								  <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
								  <li><a href="#">首页</a></li>
								  <li class="active">教学资源区</li>
								</ol>
							</div>
						</div>
						<div class="row">
						<c:if test="${sessionScope.SESSION_USER != null}">
							<div class="col-md-2">
								<div class="row">
									<div class="col-md-12 myInfo">
										<p>我的信息</p>
									</div>
									<div class="col-md-12">
											<img src="${sessionScope.SESSION_USER.uTx}" class="img-responsive center-block img-rounded" alt="tx"/>
												<div class="clear"></div>
											<p>注册名称: ${sessionScope.SESSION_USER.uName}</p>
									</div>
								</div>
							</div>
							</c:if>
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-12">
										<h3>学习资源</h3>
									</div>
									<div class="col-md-12">
										<table id="resourceTable">
										</table>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
<script>
	$(function(){
		$("#resourceTable").bootstrapTable({
		      url: '<%= path%>/resourceController/getResourceData',
		      method: 'post',
		      classes:'table table-hover table-no-bordered',
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
		      idField: 'resourceId',//key值栏位
			    onLoadSuccess:function(){
			    	$("#resourceTable").bootstrapTable('uncheckAll');
			    	$("#resourceTable").bootstrapTable('hideColumn','resourceId');
			    },
		    columns:[{  
		        field: 'resourceId',  
		        title: '编号' ,
		    },{  
		        field: 'resourceName',  
		        title: '文件名称' ,
		        width:'70%',
		        formatter:function(value,row,index){
		        	return "<span class='glyphicon glyphicon-book' aria-hidden='true'></span>&nbsp;"+value;
		        }
		    },{  
		        field: 'rTimeStr',  
		        title: '上传时间' ,
		         align:'center'  
		    },{  
		        field: '',  
		        title: '操作' ,
		         align:'center',
		         formatter:function(value,row,index){
			        	return '<a href="<%=path%>/resourceController/download?resourceUrl='+row.resourceUrl+'" class="btn btn-default">下载</a>';
			      }
		    }]
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
