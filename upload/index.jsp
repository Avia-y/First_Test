<%--
  Created by IntelliJ IDEA.
  User: xieyan
  Date: 2020/12/16
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>我的主页</title>
      <link rel="stylesheet" type="text/css" href="css/main.css" />
      <link rel="stylesheet" type="text/css" href="css/fiame.css" />
      <script src="js/time.js"></script>
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script type="text/javascript" src="js/quietflow.min.js"></script>
      <script type="text/javascript" src="js/frame.js"></script>
    <!--
    <style type="text/css">
      @import url(css/main.css);
    </style>
    -->
  </head>
  <body onload="startTime()">
  <div class="header">
    <h1>我的网页</h1>
  </div>

  <div class="topnav">
    <a href="<%=request.getContextPath() %>/start1">上传</a>
    <a href="<%=request.getContextPath() %>/start3">下载</a>
    <a href="<%=request.getContextPath() %>/request">请求测试</a>

    <a href="#" style="float:right"><div id="txt"></div></a>
  </div>

  <div class="row">
    <div class="leftcolumn">
      <div class="card">
        <h2>测试网页汇总</h2>
        <h5>2021 年 1 月 22日</h5>
          <table>
              <tr>
                  <th>网站</th>
                  <th>域名</th>
                  <th>点击访问</th>
              </tr>
              <tr>
                  <td>主页</td>
                  <td>121.upk.net/index1.jsp</td>
                  <td><a href="http://121.upk.net/index1.jsp" target="_blank">主页</a></td>
              </tr>
              <tr style="background-color:#EAF2D3 ;color:#000000;">
                  <td>接口测试</td>
                  <td>121.upk.net/request</td>
                  <td><a href="http://121.upk.net/request" target="_blank">接口测试</a></td>
              </tr>
              <tr>
                  <td>上传测试</td>
                  <td>121.upk.net/upload/start1</td>
                  <td><a href="http://121.upk.net/upload/start1" target="_blank">上传测试</a></td>
              </tr>
              <tr style="background-color:#EAF2D3 ;color:#000000;">
                  <td>下载测试</td>
                  <td>121.upk.net/upload/start3</td>
                  <td><a href="http://121.upk.net/upload/start3" target="_blank">下载测试</a></td>
              </tr>
              <tr>
                  <td>多图测试</td>
                  <td>122.upk.net</td>
                  <td><a href="http://122.upk.net" target="_blank">多图测试</a></td>
              </tr>
              <tr style="background-color:#EAF2D3 ;color:#000000;">
                  <td rowspan="3">同证书不同域名测试</td>
                  <td>s3.super.org</td>
                  <td><a href="http://s3.super.org" target="_blank">s3测试</a></td>
              </tr>
              <tr>
                  <td>s2.super.net</td>
                  <td><a href="http://s2.super.net" target="_blank">s2测试</a></td>
              </tr>
              <tr style="background-color:#EAF2D3 ;color:#000000;">
                  <td>s1.super.net</td>
                  <td><a href="http://s1.super.net" target="_blank">s1测试</a></td>
              </tr>
              <tr >
                  <td rowspan="2">协议跳转测试</td>
                  <td>h2hs.test.tech</td>
                  <td><a href="http://h2hs.test.tech" target="_blank">h2hs测试</a></td>
              </tr>
              <tr style="background-color:#EAF2D3 ;color:#000000;">
                  <td>hs2h.test.tech</td>
                  <td><a href="http://hs2h.test.tech" target="_blank">hs2h测试</a></td>
              </tr>
          </table>
      </div>

      <div class="card">
          <h2>图片廊</h2>
          <h5>2021 年 1 月 22日</h5>
<%--          <div class="fakeimg" style="height:200px;">图片</div>--%>
          <div class="r" >
              <div class="img">
                  <a target="_blank" href="pic/1.jpg">
                      <img src="pic/1.jpg" width="300" height="200">
                  </a>
                  <div class="desc">丛林神庙</div>
              </div>
          </div>

          <div class="r" >
              <div class="img">
                  <a target="_blank" href="pic/2.jpg">
                      <img src="pic/2.jpg" width="300" height="200">
                  </a>
                  <div class="desc">桥</div>
              </div>
          </div>

          <div class="r" >
              <div class="img">
                  <a target="_blank" href="pic/3.jpg">
                      <img src="pic/3.jpg" width="300" height="200">
                  </a>
                  <div class="desc">河</div>
              </div>
          </div>

          <div class="r" >
              <div class="img">
                  <a target="_blank" href="pic/4.jpg">
                      <img src="pic/4.jpg" width="300" height="200">
                  </a>
                  <div class="desc">瀑布</div>
              </div>
          </div>
      </div>

      <div class="card">
          <iframe src="2048.html" width="1050px" height="680px" frameborder="0" scrolling="no"></iframe>
      </div>

    </div>

    <div class="rightcolumn">
      <div class="card">
        <h2>音频文件</h2>
        <audio controls>
          <source src="pic/111.mp3" type="audio/mp3">
        </audio>
        <p>测试音频获取是否正常</p>
      </div>

      <div class="card">
        <h3>视频文件</h3>
        <video width="350" height="240" controls>
          <source src="pic/444.mp4" type="video/mp4">
        </video>
      </div>

    </div>
  </div>

  <div class="footer">
    <h2>底部区域</h2>
  </div>
  </body>
</html>
