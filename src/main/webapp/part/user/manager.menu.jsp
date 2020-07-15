<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<body>
<!--导航栏class="active-menu-->
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li><a href="<%=basePath %>showinfo.do">
                <i class="fa fa-user"></i>个人信息管理</a></li>
            <li><a href="<%=basePath %>shopmall.do">
                <i class="fa fa-desktop"></i>商城 </a></li>
            <li><a href="<%=basePath %>mycart.do">
                <i class="fa fa-shopping-cart"></i>我的购物车</a></li>
            <li><a href="<%=basePath %>myorder.do">
                <i class="fa fa-credit-card"></i>我的订单</a></li>
        </ul>
    </div>
</nav>
</body>
</html>
