<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<body>
			<nav class="navbar navbar-default top-navbar" role="navigation" >
				<div class="navbar-header">
					<a class="navbar-brand" href="#" >
						<strong>品牌商城系统</strong>
					</a>
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false" style="color: #1a1a1a ;width: auto" >
							${user.userNickname }
								<img src="https://i2.hdslb.com/bfs/archive/0305bbfb4deba1e0c0a11080e98892f003a951db.jpg@257w_145h_1c_100q.webp" height="20px" width="20px" class="img-rounded">
							<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li>
							<a href="<%=basePath %>/logout.do"><i class="fa fa-sign-out fa-fw"></i>
								登出
							</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
	</body>
</html>
