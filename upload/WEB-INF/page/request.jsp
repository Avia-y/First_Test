<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/8
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>请求测试</title>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <style>
        table,th,td
        {
            border:1px solid black;
        }
        td{
            vertical-align:center;
            text-align:left;
        }
    </style>
</head>
<body>
<h4>显示返回请求</h4>
<table>
    <tr>
        <th>请求</th>
        <th>结果</th>
    </tr>

    <tr>
        <td>
            <br>
            <form action="<%=request.getContextPath() %>/request" method="get">
                <input type="hidden" name="log" value="0">
                <input type="text" placeholder="请输入get的数据" name="getdata">
                <input type="submit" value="点击上传">
            </form>
        </td>
        <td>get得到的数据为：${newget}</td>
    </tr>

    <tr>
        <td>
            <br>
            <form action="<%=request.getContextPath() %>/request" method="post">
                <input type="text" placeholder="请输入post的数据" name="postdata">
                <input type="submit" value="点击上传">
            </form>
        </td>
        <td>post得到的数据为：${newpost}</td>
    </tr>

    <tr>
        <td>
            <br>
            <form id="put_test">
                <input type="text" placeholder="请输入put的数据" name="putdata">
                <input type="submit" value="点击上传">
            </form>

            <script>
                $("#put_test").submit(function(event){
                    event.preventDefault();
                    var $form = $(this);
                    var putdata = $form.find('input[name="putdata"]').val();
                    var url = 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>' + '<%=request.getContextPath() %>' + '/request' + '?putdata=' + putdata ;


                    $.ajax({
                        type : 'PUT',
                        url : url,
                        contentType: 'application/json',
                        data : JSON.stringify({putdata: putdata}),
                        success : function(data, status, xhr){
                            window.location.replace( 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>'
                                + '<%=request.getContextPath() %>' + '/request');
                        },
                        error: function(xhr, status, error){

                        }
                    });
                });

            </script>
        </td>
        <td>put得到的数据为：${newput}</td>
    </tr>

    <tr>
        <td>
            <br>
            <form id="header_test" >
                <input type="submit" value="点击获取头信息">
            </form>

            <script>

                $("#header_test").submit(function(event){
                    event.preventDefault();
                    var $form = $(this);
                    var url = 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>' + '<%=request.getContextPath() %>' + '/request'  ;


                    $.ajax({
                        type : 'HEAD',
                        url : url,
                        contentType: 'application/json',
                        success : function(data, status, xhr){
                            window.location.replace( 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>'
                                + '<%=request.getContextPath() %>' + '/request');
                        },
                        error: function(xhr, status, error){

                        }
                    });
                });

            </script>
        </td>
        <td>
                <c:forEach var="me" items="${headmap}">
                    ${me.key}=${me.value}<br>
                </c:forEach>
        </td>
    </tr>

    <tr>
        <td>
            <br>
            <form id="delete_test" >
                <input type="submit" value="点击删除已获取资源">
            </form>

            <script>
                $("#delete_test").submit(function(event){
                    event.preventDefault();
                    var $form = $(this);
                    var url = 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>' + '<%=request.getContextPath() %>' + '/request'  ;

                    $.ajax({
                        type : 'DELETE',
                        url : url,
                        contentType: 'application/json',
                        success : function(data, status, xhr){
                            window.location.replace( 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>'
                                + '<%=request.getContextPath() %>' + '/request');
                        },
                        error: function(xhr, status, error){

                        }
                    });
                });
            </script>
        </td>
        <td>${deteleinfo}</td>
    </tr>

    <tr>
        <td>
            <br>
            <form id="option_test" >
                <input type="submit" value="点击查看允许的端口服务">
            </form>

            <script>
                $("#option_test").submit(function(event){
                    event.preventDefault();
                    var $form = $(this);
                    var url = 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>' + '<%=request.getContextPath() %>' + '/request'  ;

                    $.ajax({
                        type : 'OPTIONS',
                        url : url,
                        contentType: 'application/json',
                        success : function(data, status, xhr){
                            window.location.replace( 'https://' + '<%=request.getLocalName() %>' + ':' + '<%=request.getLocalPort() %>'
                                + '<%=request.getContextPath() %>' + '/request');
                        },
                        error: function(xhr, status, error){

                        }
                    });
                });
            </script>
        </td>
        <td>${optionsinfo}</td>
    </tr>

    <tr>
        <td>
            <br>
            <form action="<%=request.getContextPath()%>/request" method="get">
                <input type="hidden" name="log" value="1">
                <input type="submit" value="点击打印日志">
            </form>

        </td>
        <td>
            ${loginfo}
        </td>
    </tr>

</table>


</body>
</html>
