<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/7/10
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ;
    String basePathManager = basePath + "manager/";
%>
<html>
<head>
    <title>我的购物车</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta content="" name="description"/>
    <meta content="webthemez" name="author"/>
    <jsp:include page="/part/manager.css.jsp"></jsp:include>
</head>
<body>
<div id="wrapper">
    <!--头部：页面标题栏-->
    <jsp:include page="/part/user/manager.header.jsp"></jsp:include>
    <!--导航栏：页面菜单栏-->
    <jsp:include page="/part/user/manager.menu.jsp"></jsp:include>
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
                            <font size="4">购物车</font>
                            <a href="<%=basePath%>mycart.do">
                                <span class="glyphicon glyphicon-repeat"></span>
                            </a>

                        </div>
                        <!-- 面板体放：表格内容，按照dataTable格式来构造-->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <form action="addManyOrders.do" method="post">
                                <table class="table table-striped table-bordered table-hover"
                                       id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>购物篮编号</th>
                                        <th>商品名称</th>
                                        <th>商品个数</th>
                                        <th>商品单价</th>
                                        <th>商品总价</th>
                                        <th>详情</th>
                                        <th>购买</th>
                                        <th>删除</th>
                                        <th>我全都要</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty carItem }">
                                        <c:forEach var="object" items="${carItem}">
                                            <tr>
                                                <td>${object.cart_item_id }</td>
                                                <td>${object.goods_name }</td>
                                                <td>${object.number}</td>
                                                <td>${object.goods_price}</td>
                                                <td>${object.goods_price*object.number}</td>
                                                <c:choose>
                                                    <c:when test="${object.is_check==1}">
                                                        <td>未购买</td>

                                                        <td><a href="addOrder.do?cartId=${object.cart_item_id}">
                                                    <span class="glyphicon glyphicon-shopping-cart"
                                                          style="color:darkblue"></span>
                                                        </a></td>
                                                    </c:when>
                                                    <c:when test="${object.is_check==2}">
                                                        <td>已购买</td>
                                                        <td>
                                                    <span class="glyphicon glyphicon-shopping-cart"
                                                          style="color:grey"></span>
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                                <td><a href="javascript:doDelete(${object.cart_item_id })"
                                                       style="color:red">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </a></td>
                                                <c:choose>
                                                <c:when test="${object.is_check==1}">
                                                <td>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="${object.cart_item_id }"
                                                                   name="idList">
                                                        </label>
                                                    </div>
                                                </td>
                                                </c:when>
                                                    <c:when test="${object.is_check==2}">
                                                        <td>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" value="${object.cart_item_id }"
                                                                           name="idList" disabled="disabled">
                                                                </label>
                                                            </div>
                                                        </td>
                                                    </c:when>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                    </tbody>
                                </table>
                                <hr>
                                <div class="col-sm-offset-11 col-sm-10">
                                    <button type="submit" class="btn btn-primary">我全都要</button>
                                </div>
                                <hr>
                                </form>
                            </div>
                        </div>

                        <!-- /.modal-dialog -->
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">

    function doDelete(gid) {
        if (confirm("您确定要删除编号为：" + gid + "的购物篮吗？")) {
            location.href = "<%=basePath%>removeCart.do?cartId=" + gid;
        }
    }
</script>
</html>
