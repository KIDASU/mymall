<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>商品管理</title>
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
								<font size="4">商品管理</font> 
								<a href="<%=basePath%>showgoods.do"> 
									<span class="glyphicon glyphicon-repeat"></span>
								</a>
								<span style="float: right">
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="modal" data-target="#myModal" onclick="editInfo(this,0)">
										<span class="glyphicon glyphicon-plane"></span> 上架商品
									</button>
								</span>
							</div>
							<!-- 面板体放：表格内容，按照dataTable格式来构造-->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>商品编号</th>
												<th>商品名称</th>
												<th>商品单价</th>
												<th>商品描述</th>
												<th>商品详情</th>
												<th>修改</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty list }">
												<c:forEach var="goods" items="${list }">
													<tr>
														<td>${goods.goodsId }</td>
														<td>${goods.goodsName }</td>
														<td>${goods.goodsPrice}</td>
														<td>${goods.goodsDescription }</td>
														<td>${goods.goodsDetail}</td>
														<td><a id="edit" href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(this,1)">
															<span class="glyphicon glyphicon-edit"></span>
														</a></td>
														<td><a href="javascript:doDelete(${goods.goodsId })" style="color:red">
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
										<!-- 表单嵌套表格：规范表单格式 -->
										<form action="" method="post" role="form" id="editForm">
											<input type="hidden" id="goodsId" name="goodsId" class="form-control">
											<div class="form-group">
												<table class="table" style="font: '微软雅黑 Light';">
													<thead>
														<tr>
															<th>商品信息：</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><b>商品名称:</b></td>
															<td><input type="text" id="goodsName" name="goodsName" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>商品单价：</b></td>
															<td><input type="number" id="goodsPrice" name="goodsPrice" step="0.01"
																maxlength="10" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>商品描述</b></td>
															<td><input type="text" id="goodsDescription" name="goodsDescription" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>商品详情</b></td>
															<td><input type="text" id="goodsDetail" name="goodsDetail" class="form-control"/></td>
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
	function editInfo(obj,flag){
		if(flag==0){
			//$(".form-control").val("");
			$("#editForm").get(0).reset();
			$("#editForm").attr("action","<%=basePath%>addgoods.do");
		}else{
			$("#editForm").attr("action","<%=basePath%>modifygoods.do");
 			var goodsInfo = obj.parentNode.parentNode.childNodes;
			console.log(goodsInfo);
			$("#goodsId").val(goodsInfo[1].innerHTML);
			$("#goodsName").val(goodsInfo[3].innerHTML);
			$("#goodsPrice").val(goodsInfo[5].innerHTML);
			$("#goodsDescription").val(goodsInfo[7].innerHTML);
			$("#goodsDetail").val(goodsInfo[9].innerHTML);  
		}
	}
	
	function doDelete(goodsId){
		if(confirm("您确定要删除编号为："+goodsId+"的商品吗？")){
			location.href="<%=basePath%>removegoods.do?goodsId="+goodsId;
		}
	}
</script>
</html>