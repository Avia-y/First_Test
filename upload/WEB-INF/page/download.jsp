<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/4
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>下载文件显示页面</title>
    <style>
        table, td, th
        {
            border:1px solid green;
        }
        th
        {
            background-color:green;
            color:white;
        }
    </style>

</head>

<body>
<button><a href="https://144.test.com${contextpath}/start1">点击上传</a> </button>
<button><a href="delete?delename=">删除全部</a> </button>
<table>
    <tr>
        <th>文件名称</th>
        <th>下载</th>
        <th>删除</th>
    </tr>
    <c:forEach var="me" items="${fileNameMap}">

        <tr>
            <c:url value="/DownLoad" var="downurl">
                <c:param name="filename" value="${me.key}"></c:param>
            </c:url>
            <td>
                    ${me.key}
            </td>
            <td>
                <a href="${downurl}">下载</a>
            </td>
            <td>
                <a href="delete?delename=${me.key}">删除</a>
            </td>

        </tr>

    </c:forEach>
</table>


</body>

</html>
