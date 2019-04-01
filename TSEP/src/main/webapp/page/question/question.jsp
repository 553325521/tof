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
					<h5>文章列表</h5>
					<div class="ibox-tools">
						<a href="<%=basePath%>page/question/question_add.jsp" class="btn btn-primary btn-xs">发表</a>
					</div>
				</div>
				<div class="ibox-content">

					<div class="m-b-lg">

						<div class="input-group input-group-sm">
							<input id="search" type="text" class="form-control" placeholder="按名称搜索...">
							<div class="input-group-append">
								<button class="btn btn-white" type="button" onclick="search()">搜索</button>
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

							<strong id="count"></strong>



						</div>

					</div>

					<div class="table-responsive">
						<table class="table table-hover issue-tracker">
							<tbody id="questionList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/page/tool/footer.jsp"></jsp:include>
<script src="<%=basePath%>js/bootstrap.js"></script>
<script
		src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script
		src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(function() {
        $.ajax({
            type: "GET",
            url: "<%=basePath%>questionlist",
            success: function (result) {
                var htmlappend = '';
                var counthtml = '发现'+result.length+'个问题';
                $("#questionList").append(counthtml);
                for (var i = 0; i < result.length; i++) {
                    htmlappend += '<tr><td>';
                    if(result[i].classify == '问题'){
                    	htmlappend +='<span class="label label-danger">';
                    }else if(result[i].classify == '笔记'){
                    	htmlappend +='<span class="label label-info">';
                    }else if(result[i].classify == '心得'){
                    	htmlappend +='<span class="label label-success">';
                    }else if(result[i].classify == '随笔'){
                    	htmlappend +='<span class="label label-primary">';
                    }else{
                    	htmlappend +='<span class="label label-default">';
                    }
                    htmlappend += result[i].classify+'</span></td>' +
                        '<td class="issue-info"><a href="<%=basePath%>page/question/question_detail.jsp?qId='+result[i].id+'">'+result[i].title+'</a><small></small></td><td>'+result[i].nick_name+'</td>' +
                        '<td>'+result[i].creatTime+'</td><td><span class="pie">'+result[i].difficult+'/100'+'</span> '+result[i].difficult+'d</td>';
                    htmlappend +='<td class="text-right">';
                    if(result[i].tagName!=null && result[i].tagName!=""){
                        var tagName=result[i].tagName.split(",");
                        for(var j=0;j<tagName.length;j++){
                            htmlappend +='<button class="btn btn-white btn-xs">'+tagName[j]+'</button>';
                        }
                        htmlappend +='</td>';
					}
                    htmlappend +='</tr>';
                }
                $("#questionList").append(htmlappend);
                $(".pie").peity("pie");
            }
        });


    });
    function search(){
        $.ajax({
            type: "GET",
            url: "<%=basePath%>questionlist?titleName="+$("#search").val(),
            success: function (result) {
                $("#questionList").html('');
                var htmlappend = '';
                var counthtml = '发现'+result.length+'个问题';
                $("#questionList").append(counthtml);
                for (var i = 0; i < result.length; i++) {
                    htmlappend += '<tr><td>';
                    if(result[i].classify == '问题'){
                        htmlappend +='<span class="label label-danger">';
                    }else if(result[i].classify == '笔记'){
                        htmlappend +='<span class="label label-info">';
                    }else if(result[i].classify == '心得'){
                        htmlappend +='<span class="label label-success">';
                    }else if(result[i].classify == '随笔'){
                        htmlappend +='<span class="label label-primary">';
                    }else{
                        htmlappend +='<span class="label label-default">';
                    }
                    htmlappend += result[i].classify+'</span></td>' +
                        '<td class="issue-info"><a href="<%=basePath%>page/question/question_detail.jsp?qId="'+result[i].id+'>'+result[i].title+'</a><small></small></td><td>'+result[i].nick_name+'</td>' +
                        '<td>'+result[i].creatTime+'</td><td><span class="pie">'+result[i].difficult+'/100'+'</span> '+result[i].difficult+'d</td>';
                    htmlappend +='<td class="text-right">';
                    if(result[i].tagName!=null && result[i].tagName!=""){
                        var tagName=result[i].tagName.split(",");
                        for(var j=0;j<tagName.length;j++){
                            htmlappend +='<button class="btn btn-white btn-xs">'+tagName[j]+'</button>';
                        }
                        htmlappend +='</td>';
                    }
                    htmlappend +='</tr>';
                    <%--htmlappend += `<option value="${"${result[i].id}"}">${"${result[i].subjectName}"}</option>`;--%>
                }
                $("#questionList").append(htmlappend);
                $(".pie").peity("pie");
            }
        });
	}
</script>
