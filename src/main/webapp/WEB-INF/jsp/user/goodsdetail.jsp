<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/7/11
  Time: 12:48
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
    <title>商品详情</title>
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
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">

                <!-- 表单嵌套表格：规范表单格式 -->
                <h4 class="modal-title" >以下是商品详情：</h4>
            </div>
            <hr>
            <div class="modal-body">
                <table class="table table-striped table-hover" >
                    <tbody>
                    <tr>
                        <th colspan="15" style='vertical-align: middle;text-align: center;'>商品名</th>
                        <th colspan="5" rowspan="2" style='vertical-align: middle;text-align: center;'>No.${goodsdetail.goodsId}<span style="padding:2px 2px 4px 6px;position:absolute;right:0px;top:0px;border-bottom-left-radius:8px;color:white;background: #4487DF;">活动促销</span>
                        </th>
                    </tr>
                    <tr>

                        <th colspan="15" style='vertical-align: middle;text-align: center;color: grey '>${goodsdetail.goodsName}</th>

                    </tr>
                    <tr>
                        <th colspan="15"style='vertical-align: middle;text-align: center;' >商品描述</th>
                        <th colspan="5" rowspan="6" style='vertical-align: middle;text-align: center;'><img src="${goodsdetail.picUrl}" height="200px" width="300px"  style="margin: auto">
                        </th>
                    </tr>
                    <tr>
                        <th colspan="5" style='vertical-align: middle;text-align: center;color: grey'>${goodsdetail.goodsDescription}</th>
                    </tr>
                    <tr>
                        <th colspan="5"style='vertical-align: middle;text-align: center;' >商品详情</th>
                    </tr>
                    <tr>
                        <th colspan="5" style='vertical-align: middle;text-align: center;color: grey'>${goodsdetail.goodsDetail}</th>
                    </tr>
                    <tr>
                        <th colspan="5" style='vertical-align: middle;text-align: center;'>商品价格</th>
                    </tr>
                    <tr>
                        <th colspan="5" style='vertical-align: middle;text-align: center;color: grey'>${goodsdetail.goodsPrice}</th>
                    </tr>




                    </tbody>
                </table>

                <form method="post" action="addcart.do" class="form-horizontal">
                    <input type="hidden"  id="goodsId" name="goodsId" value="${goodsdetail.goodsId}">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-5">
                            <input type="number" step="1"  class="form-control" id="num" name="num" value="1"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-warning" >加入购物车</button>
                        </div>
                    </div>

                </form>
                <h4>评论区</h4>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover"
                               id="dataTables-example">
                            <thead>
                            <tr>
                                <th>用户昵称</th>
                                <th>星级</th>
                                <th>评价</th>
                                <th>发布时间</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty comments }">
                                <c:forEach var="comment" items="${comments}">
                                    <tr>
                                        <td>${comment.user_nickname }</td>

                                        <c:choose>
                                            <c:when test="${comment.star==1}">
                                                <td>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                </td>
                                            </c:when>
                                            <c:when test="${comment.star==2}">
                                                <td>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                </td>
                                            </c:when>
                                            <c:when test="${comment.star==3}">
                                                <td>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                </td>
                                            </c:when>
                                            <c:when test="${comment.star==4}">
                                                <td>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star-empty" style="color:navy"></span>
                                                </td>
                                            </c:when>
                                            <c:when test="${comment.star==5}">
                                                <td>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                    <span class="glyphicon glyphicon-star" style="color:navy"></span>
                                                </td>
                                            </c:when>
                                        </c:choose>

                                        <td>${comment.content}</td>
                                        <td>${comment.gmt_create }</td>
<%--                                        <td><fmt:formatDate value="${comment.gmt_creat }" pattern="yyyy-MM-dd"/></td>--%>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>


            </div>

        </div>
    </div>
</div>

</body>



</html>
