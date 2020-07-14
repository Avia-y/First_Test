# First_Test
测试网站，有各类httprequest，各种文件类型，实现文件上传下载

如果使用 tomcat 服务器，将 server_add 的内容加到 conf/server.xml 的主机模块里，把 upload 文件整个放入 webapps 文件夹下，
直接启动tomcat，在浏览器输入 http://localhost:8080/upload 即进入该测试网站

/upload/test.jsp 进入文件显示测试页面，该页面含有jsp、css、jpg、mp4、mp3、js、xml、swf、php等文件类型

/upload/request 进入httprequest测试页面，其中包含get、post、head、put、delete、option等请求方式，trace目前不知道怎么实现，等待后续更新或者你们帮我

/upload/start1 进入文件上传页面，文件上传目录为webapps\upload\WEB-INF\upload

/upload/start3 进入文件下载页面，下载文件存储目录为webapps\upload\WEB-INF\upload
