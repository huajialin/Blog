<%@ page import="com.blog.dto.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>会员中心</title>
    <link rel="shortcut icon" href="images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="css/global.css" rel="stylesheet" />
    <!-- 比较好用的代码着色插件 -->
    <link href="css/prettify.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="css/detail.css" rel="stylesheet" />
    <!-- jason引入文件 -->
    <script src="js/jquery.js"></script>
    <!-- 页面加载完成后，向服务器发送json请求，获取文章信息 -->
    <script type="text/javascript">
        $(function () {
            var url="${pageContext.request.contextPath}/articleAll.do?action=username";
            $.post(url,function (data) {
                var jsonObj = eval(data);
                //将json数据遍历转化成相应的html代码插入到首页
                var html = "";
                for (var i = 0; i < jsonObj.length; i++) {
                    html+="<li>";
                    html+="<i class=\"fa-li fa fa-hand-o-right\"></i>";
                    html+="<a href='articleAll.do?action=read&id="+jsonObj[i].id+"'>"+jsonObj[i].title+"</a>";
                    html+="<i style='float:right;'>" +
                        "<a href='articleAll.do?action=update&id="+jsonObj[i].id+"'>[修改]&nbsp;  </a>" +
                        "<a href='article.do?action=delete&id="+jsonObj[i].id+"'>[删除]&nbsp;  </a></i>";
                    html+="</li>";
                }
                $("#userarticle").append(html);
            })
        })
    </script>
</head>
<body>
<!-- 权限判断，如果未登入，则不能访问会员中心 -->
<%
    request.setCharacterEncoding("UTF-8");
    UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
    if(userDTO==null){
%>
<script language="JavaScript" type="text/javascript">
    alert("未登入，请登入！");
    window.location.href="login.jsp";
</script>
<%
    }
%>
<!-- 导航 -->
<nav class="blog-nav layui-header">
    <div class="blog-container">
        <%@ include file="head.jsp" %>

        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<!-- 主体（一般只改变这里的内容） -->
<div class="blog-body">
    <div class="blog-container">
        <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
            <div style="width: 216px; margin: 0;">
                <button type="button" onclick="javascrtpt:window.location.href='user-article.jsp'" class="layui-btn layui-btn-fluid">发布文章</button>
                <button type="button" onclick="javascrtpt:window.location.href='user-article-manage.jsp'" class="layui-btn layui-btn-fluid">文章管理</button>
            </div>
        </blockquote>
        <div class="blog-main" style="width: 100%">
            <div class="blog-main-left" style="width: 100%">
                <!-- 评论区域 -->
                <div class="blog-module shadow">
                    <div class="blog-module-title">我发布的文章</div>
                    <ul class="fa-ul blog-module-ul" id="userarticle">

                    </ul>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div><!--这个div位置不能改，否则需要添加一个div来代替它或者修改样式表-->

            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</div>
</div>
<!-- 底部 -->

<!--侧边导航-->

<!--分享窗体-->

<!--遮罩-->
<div class="blog-mask animated layui-hide"></div>
<!-- layui.js -->
<script src="plug/layui/layui.js"></script>
<!-- 自定义全局脚本 -->
<script src="js/global.js"></script>
<!-- 比较好用的代码着色插件 -->
<script src="js/prettify.js"></script>
<!-- 本页脚本 -->
<script src="js/detail.js"></script>
</body>
</html>