<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()  + "/";
%>

<html>
<head>
    <title>Test</title>
    <style>
        video {
            width: 50%;
            height: auto;
        }
    </style>
    <base href="<%=basePath%>">

    <title>i/o流读取图片</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mystyle.css">

    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
    </script>
    <script>
        $(document).ready(function(){
            $("p").click(function(){
                $(this).hide();
            });
        });
    </script>
</head>
<body>
<video width="320" height="240" controls>
   css+视频 <br><source src="<%=request.getContextPath()%>/image/444.mp4" type="video/mp4">
</video>
<br>

js+音频<br>
<script type="text/javascript">
    var audio;
    function voicePaly () {
        audio = "<%=request.getContextPath()%>/image/111.mp3";
        audio = new Audio(audio);
        // 循环播放，播放结束继续播放
        $(audio).unbind("ended").bind("ended", function(){
            audio.play();
        })
        audio.play();
    }
    function voiceClose () {
        audio.pause();
    }
</script>
<button onclick="voicePaly()">启动</button>
<button onclick="voiceClose()">停止</button>
<br>
xml+图片

<br>
<img border="0" src="<%=request.getContextPath()%>/image/6.jpg" alt="Pulpit rock">
<br>

<div>
    <img id="viewImg2" src="<%=request.getContextPath()%>/image/15.jfif" style="height:200px;width:200px;">
</div>
<br>

<%
    String conpath=request.getContextPath();
    out.print("<a href=\""+conpath+"/testphp.php\">");
    out.print("查看php页面");
    out.print("</a>");
%>

<p>111</p>
<p>222</p>

<br>
<script>
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","<%=request.getContextPath()%>/xml/cd_catalog.xml",false);
    xmlhttp.send();
    xmlDoc=xmlhttp.responseXML;

    document.write("<table border='1'>");
    var x=xmlDoc.getElementsByTagName("CD");
    for (i=0;i<x.length;i++)
    {
        document.write("<tr><td>");
        document.write(x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue);
        document.write("</td><td>");
        document.write(x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue);
        document.write("</td></tr>");
    }
    document.write("</table>");
</script>
<embed src="<%=request.getContextPath()%>/image/helloworld.swf" type="application/x-shockwave-flash">
</body>
</html>
