<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ;
    String basePathManager = basePath + "manager/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta content="" name="description"/>
    <meta content="webthemez" name="author"/>
    <script type="text/javascript">
        var msg = '${msg}';
        if(msg!=""&&msg!=undefined){
            alert(msg);
        }

    </script>
    <title>商品管理</title>
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
                            <font size="4">您的信息如下：</font>
                            <form class="form-horizontal" action="userupdate.do" method="post">
                                <input type="hidden" value="${user.userId}" name="userId">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户名：</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${user.userName}" name="userName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">手机号：</label>
                                    <div class="col-sm-10">
										<input type="text" value="${user.userMobile}" name="userMobile">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别：</label>
                                    <div class="col-sm-10">
										<input type="text" value="${user.userGender}"  name="userGender"/>


                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">生日：</label>
                                    <div class="col-sm-10">
										<input type="date"  value="<fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/>"  name="userBirthday">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">昵称：</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${user.userNickname}" name="userNickname">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">地址：</label>
                                    <div class="col-sm-10">
                                        <input type="text" value="${user.userAddress}" name="userAddress">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default" >更新</button>
                                        <a  >${msg}</a>
                                    </div>
                                </div>
                            </form>



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
    function doDelete(gid) {
        if (confirm("您确定要删除编号为：" + gid + "的商品吗？")) {
            location.href = "<%=basePath%>removegoods.do?gid=" + gid;
        }
    }
</script>
</html>