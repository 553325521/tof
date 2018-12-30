<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="utf-8">
<style>
	.loginTitle{border:1px lightgray solid}
	.loginContent{border:1px lightgray solid}
</style>
<jsp:include page="top.jsp"></jsp:include>
		<div class="row top4">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<ol class="breadcrumb">
							<li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
							<li><a href="index.jsp">首页</a></li>
							<li class="active">登录</li>
						</ol>
					</div>
			 	</div>
			 	<div class="row loginTitle">
			 		<div class="col-md-2">
			 			<h4>登录</h4>
			 		</div>
			 		<div class="col-md-2 col-md-offset-8">
			 			<h6>没有账号？<a href="<%=path%>/showRegister">立即注册</a></h6>
			 		</div>
			 	</div>
			 	<div class="row loginContent">
			 		<div class="col-md-12">
			 			<div class="row">
			 				<div class="col-md-12 clear"></div>
			 				<div class="col-md-12 clear"></div>
			 				<div class="col-md-12 clear"></div>
			 				<div class="col-md-4 col-md-offset-4">
			 					<div id="loginForm" class="form-horizontal">
			 						  <div class="alert alert-warning alert-dismissible" role="alert">
										  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										  <strong>Error!</strong> <span></span>
									  </div>
									  <div class="form-group">
									    <label for="uname" class="col-sm-3 control-label">用户名:</label>
									     <div class="col-sm-9">
									    	<input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名">
									  	 </div>
									  </div>
									  <div class="form-group">
									    <label for="upwd" class="col-sm-3 control-label">密码:</label>
									    <div class="col-sm-9">
									    	<input type="password" class="form-control" id="upwd" name="upwd" placeholder="请输入密码">
									  	</div>
									  </div>
									  <div class="form-group row">
									  	<div class="col-sm-8 col-sm-offset-4">
									  		<button type="submit" id="loginBtn" class="btn btn-default btn-lg">登录</button>
									  		<span>忘记密码?<a href="updatePwd.jsp">找回密码</a></span>
									  	</div>
									  </div>
								</div>
			 				</div>
			 			</div>
			 		</div>
			 	</div>
			</div>	
		</div>
<script>
	$(function(){
		$(".alert").hide();
		$('#loginForm').bootstrapValidator({
			 message: '输入值不合法',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	uname:{
            		 validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                     }
            	},
            	upwd:{
            		 validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                     }
            	},
            }
		});
		$('#upwd').keydown(function(event){
	        if (event.keyCode == 13) $('#loginBtn').click();
	    });
		$('#loginBtn').click(function(){
			 var bv = $('#loginForm').data('bootstrapValidator');
             bv.validate();
             var flag = false;
             if(bv.isValid()){
            	 var uName = $('#uname').val();
            	 var uPwd = $('#upwd').val();
            	 $.post("<%=path%>/login",{"uName":uName,"uPwd":uPwd},function(data){
            		if(data.resultContent!=null){
            			 $(".alert>span").text(data.resultContent);
                		 $(".alert").show();
            		}else{
            			location.href ="<%=path%>/index.action";
            		} 
            		
            	 },"json");
             }
        	
		})
	})
</script>
<jsp:include page="footer.jsp"></jsp:include>
