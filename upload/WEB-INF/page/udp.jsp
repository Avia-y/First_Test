<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/2
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>udp_test</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/udp" method="post">
    <input type="text" placeholder="请输入数据" name="udpdata">
    <input type="submit" value="点击上传">
</form>
得到的数据为：${newudp}
</body>
</html>
