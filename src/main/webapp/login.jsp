<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <title>品牌商城系统</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <script type="text/javascript">
        var msg = '${msg}';
        if(msg!=""&&msg!=undefined){
            alert(msg);
        }

    </script>
</head>

<body>
<div id="login-page">
    <div class="container">
        <form class="form-login" action="userlogin.do" method="post">
            <h2 class="form-login-heading">品牌商城系统</h2>
            <div class="login-wrap"><!-- required 必填， autofocus 光标锁定-->
                <input type="text" class="form-control" placeholder="请输入用户名" name="userName" required autofocus>
                <br>
                <input type="password" class="form-control" placeholder="请输入密码" name="userPassword" required>
                <br>
                <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i>登录</button>

                <a class="btn btn-theme btn-block" href="toregister.do"><i class="fa fa-lock"></i>注册</a>
                <hr>
            </div>
        </form>

    </div>
</div>

<!-- js placed at the end of the document so the pagez load faster -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
<script type="text/javascript">
    $.backstretch("images/back.png", {speed: 500});
</script>


</body>
</html>

