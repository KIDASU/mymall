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
<title>客户管理</title>
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
								<span style="font-size: medium; ">客户管理</span>
								<a href="<%=basePath%>showuser.do">
									<span class="glyphicon glyphicon-repeat"></span>
								</a>
								<span style="float: right">
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="modal" data-target="#myModal" onclick="editInfo(this,0)">
										<span class="glyphicon glyphicon-plane"></span> 新增客户
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
												<th>客户编号</th>
												<th>客户密码</th>
												<th>客户姓名</th>
												<th>客户电话</th>
												<th>客户性别</th>
												<th>客户生日</th>
												<th>客户昵称</th>
												<th>客户地址</th>
												<th>修改</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty list }">
												<c:forEach var="user" items="${list }">
													<tr>
														<td>${user.userId }</td>
														<td>${user.userPassword }</td>
														<td>${user.userName }</td>
														<td>${user.userMobile  }</td>
														<td>${user.userGender }</td>
														<td><fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/></td>
														<td>${user.userNickname }</td>
														<td>${user.userAddress }</td>
														<td><a id="edit" href="#" data-toggle="modal" data-target="#myModal" onclick="editInfo(this,1)">
															<span class="glyphicon glyphicon-edit"></span>
														</a></td>
														<td><a href="javascript:doDelete(${user.userId })" style="color:red">
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
											<input type="hidden" id="userId" name="userId" class="form-control">
											<div class="form-group">
												<table class="table" style="font: '微软雅黑 Light';">
													<thead>
														<tr>
															<th>客户信息：</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><b>客户密码</b></td>
															<td><input type="text" id="userPassword" name="userPassword" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>客户姓名:</b></td>
															<td><input type="text" id="userName" name="userName" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>客户电话:</b></td>
															<td><input type="text" id="userMobile" name="userMobile" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>客户性别：</b></td>
															<td><select id="userGender" name="userGender" class="form-control">
																<option>male</option>
																<option>female</option>
															</select>
															</td>
														</tr>
														<tr>
															<td><b>客户生日:</b></td>
															<td><input type="date" id="userBirthday" name="userBirthday" class="form-control"/></td>
														</tr>

														<tr>
															<td><b>客户昵称:</b></td>
															<td><input type="text" id="userNickname" name="userNickname" class="form-control"/></td>
														</tr>
														<tr>
															<td><b>客户地址</b></td>
															<td><input type="text" id="userAddress" name="userAddress" class="form-control"/></td>
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
			$("#editForm").attr("action","<%=basePath%>adduser.do");
		}else{
			$("#editForm").attr("action","<%=basePath%>modifyuser.do");
			var userInfo = obj.parentNode.parentNode.childNodes;
			console.log(userInfo);
			$("#userId").val(userInfo[1].innerHTML);
			$("#userPassword").val(userInfo[3].innerHTML);
			$("#userName").val(userInfo[5].innerHTML);
			$("#userMobile").val(userInfo[7].innerHTML);
			$("#userGender").val(userInfo[9].innerHTML);
			$("#userBirthday").val(userInfo[11].innerHTML);
			$("#userNickname").val(userInfo[13].innerHTML);
			$("#userAddress").val(userInfo[15].innerHTML);
		}
	}
	
	function doDelete(userId){
		if(confirm("您确定要删除编号为："+userId+"的用户吗？")){
			location.href="<%=basePath%>removeuser.do?userId="+userId;
		}
	}
</script>
</html>