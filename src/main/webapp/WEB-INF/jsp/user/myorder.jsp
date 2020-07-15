<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/7/10
  Time: 18:46
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
    <title>我的订单</title>
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
                            <font size="4">订单</font>
                            <a href="<%=basePath%>myorder.do">
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
                                        <th>收件人</th>
                                        <th>订单地址</th>
                                        <th>订单价格</th>
                                        <th>订单状态</th>
                                        <th>订单创建时间</th>
                                        <th>订单详情</th>
                                        <th>操作</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty order }">
                                        <c:forEach var="order" items="${order}">
                                            <tr>
                                                <td>${order.orderId }</td>
                                                <td>${order.consignee }</td>
                                                <td>${order.address}</td>
                                                <td>${order.totalPrice}</td>
                                                <c:choose>
                                                    <c:when test="${order.status==1}">
                                                        <td style="color: #ac2925 ">待支付</td>
                                                    </c:when>
                                                    <c:when test="${order.status==2}">
                                                        <td style="color: limegreen">待评价</td>
                                                    </c:when>
                                                    <c:when test="${order.status==3}">
                                                        <td style="color: #017ebc">已完成</td>
                                                    </c:when>
                                                </c:choose>
                                                <td><fmt:formatDate value="${order.creatDate }"
                                                                    pattern="yyyy-MM-dd"/></td>

                                                <td><a id="edit" href="#" data-toggle="modal" data-target="#myModal"
                                                       onclick="itemInfo(${order.orderId})">
                                                    <span class="glyphicon glyphicon-bookmark"></span>
                                                </a></td>

                                                <c:choose>
                                                    <c:when test="${order.status==1}">
                                                        <td><a id="pay" href="#" data-toggle="modal"
                                                               data-target="#myModalpay" onclick="pay(this)">
                                                    <span class="glyphicon glyphicon-shopping-cart"
                                                          style="color: #ac2925 ">支付</span>
                                                        </a></td>
                                                    </c:when>
                                                    <c:when test="${order.status==2}">
                                                        <td><a id="comment"   href="mycomment.do?orderId=${order.orderId }">
                                                    <span class="glyphicon glyphicon-comment"
                                                          style="color: limegreen ">评价</span>
                                                        </a></td>
                                                    </c:when>
                                                    <c:when test="${order.status==3}">

                                                        <td><a href="#">
                                                    <span class="glyphicon glyphicon-floppy-saved"
                                                          style="color: #017ebc ">已完成</span>
                                                        </a></td>

                                                    </c:when>
                                                </c:choose>


                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="update_modal">
                        <div class="modal fade" id="myModalcommentList" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">×
                                        </button>
                                        <!-- 表单嵌套表格：规范表单格式 -->
                                        <h4 class="modal-title">订单详情：</h4>
                                        <input type="hidden" id="">
                                        <table class="table" >
                                            <thead>
                                            <tr>
                                                <th>详单编号</th>
                                                <th>商品编号</th>
                                                <th>商品名称</th>
                                                <th>购买数量</th>
                                                <th>商品单价</th>
                                                <th>单笔总价</th>

                                            </tr>
                                            </thead>
                                            <tbody >

                                            <tr id="detail2">

                                            </tr>

                                            </tbody>
                                        </table>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="update_modal">
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">×
                                        </button>
                                        <!-- 表单嵌套表格：规范表单格式 -->
                                        <h4 class="modal-title">订单详情：</h4>
                                        <table class="table" >
                                            <thead>
                                            <tr>
                                                <th>详单编号</th>
                                                <th>商品名称</th>
                                                <th>购买数量</th>
                                                <th>商品单价</th>
                                                <th>单笔总价</th>
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
                        </div>
                    <div class="update_modal">
                    <div class="modal fade" id="myModalpay" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×
                                    </button>
                                    <!-- 表单嵌套表格：规范表单格式 -->
                                    <h4 class="modal-title" id="myModalLabel">请选择您的支付方式</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="pay.do" method="post">
                                        <input type="hidden" id="orderId" name="orderId">
                                        <div class="form-inline">
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            <button type="submit" class="btn btn-primary">支付宝</button>
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            <button type="submit" class="btn btn-success">微信</button>
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            <button type="submit" class="btn btn-danger">palpay</button>
                                        </div>
<hr>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                        <!-- /.modal-dialog -->
                    </div>
                        </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">

    function pay(object) {
        var goodsInfo = object.parentNode.parentNode.childNodes;
        console.log(goodsInfo);
        $("#orderId").val(goodsInfo[1].innerHTML);

    }

    function itemInfo(oid){
        $.get("<%=basePath%>showdetail.do?orderId="+oid,function(data){
            $("#detail").empty();
            console.log(data);
            $.each(data, function() {
                $("#detail").append("<tr><td>"+this.order_item_id+"</td><td>"+this.goods_name+"</td><td>"+this.number+"</td><td>"+this.price+"</td><td>"+this.price*this.number+"</td><tr>")
            })
        });
    }




</script>


</html>