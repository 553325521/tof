<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
  </head>
  
  <body>
    	<video id="sound" type="video/mp4" controls="controls" autoplay="autoplay"
       webkit-playsinline="true"    playsinline="true"   heigth="100%"></video>
  </body>
  <script type="text/javascript">
  		$(function(){
  			 //创建XMLHttpRequest对象
  		    var xhr = new XMLHttpRequest();
  		    //配置请求方式、请求地址以及是否同步
  		    xhr.open('POST', '<%=basePath%>getVideoSrc', true);
  		    //设置请求结果类型为blob
  		    xhr.responseType = 'blob';
  		    //请求成功回调函数
  		    xhr.onload = function(e) {
  		        if (this.status == 200) {//请求成功
  		            //获取blob对象
  		            var blob = this.response;
  		            //获取blob对象地址，并把值赋给容器
  		            $("#sound").attr("src", URL.createObjectURL(blob));
  		        }
  		    };
  		    xhr.send();
  		})
  </script>
</html>
