<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ludans
  Date: 2020/1/16
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v3.bootcss.com/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <!--    <link rel="stylesheet" href="/css/bootstrap.min.css"/>-->
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="stylesheet" href="css/signin.css"/>
    <script type="text/javascript">
        function refreshCode() {
            var code = document.getElementById("code");
            code.src = "${pageContext.request.contextPath}/easyCheckServlet?time=" + new Date().getTime();

        }
    </script>
    <title>登录页面</title>
</head>

<body>

<div class="container">

    <form class="form-signin" method="post" action="${pageContext.request.contextPath}/loginServlet">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUser" class="sr-only">UserName</label>
        <input type="text" name="inputUser" id="inputUser" class="form-control" placeholder="UserName" required=""
               autofocus="">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password"
               required="">
        <label for="inputCheck" class="sr-only">Check</label>
        <input type="text" name="inputCheck" id="inputCheck" class="form-control" placeholder="Check" required="">
        <a href="javascript:refreshCode();">
            <img class="center-block" id="code" src="${pageContext.request.contextPath}/easyCheckServlet"
                 title="看不清，点击刷新"/>
        </a>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>

        <%--        <div class="alert alert-warning" role="alert">${login_msg}</div>--%>

        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <strong>信息提示：</strong> ${login_msg}
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div> <!-- /container -->

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
