<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="footer">
	<div class="float-right">
		<strong>师生交流平台</strong>
	</div>
	<div>
		<strong>Copyright</strong> 王景龙-毕业设计 &copy; 2019
	</div>
</div>

</div>
</div>
<!-- Mainly scripts -->
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>js/popper.min.js"></script>
<script src="<%=basePath%>js/bootstrap.js"></script>
<script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<%=basePath%>js/inspinia.js"></script>
<script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>

<!-- Flot -->
<script src="<%=basePath%>js/plugins/flot/jquery.flot.js"></script>
<script src="<%=basePath%>js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="<%=basePath%>js/plugins/flot/jquery.flot.resize.js"></script>

<!-- ChartJS-->
<script src="<%=basePath%>js/plugins/chartJs/Chart.min.js"></script>

<!-- Peity -->
<script src="<%=basePath%>js/plugins/peity/jquery.peity.min.js"></script>
<!-- Peity demo -->
<script src="<%=basePath%>js/demo/peity-demo.js"></script>


<script>
	$(document).ready(function() {


		var d1 = [ [ 1262304000000, 6 ], [ 1264982400000, 3057 ], [ 1267401600000, 20434 ], [ 1270080000000, 31982 ], [ 1272672000000, 26602 ], [ 1275350400000, 27826 ], [ 1277942400000, 24302 ], [ 1280620800000, 24237 ], [ 1283299200000, 21004 ], [ 1285891200000, 12144 ], [ 1288569600000, 10577 ], [ 1291161600000, 10295 ] ];
		var d2 = [ [ 1262304000000, 5 ], [ 1264982400000, 200 ], [ 1267401600000, 1605 ], [ 1270080000000, 6129 ], [ 1272672000000, 11643 ], [ 1275350400000, 19055 ], [ 1277942400000, 30062 ], [ 1280620800000, 39197 ], [ 1283299200000, 37000 ], [ 1285891200000, 27000 ], [ 1288569600000, 21000 ], [ 1291161600000, 17000 ] ];

		var data1 = [
			{
				label : "Data 1",
				data : d1,
				color : '#17a084'
			},
			{
				label : "Data 2",
				data : d2,
				color : '#127e68'
			}
		];
		$.plot($("#flot-chart1"), data1, {
			xaxis : {
				tickDecimals : 0
			},
			series : {
				lines : {
					show : true,
					fill : true,
					fillColor : {
						colors : [ {
							opacity : 1
						}, {
							opacity : 1
						} ]
					},
				},
				points : {
					width : 0.1,
					show : false
				},
			},
			grid : {
				show : false,
				borderWidth : 0
			},
			legend : {
				show : false,
			}
		});

		var lineData = {
			labels : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月" ],
			datasets : [
				{
					label : "示例数据集1",
					backgroundColor : "rgba(26,179,148,0.5)",
					borderColor : "rgba(26,179,148,0.7)",
					pointBackgroundColor : "rgba(26,179,148,1)",
					pointBorderColor : "#fff",
					data : [ 48, 48, 60, 39, 56, 37, 30 ]
				},
				{
					label : "示例数据集2",
					backgroundColor : "rgba(220,220,220,0.5)",
					borderColor : "rgba(220,220,220,1)",
					pointBackgroundColor : "rgba(220,220,220,1)",
					pointBorderColor : "#fff",
					data : [ 65, 59, 40, 51, 36, 25, 40 ]
				}
			]
		};

		var lineOptions = {
			responsive : true
		};


		var ctx = document.getElementById("lineChart").getContext("2d");
		new Chart(ctx, {
			type : 'line',
			data : lineData,
			options : lineOptions
		});

	});
</script>

</body>

</html>
