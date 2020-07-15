<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/7/9
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";;
    String basePathManager = basePath + "manager/";
%>
<html>
<head>
    <title>商店</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="" name="description" />
    <meta content="webthemez" name="author" />
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
                            <font size="4">商品</font>
                            <a href="<%=basePath%>shopmall.do">
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
                                        <th>商品编号</th>
                                        <th>商品名称</th>
                                        <th>商品描述</th>
                                        <th>商品单价</th>
                                        <th>详情</th>
                                        <th>加入购物车</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty list }">
                                        <c:forEach var="goods" items="${list }">
                                            <tr>
                                                <td>${goods.goodsId }</td>
                                                <td>${goods.goodsName }</td>
                                                <td>${goods.goodsDescription}</td>
                                                <td>${goods.goodsPrice}</td>

                                                <td><a  href="goodsDetail.do?goodsId=${goods.goodsId }"  >
                                                    <span class="glyphicon glyphicon-bookmark"></span>
                                                </a></td>
                                                <td><a id="addcart" href="#" data-toggle="modal" data-target="#myModalcart" onclick="addCart(this)">
                                                    <span class="glyphicon glyphicon-shopping-cart" style="color:darkblue"></span>
                                                </a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="myModalcart" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <!-- 表单嵌套表格：规范表单格式 -->
                                    <h4 class="modal-title" id="myModalLabel">请选择您想加入购物车的数量：</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="addcart.do" method="post">
                                        <input type="hidden"  id="goodsId" name="goodsId">
                                        <input type="number" step="1"  class="form-control" id="num" name="num" value="1"/>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">加入购物车</button>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!--End dataTables -->
                    <!-- 按钮触发模态框 -->
                    <!-- 模态框（Modal） myModal-->

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function addCart(object) {
        var goodsInfo = object.parentNode.parentNode.childNodes;
        console.log(goodsInfo);
        $("#goodsId").val(goodsInfo[1].innerHTML);

    }


</script>
</html>
