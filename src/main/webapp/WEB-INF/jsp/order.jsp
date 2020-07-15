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
<title>订单管理</title>
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
					<div class="col-md-12">
						<!-- start dataTables -->
						<!-- 表格格式：面板中嵌套表格 -->
						<div class="panel panel-default">
							<!-- 面板头放：页面标题，刷新按钮，添加按钮 -->
							<div class="panel-heading">
								<font size="4">订单管理</font> 
								<a href="<%=basePath%>showorder.do"> 
									<span class="glyphicon glyphicon-repeat"></span>
								</a>
							</div>
							<!-- 面板体放：表格内容，按照dataTable格式来构造-->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>订单编号</th>
												<th>订单总价</th>
												<th>订单状态</th>
												<th>收货人</th>
												<th>联系方式</th>
												<th>地址</th>
												<th>订单详情</th>
												<th>修改</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty list }">
												<c:forEach var="order" items="${list }">
													<tr>
														<td>${order.order_id }</td>
														<td>${order.total_price }</td>
														<td>${order.status }</td>
														<td>${order.consignee }</td>
														<td>${order.mobile }</td>
														<td>${order.address }</td>
														<td><a id="dl" href="#" data-toggle="modal" data-target="#myModal" onclick="showDetail(${order.order_id})">
															<span class="glyphicon glyphicon-list-alt"></span>
														</a></td>
														<td><a id="edit" href="#" data-toggle="modal" data-target="#myModal2" onclick="editInfo(this)">
															<span class="glyphicon glyphicon-edit"></span>
														</a></td>
														<td><a href="javascript:doDelete(${order.order_id })" style="color:red">
															<span class="glyphicon glyphicon-remove"></span>
														</a></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--End dataTables -->
						<!-- 按钮触发模态框 -->
						<!-- 模态框（Modal） myModal-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title">订单详情：</h4>
										<table class="table" style="font: '黑体';">
											<thead>
												<tr>
													<th>订单编号</th>
													<th>详单编号</th>
													<th>商品单价</th>
													<th>购买数量</th>
													<th>商品总价</th>
												</tr>
											</thead>
											<tbody id="detail">
												<!-- 用Ajax获取的数据，来填充表格内容 -->
											</tbody>
										</table>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.modal-dialog -->
						</div>
						
						<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<!-- 表单嵌套表格：规范表单格式 -->
										<form action="" method="post" role="form" id="editForm">
											<input type="hidden" id="orderId" name="orderId" class="form-control">
											<div class="form-group">
												<table class="table" style="font: '微软雅黑 Light';">
													<thead>
														<tr>
															<th>订单信息：</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><b>订单状态:</b></td>
															<td><input type="text" id="status" name="status" class="form-control"/></td>
														</tr>
													</tbody>
												</table>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
													<input type="submit" value="提交" class="btn btn-primary">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- /.modal-dialog -->
						</div>
						
						<!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function showDetail(oid){
		$.get("<%=basePath%>adminshowdetail.do?oid="+oid,function(data){
			$("#detail").empty();
			//console.log(data);
			$.each(data, function() {
				$("#detail").append("<tr><td>"+this.order_id+"</td><td>"+this.order_item_id+"</td><td>"+this.price+"</td><td>"+this.number+"</td><td>"+this.deal_price+"</td><tr>")
			})
		});
	}
	
	function editInfo(obj){
			$("#editForm").attr("action","<%=basePath%>modifyorder.do");
			var orderInfo = obj.parentNode.parentNode.childNodes;
			console.log(orderInfo)
			$("#orderId").val(orderInfo[1].innerHTML);
			$("#status").val(orderInfo[5].innerHTML);
	}
	
	function doDelete(oid){
		if(confirm("您确定要删除编号为:"+oid+"的订单吗")){
			location.href="<%=basePath%>removeorder.do?oid="+oid;
		}
	}
</script>
</html>