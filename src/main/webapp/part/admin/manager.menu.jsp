<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<body>
	<!--导航栏class="active-menu-->
	<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
	<ul class="nav" id="main-menu">
		<li><a href="<%=basePath %>statistical.do">
		<i class="fa fa-desktop"></i>统计信息</a></li>
		<li><a href="<%=basePath %>showuser.do">
		<i class="fa fa-user"></i>客户管理 </a></li>
		<li><a href="<%=basePath %>showgoods.do">
		<i class="fa fa-shopping-cart"></i>商品管理</a></li>
		<li><a href="<%=basePath %>showorder.do">
		<i class="fa fa-credit-card"></i>订单管理</a></li>
	</ul>
	</div>
	</nav>
	</body>
</html>
