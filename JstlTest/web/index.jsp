<%--
  Created by IntelliJ IDEA.
  User: ludans
  Date: 2019/12/27
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
  <head>
    <title>Jstl 实例测试</title>
  </head>
  <body>

        <br>
        没有标签体：<c:out value="${param.username}" default="unKnown" escapeXml="true"/>
        <br>

        有标签体：<c:out value="${param.username}"> unKnown</c:out><br>

        标签体-转义属性关闭 ：<c:out value="${param.username}" escapeXml="false">
          <font color="red">
            转义属性关闭
          </font>
         </c:out><br>


        标签体-转义属性开启 ：<c:out value="${param.username}" escapeXml="true">
    <font color="red">
      转义属性开启
    </font>
        </c:out>
        <br>
        
        <img src="${pageContext.request.contextPath}/easyCheckServlet" title="图片验证码">
        <img src="${pageContext.request.contextPath}/checkCodeServlet" title="数字验证码">
        <img src="${pageContext.request.contextPath}/chineseCheckServlet" title="中文验证码">


  <c:url  var="IfTest" value="IfTest.jsp">1
      <c:param name="userName" value="ludans" />
      <c:param name="passWord">陆微腾</c:param>
  </c:url>
  <a href="${IfTest}"> If , forEach 测试页</a>
  <br>
        <div align="center">
            <c:url var ="loginUrl" value="login.jsp"></c:url>
            <a href="${loginUrl}">登录页面</a>
        </div>

  </body>
</html>
