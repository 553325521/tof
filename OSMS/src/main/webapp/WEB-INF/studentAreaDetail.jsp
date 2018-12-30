<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<style>
.all{
	background: white;
}
.question{
	border-bottom: 1px lightgray solid;
}
.louceng{
	border-bottom: 1px lightgray solid;
}
.answer{
	border-bottom: 1px lightgray solid;
}
.center{
	border-left: 1px lightgray solid;
}
p{
color:gray;
}

</style>
   <!-- 配置文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
<jsp:include page="top.jsp"></jsp:include>
		<div class="row top4">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-12">
								<ol class="breadcrumb">
								  <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
								  <li><a href="#">首页</a></li>
								  <li><a href="studentArea">同学交流区</a></li>
								  <li class="active">${requestScope.question.qTitle}</li>
								</ol>
							</div>
						</div>
						<div class="row all">
							<div class="col-md-2">
								<div class="row">
									<div class="col-md-12">
												<img src="${requestScope.askUser.uTx}" class="img-responsive img-circle" alt="tx">
												<div class="clear"></div>
												<h5>提问者:${requestScope.askUser.uName}</h5>
									</div>
								</div>
							</div>
							<div class="col-md-10">
								<div class="row center">
									<div class="col-md-12 question">
									   <div class="row">
									   		<div class="col-md-12">
												<h4><a href="#">${requestScope.question.qTitle}</a></h4>
											</div>
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-3">
														<p>
															<span class="glyphicon glyphicon-user" aria-hidden="true"></span>${requestScope.askUser.uName}&nbsp;
															<span class="glyphicon glyphicon-time" aria-hidden="true"></span>${requestScope.question.qTimeStr}&nbsp;
														</p>
													</div>
													<div class="col-md-1">
														<p>
															<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
															<span>${requestScope.question.qViewCount}</span>
														</p>
													</div>
													<div class="col-md-1">
														<p>
															<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
															<span id="replyCount">${requestScope.question.qReplyCount}</span>
														</p>
													</div>
													<div class="col-md-1 col-md-offset-6">
														<p>楼主</p>
													</div>
												</div>
											</div>
											<div class="col-md-12">
												<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />
											</div>
											<div class="col-md-12">
												${requestScope.question.qContent}
											</div>
											<div class="col-md-12">
												<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />
											</div>
											<div class="col-md-12">
												<a class="btn btn-default" id="toReply" role="button">回复&nbsp;<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
											</div>
											<div class="col-md-12 clear"></div>
									   </div>
									</div>
									<div class="col-md-12 louceng">
										<h1 style="color:gray">楼层</h1>
									</div>
									<div class="col-md-12 sendReplyArea">
										<div class="row">
											<div class="col-md-12 clear"></div>
											<div class="col-md-1 col-md-offset-11">
												<button type="button" id="toTop" class="btn btn-danger">返回顶部</button>
											</div>
											<div class="col-md-8">
												<script id="myContainer" name="content" type="text/plain">
   												</script>
											</div>
											<div class="col-md-12 clear"></div>
											<div class="col-md-12">
												<button type="button" id="sendReply" class="btn btn-info">发表回复</button>
											</div>
											<div class="col-md-12 clear"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
