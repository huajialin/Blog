<%@ page import="com.blog.dto.ArticleDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: az102
  Date: 2020/12/18
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>不落阁 - 文章专栏</title>
    <link rel="shortcut icon" href="images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="css/global.css" rel="stylesheet" />
    <!--本页样式表-->
    <link href="css/article.css" rel="stylesheet" />
</head>
<body>
<%
    Object articleObj = request.getAttribute("articleDTO");
    List<ArticleDTO> list = (List<ArticleDTO>) articleObj;
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=utf-8");
%>
<!-- 导航 -->
<nav class="blog-nav layui-header">
    <div class="blog-container">
        <%@ include file="head.jsp" %>        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<!-- 主体（一般只改变这里的内容） -->
<div class="blog-body">
    <div class="blog-container">
        <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
            <a href="index.jsp" title="网站首页">网站首页</a>
            <a><cite>文章专栏</cite></a>
        </blockquote>
        <div class="blog-main">
            <div class="blog-main-left">
                <div class="shadow" style="text-align:center;font-size:16px;padding:40px 15px;background:#fff;margin-bottom:15px;">
                    搜索到与【<span style="color: #FF5722;"><%=request.getParameter("title")%></span>】有关的文章，随便看看吧！
                </div>
                <% for (ArticleDTO articleDTO : list) { %>
                <div class="article shadow">
                    <div class="article-left">
                        <img src="images/cover/201703181909057125.jpg" alt="基于laypage的layui扩展模块（pagesize.js）！" />
                    </div>
                    <div class="article-right">
                        <div class="article-title">
                            <a href="articleAll.do?action=read&id=<%=articleDTO.getId()%>"><%=articleDTO.getTitle()%></a>
                        </div>
                        <div class="article-abstract" style="display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;overflow: hidden;">
                            <%=articleDTO.getContent()%>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="article-footer">
                        <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<%=articleDTO.getTime()%></span>
                        <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;<%=articleDTO.getUsername()%></span>
                        <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#"><%=articleDTO.getTypename()%></a></span>
                    </div>
                </div>
                <%}%>

            </div>
            <div class="blog-main-right">
                <div class="article-category shadow">
                    <div class="article-category-title">分类导航</div>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">ASP.NET MVC</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">SQL Server</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">Entity Framework</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">Web前端</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">C#基础</a>
                    <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">杂文随笔</a>
                    <div class="clear"></div>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">作者推荐</div>
                    <ul class="fa-ul blog-module-ul">
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">Web安全之跨站请求伪造CSRF</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">ASP.NET MVC 防范跨站请求伪造（CSRF）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">C#基础知识回顾-扩展方法</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（一）（HTML篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（二）（CSS篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（三）（JS篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">写了个Win10风格快捷菜单！</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">ASP.NET MVC自定义错误页</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">ASP.NET MVC制作404跳转（非302和200）</a></li>
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
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">常用正则表达式</a></li>
                    </ul>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- 底部 -->
<footer class="blog-footer">
    <p><span>Copyright</span><span>&copy;</span><span>2017</span><a href="http://www.lyblogs.cn">不落阁</a><span>Design By LY</span></p>
    <p><a href="http://www.miibeian.gov.cn/" target="_blank">蜀ICP备16029915号-1</a></p>
</footer>
<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item">
        <a href="index.jsp"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item layui-this">
        <a href="article.jsp"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
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
<!-- 全局脚本 -->
<script src="js/global.js"></script>
</body>
</html>

