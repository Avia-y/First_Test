<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/3
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件到服务器</title>
</head>

<body>

<form action="upload" method="post" enctype="multipart/form-data">
    <input type="file" name="upFile" value="请选择文件">
    <input type="submit" value="上传">
</form>

<h4> 文件路径：${newFileName}</h4><br>

<button><a href="https://144.test.com${contextpath1}/start3">点击下载</a> </button>
</body>

</html>
