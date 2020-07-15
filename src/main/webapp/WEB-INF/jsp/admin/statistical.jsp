<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";;
	String basePathManager = basePath + "manager/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>统计信息</title>
<jsp:include page="/part/manager.css.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<!--头部：页面标题栏-->
		<jsp:include page="/part/admin/manager.header.jsp"></jsp:include>
		<!--导航栏：页面菜单栏-->
		<jsp:include page="/part/admin/manager.menu.jsp"></jsp:include>
		<!--表格-->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">用户性别比例饼图</div>
							<div class="panel-body">
								<div id="gender-pie-echarts" style="width: 470px; height: 300px"></div>
				            </div>
			            </div>
		            </div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">用户年龄分布比例饼图</div>
							<div class="panel-body">
								<div id="birth-pie-echarts" style="width: 470px; height: 300px;"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">每日订单总数条形图</div>
							<div class="panel-body">
								<div id="quantity-bar-echarts" style="width: 470px; height: 300px;"></div>
					        </div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">每日订单总额折线图</div>
							<div class="panel-body">
								<div id="total-line-echarts" style="width: 470px; height: 300px;"></div>
							</div>
						</div>
					</div>
	            </div>
			</div>
		</div>
	<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">
	//图表数据初始化
	var user_gender = new Array();
	var number = new Array();
	var user_genderAndnumber= new Array();
	var date = new Array();
	var quantity = new Array();
	var total = new Array();
	var ageband = new Array();
	var value =new Array();
	var agebangAndvalue = new Array();


	//初始化图表
	var gpeChart = echarts.init(document.getElementById("gender-pie-echarts"));
	var bpeChart = echarts.init(document.getElementById("birth-pie-echarts"));
	var qbeChart = echarts.init(document.getElementById("quantity-bar-echarts"));
	var tleChart = echarts.init(document.getElementById("total-line-echarts"));
	//发起Ajax请求，获取图表数据
	$.get("<%=basePath%>showchart1.do",function (data) {
		$.each(data,function () {
			user_gender.push(this.user_gender);
			number.push(this.number);
			user_genderAndnumber.push({"value":this.number,"name":this.user_gender});
		})
	});

	$.get("<%=basePath%>showchart2.do",function (data) {
		$.each(data, function () {
			ageband.push(this.ageband);
			value.push(this.value);
			agebangAndvalue.push({"value":this.value,"name":this.ageband});
		});
	});
	$.get("<%=basePath%>showchart3.do",function (data) {
		$.each(data,function () {
			date.push(this.date);
			quantity.push(this.quantity);
			total.push(this.total);
	});




	//定义图表配置项
	var gpeOption = {
		tooltip: {
			trigger: 'item',
			formatter: '{a} <br/>{b}: {c} ({d}%)'
		},
		legend: {
			orient: 'vertical',
			left: 10,
			data: user_gender
		},
		series: [
			{
				name: '用户性别比例',
				type: 'pie',
				radius: ['50%', '70%'],
				avoidLabelOverlap: false,
				label: {
					show: false,
					position: 'center'
				},
				emphasis: {
					label: {
						show: true,
						fontSize: '30',
						fontWeight: 'bold'
					}
				},
				labelLine: {
					show: false
				},
				data: user_genderAndnumber
			}
		]
	};

	var bpeOption ={

		tooltip: {
			trigger: 'item',
			formatter: '{a} <br/>{b} : {c} ({d}%)'
		},
		legend: {
			left: 'center',
			top: 'bottom',
			data: ageband
		},


		series: [
			{
				name: '用户年龄分布比例',
				type: 'pie',
				radius: [30, 110],
				center: ['45%', '50%'],
				roseType: 'area',
				label: {
					show: false
				},
				emphasis: {
					label: {
						show: true,
						fontSize: '15',
						fontWeight: 'bold'
					}
				},
				data: agebangAndvalue

			}
		]



	};


	var	qbeOption = {
		tooltip: {
			trigger: 'item',
			formatter: '每日订单总数： <br/>{b}: {c} '
		},
		xAxis: {
			type: 'category',
			data: date
		},
		yAxis: {
			type: 'value'
		},
		series: [{
			data: quantity,
			type: 'bar',
			showBackground: true,
			backgroundStyle: {
				color: 'rgba(220, 220, 220, 0.8)'
			}
		}]
	};
	var tleOption = {
		tooltip: {
			trigger: 'item',
			formatter: '每日订单总额： <br/>{b}: {c} '
		},

		xAxis: {
			type: 'category',
			data: date
		},
		yAxis: {
			type: 'value'
		},
		series: [{
			data: total,
			type: 'line',
			smooth: true
		}]

	};


		//将图表配置项设置入图表对象中
	gpeChart.setOption(gpeOption);
	bpeChart.setOption(bpeOption);
    qbeChart.setOption(qbeOption);
    tleChart.setOption(tleOption);
	});


</script>
</html>