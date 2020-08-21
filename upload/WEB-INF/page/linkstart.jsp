<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="static org.bouncycastle.crypto.tls.ContentType.alert" %>
<%@ page import="java.nio.charset.Charset" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/19
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="https://<%=request.getServerName() %>:<%=request.getServerPort() %>/<%=request.getContextPath() %>/md5.js" type='text/javascript'></script>
</head>
<body>
<form action="<%=request.getContextPath() %>/login" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td>
                <input type="text"  placeholder="请输入用户名" name="usn">
            </td>
        </tr>
            <td>密  码：</td>
            <td>
                <input type="password" placeholder="请输入密码" name="usp" id="usp">
            </td>
    </table>
    <input type="submit"  value="登录" id="submit">
</form>
<script>
    var sub = document.getElementById('submit');
    var pwd = document.getElementById('usp');
    sub.onclick=function () {
        pwd.value = hex_md5(pwd.value);
    }
</script>

<h3>${message}</h3>
</body>
</html>
