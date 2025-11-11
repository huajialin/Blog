<%--
  Created by IntelliJ IDEA.
  User: az102
  Date: 2020/12/22
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 加载编辑器的容器 -->
<script id="container" name="content" type="text/plain">

</script>
<!-- 配置文件 -->
<script type="text/javascript" src="lib/utf8-jsp/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="lib/utf8-jsp/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container',{
        initialFrameWidth: '100%',//设置编辑器宽度
        initialFrameHeight:300,//设置编辑器高度
        scaleEnabled:true
    });
</script>
</body>
</html>
