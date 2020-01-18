<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ludans
  Date: 2019/12/27
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    tr{
        text-align: center;
    }
</style>
<body>


<%
    String []fruits ={"apple" ,"orange", "grape" ,"banana"};

    List colorList = new ArrayList();
    colorList.add("red");
    colorList.add("blue");
    colorList.add("yellow");
    colorList.add("green");

    request.setAttribute("now",new Date());


%>

fruits值：
<c:set value="1" var="NumberA" property="a"/>
<h4>
    If 值 ：
</h4>
<c:if test="${NumberA ==1 }">
    <font color="red">输入正确</font>
    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <td>水果</td>
            <c:forEach var="fruit" items="<%= fruits%>" >
                <td>${fruit}</td>
            </c:forEach>
        </tr>

        <tr>
            <td>颜色</td>
            <c:forEach var="color" items="<%=colorList%>">
                <td>
                        ${color}
                </td>
            </c:forEach>
        </tr>
        <tr>
          <td>end ,begin,step 测试</td>
        </tr>
        <tr>
            <c:forEach var="color" items="<%=colorList%>" begin="1" end="3" step="1">
                <td>
                        ${color}
                </td>
            </c:forEach>

        </tr>
        <td colspan="5" align="center">Status测试</td>
        <tr align="center">
            <td>序号</td>
            <td>索引</td>
            <td>是否为第一个元素</td>
            <td>是否为最后一个元素</td>
            <td>名称</td>
        </tr>
        <c:forEach var="colorStatu"  items="<%=colorList%>" varStatus="colorStatus">
            <tr align="center">
                    <td>${colorStatus.count}</td>
                    <td>${colorStatus.index}</td>
                    <td>${colorStatus.first}</td>
                    <td>${colorStatus.last}</td>
                    <td>${colorStatu}</td>
            </tr>
    </c:forEach>
    </table>
</c:if>

    <br>
${param.userName}
<h4>choose 用法 ：</h4>
<c:choose>
    <c:when test="${empty param.userName}">
        unknown User
    </c:when>

    <c:when test="${param.userName == 'ludans'}">
        ${param.userName} is manager.
    </c:when>
    <c:otherwise>
        ${param.userName} is student
    </c:otherwise>
</c:choose>

<br>
<h4> formatNumber 数字格式化 测试</h4>

    <table cellpadding="10" cellspacing="0" border="1" >
        <tr>
            <td>行为</td>
            <td>结果</td>
        </tr>
        <tr>
            <td>  <"fmt:formatNumber value="123123456.789" type="currency" currencyCode="CNY"/></td>
            <td>
                <fmt:formatNumber value="123123456.789" type="currency" currencyCode="CNY"/>
            </td>
        </tr>
        <tr>
            <td><"fmt:formatNumber value="1123456789123.12365" pattern="#,###.000"/>(其中 '#' 代表占位符)</td>
            <td> <fmt:formatNumber value="1123456789123.12365" pattern="#,###.000"/> </td>
        </tr>

    </table>

<br>
<h4> formatDate 时间格式化 测试</h4>

<table  cellpadding="10" cellspacing="0" border="1" >
    <tr  >
        <td >类型</td>
        <td>行为</td>
        <td>结果</td>
    </tr>

    <tr>
        <td colspan="3">日期</td>
    </tr>
    <tr>
        <td>Long</td>
        <td>  <"fmt:formatDate value="${now}" dateStyle="long" /></td>
        <td>
            <fmt:formatDate value="${now}" dateStyle="long" />
        </td>
    </tr>
    <tr>
        <td>Medium</td>
        <td><"fmt:formatDate value="${now}" dateStyle="medium"/></td>
        <td><fmt:formatDate value="${now}" dateStyle="medium"/> </td>
    </tr>
    <tr>
        <td>Short</td>
        <td><"fmt:formatDate value="${now}" dateStyle="short"/></td>
        <td><fmt:formatDate value="${now}" dateStyle="short"/> </td>
    </tr>
    <tr>
        <td>Default</td>
        <td><"fmt:formatDate value="${now}" dateStyle="default"/></td>
        <td><fmt:formatDate value="${now}"  timeZone="CST" dateStyle="default"/> </td>
    </tr>

    <tr>
        <td colspan="3">时间</td>
    </tr>
    <tr>
        <td>Long</td>
        <td>  <"fmt:formatDate  type="time" value="${now}" dateStyle="long" /></td>
        <td>
            <fmt:formatDate type="time" value="${now}" dateStyle="long" />
        </td>
    </tr>
    <tr>
        <td>Medium</td>
        <td><"fmt:formatDate type="time" value="${now}" dateStyle="medium"/></td>
        <td><fmt:formatDate type="time" value="${now}" dateStyle="medium"/> </td>
    </tr>
    <tr>
        <td>Short</td>
        <td><"fmt:formatDate type="time" value="${now}" dateStyle="short"/></td>
        <td><fmt:formatDate type="time" value="${now}" dateStyle="short"/> </td>
    </tr>
    <tr>
        <td>Default</td>
        <td><"fmt:formatDate type="time" value="${now}"  pattern="HH时mm分"  dateStyle="default"/></td>
        <td><fmt:formatDate type="time" value="${now}" pattern="HH时mm分"  dateStyle="default"/> </td>
    </tr>
    <tr>
        <td>Full</td>
        <td><"fmt:formatDate type="time" value="${now}" dateStyle="full"/></td>
        <td><fmt:formatDate type="time" value="${now}" timeZone="CST" dateStyle="full"/> </td>
    </tr>

</table>



<table align="center" border="1" cellspacing="10" cellpadding="10">
    <tr>
        <td>1.1</td>
        <td>1.2</td>
    </tr>
    <tr>
        <td>2.1</td>
        <td>2.2</td>
        <td>2.3</td>
    </tr>
    <tr>
        <td>3.1</td>
        <td>3.2</td>
    </tr>
</table>



</body>
<head>
    <title>if,forEach 测试</title>
</head>
</html>