<script>
    var ue = UE.getEditor('myContainer');
    function confirmQuestion(rId){
    	var qId = ${requestScope.question.qId};
    	$.post("<%=path%>/questionController/confirmBestResult",{"rId":rId,"qId":qId},function(data){
			if(data.resultType == "1"){
				showMsg("提示","确认成功");
				location.reload();
			}else{
				showMsg("提示","确认失败，请与管理员联系");
			}
		},"json");
    }
    /* 加载回复数 */
    function getReplyCount(){
    	var rQId = ${requestScope.question.qId};
    	$.post("<%=path%>/replyController/getReplyCountByQId",{"qId":rQId},function(data){
    			$("#replyCount").text(data);
    	},"json");
    	}
    getReplyCount();
    /* 加载回复 */
    function getReplyData(){
    	var rQId = ${requestScope.question.qId};
    	var currentUserId = "${sessionScope.SESSION_USER.uId != null ? sessionScope.SESSION_USER.uId : "" }";
    	var qRid = "${requestScope.question.qRid != null ? requestScope.question.qRid : ""}";
    	var askUId = ${requestScope.askUser.uId};
    	$.post("<%=path%>/replyController/getReplyData",{"rQId":rQId},function(data){
    	  if(data.length > 0){
    		var j = data.length;
    		$.each( data, function(i, n){
    			if(currentUserId == askUId && qRid ==""){
    				$(".louceng").after('<div class="col-md-12 answer">'
 						   +'<div class="row">'
 								+'<div class="col-md-12">'
 									+'<div class="row">'
 										+'<div class="col-md-12 clear"></div>'
 										+'<div class="col-md-3">'
 											+'<p>'
 												+'<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'+n.uName+'&nbsp;'
 												+'<span class="glyphicon glyphicon-time" aria-hidden="true"></span>'+n.rTimeStr+'&nbsp;'
 											+'</p>'
 										+'</div>'
 										+'<div class="col-md-1 col-md-offset-8">'
 											+'<p>'+j+'#</p>'
 										+'</div>'
 									+'</div>'
 								+'</div>'
 								+'<div class="col-md-12">'
 									+'<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
 								+'</div>'
 								+'<div class="col-md-12">'
 									+n.rContent
 								+'</div>'
 								+'<div class="col-md-12">'
									+'<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
								+'</div>'
								+'<div class="col-md-12 col-md-offset-10">'
									+'<button class="btn btn-default" type="button" onclick="confirmQuestion('+n.rId+')" >选为最佳答案</button>'
								+'</div>'
								+'<div class="col-md-12 clear"></div>'
 						   +'</div>'
 				+'</div>'
     					);
    			}else if(qRid != ""){
    				if(qRid == n.rId){
    					$(".louceng").after('<div class="col-md-12 answer">'
    	 						   +'<div class="row">'
    	 								+'<div class="col-md-12">'
    	 									+'<div class="row">'
    	 										+'<div class="col-md-12 clear"></div>'
    	 										+'<div class="col-md-3">'
    	 											+'<p>'
    	 												+'<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'+n.uName+'&nbsp;'
    	 												+'<span class="glyphicon glyphicon-time" aria-hidden="true"></span>'+n.rTimeStr+'&nbsp;'
    	 											+'</p>'
    	 										+'</div>'
    	 										+'<div class="col-md-1 col-md-offset-8">'
    	 											+'<p>'+j+'#</p>'
    	 										+'</div>'
    	 									+'</div>'
    	 								+'</div>'
    	 								+'<div class="col-md-12">'
    	 									+'<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
    	 								+'</div>'
    	 								+'<div class="col-md-12">'
    	 								   +'<div class="row"><div class="col-md-10">'
    	 								  +n.rContent  
    	 								   +'</div><div  class="col-md-2">'
    	 								   +'<img src="<%=path%>/img/bestAnswer.gif"  class="img-responsive" alt="bestAnsWer">'
    	 								   +'</div></div>'
    	 									 
    	 								+'</div>'
    	 						   +'</div>'
    	 				+'</div>'
    	     					);
    				}else{
    					$(".louceng").after('<div class="col-md-12 answer">'
    	  						   +'<div class="row">'
    	  								+'<div class="col-md-12">'
    	  									+'<div class="row">'
    	  										+'<div class="col-md-12 clear"></div>'
    	  										+'<div class="col-md-3">'
    	  											+'<p>'
    	  												+'<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'+n.uName+'&nbsp;'
    	  												+'<span class="glyphicon glyphicon-time" aria-hidden="true"></span>'+n.rTimeStr+'&nbsp;'
    	  											+'</p>'
    	  										+'</div>'
    	  										+'<div class="col-md-1 col-md-offset-8">'
    	  											+'<p>'+j+'#</p>'
    	  										+'</div>'
    	  									+'</div>'
    	  								+'</div>'
    	  								+'<div class="col-md-12">'
    	  									+'<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
    	  								+'</div>'
    	  								+'<div class="col-md-12">'
    	  									+n.rContent
    	  								+'</div>'
    	  						   +'</div>'
    	  				+'</div>'
    	      					);
    				}
    				
    			}else{
    				$(".louceng").after('<div class="col-md-12 answer">'
  						   +'<div class="row">'
  								+'<div class="col-md-12">'
  									+'<div class="row">'
  										+'<div class="col-md-12 clear"></div>'
  										+'<div class="col-md-3">'
  											+'<p>'
  												+'<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'+n.uName+'&nbsp;'
  												+'<span class="glyphicon glyphicon-time" aria-hidden="true"></span>'+n.rTimeStr+'&nbsp;'
  											+'</p>'
  										+'</div>'
  										+'<div class="col-md-1 col-md-offset-8">'
  											+'<p>'+j+'#</p>'
  										+'</div>'
  									+'</div>'
  								+'</div>'
  								+'<div class="col-md-12">'
  									+'<hr style="height:1px;border:none;border-top:1px dashed lightgray;" />'
  								+'</div>'
  								+'<div class="col-md-12">'
  									+n.rContent
  								+'</div>'
  						   +'</div>'
  				+'</div>'
      					);
    			}
    			
    			j--;
    		});
    	 }else{
    		 $(".louceng").after('<div class="col-md-12 answer"><h1 style="color:lightgray">没有回复信息</h1></div>');
    	 }
    	},"json");
    }
    getReplyData();
	$(function(){
		$("#toReply").click(function(){
			$('html, body, .container').animate({scrollTop: $(document).height()}, 'slow'); 
			return false; 
		})
		$("#toTop").click(function(){
			$('html, body').animate({scrollTop:0}, 'slow'); 
			return false; 
		})
		$("#sendReply").click(function(){
			var rQId = ${requestScope.question.qId};
			var rContent = ue.getContent();
			 $.post("<%=path%>/replyController/sendReply",{"rQId":rQId,"rContent":rContent},function(data){
				 if(data.resultContent != "未登录"){
					 $(".answer").remove();
					 getReplyData();
					 getReplyCount();
					 ue.setContent("");
				 }else{
					 location.href="<%=path%>/showLogin";
				 }
			 },"json");
		})
	})
</script>
<jsp:include page="footer.jsp"></jsp:include>
