<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/7/13
  Time: 15:15
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
    <title>我的评论</title>
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
                                <form action="mycomment.do" method="post">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>详单编号</th>
                                            <th>商品编号</th>
                                            <th>商品名称</th>
                                            <th>购买数量</th>
                                            <th>商品单价</th>
                                            <th>单笔总价</th>
                                            <th>评论</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty list }">
                                            <c:forEach var="object" items="${list}">
                                                <tr>
                                                    <td>${object.order_item_id }</td>
                                                    <td>${object.goods_id }</td>
                                                    <td>${object.goods_name}</td>
                                                    <td>${object.number}</td>
                                                    <td>${object.price}</td>
                                                    <td>${object.price*object.number}</td>
                                                    <c:choose>
                                                        <c:when test="${object.status==1}">
                                                            <td><button type="button" class="btn btn-success"data-toggle="modal" data-target="#myModalcomment" onclick='addComment(this)'>评价</button></td>


                                                        </c:when>
                                                        <c:when test="${object.status==2}">
                                                            <td><button type="button" class="btn btn-danger" >已评价</button></td>

                                                        </c:when>
                                                    </c:choose>

                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                        </tbody>
                                    </table>

                                </form>
                            </div>
                        </div>
                        <div class="update_modal">
                            <div class="modal fade" id="myModalcomment" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">×
                                            </button>
                                            <!-- 表单嵌套表格：规范表单格式 -->
                                            <h4 class="modal-title" id="ModalLabel">请输入您对这次购物的评价</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form action="addComment.do" method="post">
                                                <input type="hidden" id="goodsId" name="goodsId">
                                                <input type="hidden" id="orderItemId" name="orderItemId">
                                                <h4>请选择星级</h4>
                                                <br>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1"> 1星
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="2"> 2星
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="3"> 3星
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="4"> 4星
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="5"> 5星
                                                </label>
                                                <br>
                                                <h4>我想和其他买家说</h4>
                                                <input type="text"  class="form-control" id="commentDetail" name="commentDetail" />
                                                <hr>
                                                <button type="submit" class="btn btn-primary" >发表评价</button>
                                                <hr>


                                            </form>
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
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function addComment(object) {
        var goodsInfo = object.parentNode.parentNode.childNodes;
        console.log(goodsInfo);
        $("#goodsId").val(goodsInfo[3].innerHTML);
        $("#orderItemId").val(goodsInfo[1].innerHTML);

    }
</script>
</html>
