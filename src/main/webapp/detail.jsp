<%@ page import="com.blog.dto.ArticleDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>博客 - 文章专栏 - 扩展模块！</title>
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
    <!-- 获取转发过来的文章信息-->
    <%
        Object articleObj = request.getAttribute("articleDTO");
        ArticleDTO articleDTO = null; // 初始化变量
        if (articleObj != null && articleObj instanceof ArticleDTO) {
            articleDTO = (ArticleDTO) articleObj; // 有效时赋值
        } else {
            // 无效时提示并跳转，终止后续执行
            out.println("<script>alert('文章不存在或已被删除'); window.location.href='index.jsp';</script>");
            return;
        }
    %>
</head>
<body>
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
        <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow" >
            <a href="index.jsp" title="网站首页">网站首页</a>
            <a href="article.jsp" title="文章专栏">文章专栏</a>
            <a href="article.jsp" title="文章专栏"><%=articleDTO.getTypename()%></a>
            <a><cite><%=articleDTO.getTitle()%></cite></a>
        </blockquote>
        <div class="blog-main">
            <div class="blog-main-left">
                <!-- 文章内容（使用Ueditor富文本编辑器发表的） -->
                <div class="article-detail shadow">
                    <div class="article-detail-title">
                        <%=articleDTO.getTitle()%>
                    </div>
                    <div class="article-detail-info">
                        <span>编辑时间：<%=articleDTO.getTime()%></span>
                        <span>作者：<%=articleDTO.getUsername()%></span>
                    </div>
                    <div class="article-detail-content">
                        <%--文章内容区域--%>
                            <%=articleDTO.getContent()%>
                    </div>
                </div>
                <!-- 评论区域 -->
                <div class="blog-module shadow" style="box-shadow: 0 1px 8px #a6a6a6;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:0">
                        <legend>来说两句吧</legend>
                        <div class="layui-field-box">
                            <form class="layui-form blog-editor" action="">
                                <div class="layui-form-item">
                                    <textarea name="editorContent" lay-verify="content" id="remarkEditor" placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn" lay-submit="formRemark" lay-filter="formRemark">提交评论</button>
                                </div>
                            </form>
                        </div>
                    </fieldset>
                    <div class="blog-module-title">最新评论</div>
                    <ul class="blog-comment">
                        <li>
                            <div class="comment-parent">
                                <img src="images/Absolutely.jpg" alt="absolutely" />
                                <div class="info">
                                    <span class="username">Absolutely</span>
                                    <span class="time">2017-03-18 18:46:06</span>
                                </div>
                                <div class="content">
                                    我为大家做了模拟评论功能！还有，这个评论功能也可以改成和留言一样，但是目前没改，有兴趣可以自己改
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="blog-main-right">
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div><!--这个div位置不能改，否则需要添加一个div来代替它或者修改样式表-->
                <div class="article-category shadow">
                    <div class="article-category-title">分类导航</div>
                    <!-- 点击分类后的页面和artile.jsp页面一样，只是数据是某一类别的 -->
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">ASP.NET MVC</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">SQL Server</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">Entity Framework</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">Web前端</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">C#基础</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">杂文随笔</a>
                    <div class="clear"></div>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">相似文章</div>
                    <ul class="fa-ul blog-module-ul">
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">基于laypage的layui扩展模块（pagesize.js）！</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">基于laypage的layui扩展模块（pagesize.js）！</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">基于laypage的layui扩展模块（pagesize.js）！</a></li>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">随便看看</div>
                    <ul class="fa-ul blog-module-ul">
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（一）（HTML篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">ASP.NET MVC制作404跳转（非302和200）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">ASP.NET MVC 防范跨站请求伪造（CSRF）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（三）（JS篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">基于laypage的layui扩展模块（pagesize.js）！</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（二）（CSS篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">写了个Win10风格快捷菜单！</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item">
        <a href="index.jsp"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item layui-this">
        <a href="article.jsp"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
    </li>
    <li class="layui-nav-item">
        <a href="resource.jsp"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
    </li>
    <li class="layui-nav-item">
        <a href="timeline.jsp"><i class="fa fa-road fa-fw"></i>&nbsp;点点滴滴</a>
    </li>
    <li class="layui-nav-item">
        <a href="about.jsp"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
    </li>
</ul>
<!--分享窗体-->
<div class="blog-share layui-hide">
    <div class="blog-share-body">
        <div style="width: 200px;height:100%;">
            <div class="bdsharebuttonbox">
                <a class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                <a class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
            </div>
        </div>
    </div>
</div>
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
