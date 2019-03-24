<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<!-- Toastr style -->
<link href="<%=basePath%>css/plugins/toastr/toastr.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

	<div class="loginColumns animated fadeInDown">
		<div class="row">

			<div class="col-md-6">
				<h2 class="font-bold">师生交流平台</h2>

				<p>土地是以它的肥沃和收获而被估价的；才能也是土地，不过它生产的不是粮食，而是真理。如果只能滋生瞑想和幻想的话，即使再大的才能也只是砂地或盐池，那上面连小草也长不出来的。
				</p>
				<p>—— 别林斯基</p>

			</div>
			<div class="col-md-6">
				<div class="ibox-content">
					<form class="m-t" role="form" id="loginForm">
						<div class="form-group">
							<input type="email" class="form-control" name="email" placeholder="邮箱"
								required="">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="passWord" placeholder="密码"
								required="">
						</div>
						<div class="form-group">
							<select class="form-control m-b" name="attribute2" id="attribute2">
							</select>
						</div>

						<button type="button" id="loginBtn" class="btn btn-primary block full-width m-b">登录</button>

						<!-- <a href="#"> <small>忘记密码?</small>
						</a> -->

						<p class="text-muted text-center">
							<small>还没有账号?</small>
						</p>
						<a class="btn btn-sm btn-white btn-block" href="<%=basePath%>register.jsp">创建一个帐户</a>
					</form>
					<p class="m-t"></p>
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

</body>
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            type : "GET",
            url  : "<%=basePath%>getSubject",
            success: function(result) {
                var htmlappend = '';
             for(var i=0;i<result.length;i++){
              /* htmlappend += '<option value="'+result[i].id+'">'+result[i].subjectName+'</option>'; */
            	 htmlappend += `<option value="${"${result[i].id}"}">${"${result[i].subjectName}"}</option>`;
             }
                $("#attribute2").append(htmlappend);
            }
        });
	});
    $(function(){
    	$("#loginBtn").click(function(){
    		var loginInfo = $("#loginForm").serialize();
    		$.post("<%=basePath%>/login",loginInfo,function(data){
    			 if(data.resultType == '0000'){
    				 location.href="<%=basePath%>index.jsp";
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
   				 	toastr['success'](data.resultContent,'登录失败');
    			 }
    		},"json");
    	})
    })
</script>
</html>

