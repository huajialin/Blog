<%@ page import="com.blog.dto.ArticleDTO" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>博客</title>
    <link rel="shortcut icon" href="images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="css/home.css" rel="stylesheet" />
    <!-- jason引入文件 -->
    <script src="js/jquery.js"></script>
    <!--本页样式表-->
    <link href="css/article.css" rel="stylesheet" />
    <!-- 首页加载完成后，向服务器发送json请求，获取文章信息 -->
    <script type="text/javascript">
        $(function () {
            var url="${pageContext.request.contextPath}/articleAll.do?action=all";
            $.post(url,function (data) {
                var jsonObj = eval(data);
                //将json数据遍历转化成相应的html代码插入到首页
                var html = "";
                for (var i = 0; i < jsonObj.length; i++) {
                    html+="<div class=\"article shadow\">";
                    html+="<div class=\"article-left\">" +
                        "<img src=\"images/cover/201703181909057125.jpg\" alt=\"基于laypage的layui扩展模块（pagesize.js）！\" />" +
                        "</div>" +
                        "<div class=\"article-right\">" +
                        "<div class=\"article-title\">" +
                        "<a href='articleAll.do?action=read&id="+jsonObj[i].id+"'>"+jsonObj[i].title+"</a>" +
                        "</div>" +
                        "<div class=\"article-abstract\" style=\"display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;overflow: hidden;\">" +
                                                jsonObj[i].content+
                        "</div>" +
                        "</div>" +
                        "<div class=\"clear\"></div>" +
                        "<div class=\"article-footer\">" +
                        "<span><i class=\"fa fa-clock-o\"></i>"+jsonObj[i].time+"</span>" +
                        "<span class=\"article-author\"><i class=\"fa fa-user\"></i>&nbsp;&nbsp;"+jsonObj[i].username+"</span>" +
                        "<span><i class=\"fa fa-tag\"></i>&nbsp;&nbsp;<a href=\"#\">"+jsonObj[i].typename+"</a></span>" +
                        "</div>";
                    html+="</div>";
                }
                $("#article").append(html);
            })
        })
    </script>
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
    <!-- canvas -->
    <canvas id="canvas-banner" style="background: #393D49;"></canvas>
    <!--为了及时效果需要立即设置canvas宽高，否则就在home.js中设置-->
    <script type="text/javascript">
        var canvas = document.getElementById('canvas-banner');
        canvas.width = window.document.body.clientWidth - 10;//减去滚动条的宽度
        if (screen.width >= 992) {
            canvas.height = window.innerHeight * 1 / 3;
        } else {
            canvas.height = window.innerHeight * 2 / 7;
        }
    </script>
    <!-- 这个一般才是真正的主体内容 -->
    <div class="blog-container">
        <div class="blog-main">
            <!-- 网站公告提示 -->
            <div class="home-tips shadow">
                <i style="float:left;line-height:17px;" class="fa fa-volume-up"></i>
                <div class="home-tips-container">
                    <span style="color: #009688">本博客的后台管理也正在制作，为大家准备了游客专用账号！</span>
                    <span style="color: red">网站新增留言回复！登陆即可回复，人人都可以回复！</span>
                    <span style="color: red">如果你觉得网站做得还不错，来gitee社区点个赞吧！<a href="https://gitee.com/huajialin/blog" target="_blank" style="color:#01AAED">点我前往</a></span>
                    <span style="color: #009688">个人博客目前正在建设中！</span>
                </div>
            </div>
            <!--左边文章列表-->
            <div class="blog-main-left" id="article">
                <%--读取文章信息--%>
            </div>
            <!--右边小栏目-->
            <div class="blog-main-right">
                <%--首页搜索框--%>
                <div class="blog-search">
                    <form class="layui-form" action="articleAll.do?action=search" method="post" id="myForm">
                        <div class="layui-form-item">
                            <div class="search-keywords  shadow">
                                <input type="text" name="title" lay-verify="required" placeholder="输入关键词搜索" autocomplete="off" class="layui-input">
                            </div>
                            <div class="search-submit  shadow">
                                <a href="javascript:submit()" class="search-btn" lay-submit="formSearch" lay-filter="formSearch"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="blogerinfo shadow">
                    <div class="blogerinfo-figure">
                        <img src="images/Absolutely.jpg" alt="Absolutely" />
                    </div>
                    <p class="blogerinfo-nickname">第九组</p>
                    <p class="blogerinfo-introduce">本小组成员全部来自计科231 325寝</p>
                    <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;宁夏 - 北方民族大学</p>
                    <hr />
                    <div class="blogerinfo-contact">
                        <a target="_blank" title="码云" href="https://gitee.com/huajialin/blog"><i class="fa fa-git fa-2x"></i></a>
                        <a target="_blank" title="github" href="https://github.com/huajialin/Blog"><i class="fa fa-github fa-2x"></i></a>
                    </div>
                </div>
                <div></div><!--占位-->
                <div class="blog-module shadow">
                    <div class="blog-module-title">热文排行</div>
                    <ul class="fa-ul blog-module-ul">
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">Web安全之跨站请求伪造CSRF</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">ASP.NET MVC 防范跨站请求伪造（CSRF）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">常用正则表达式</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">EF CodeFirst数据迁移常用指令</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">浅谈.NET Framework基元类型</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">C#基础知识回顾-扩展方法</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（一）（HTML篇）</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp">一步步制作时光轴（二）（CSS篇）</a></li>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">最近分享</div>
                    <ul class="fa-ul blog-module-ul">
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp" target="_blank">Canvas</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp" target="_blank">pagesize.js</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp" target="_blank">时光轴</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="detail.jsp" target="_blank">图片轮播</a></li>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">一路走来</div>
                    <dl class="footprint">
                        <dt>2025年10月12日</dt>
                        <dd>新增留言回复功能！人人都可参与回复！</dd>
                        <dt>2025年10月10日</dt>
                        <dd>博客2.0基本功能完成，正式上线！</dd>
                        <dt>2025年10月09日</dt>
                        <dd>新增文章搜索功能！</dd>
                        <dt>2025年10月25日</dt>
                        <dd>QQ互联接入网站，可QQ登陆发表评论与留言！</dd>
                    </dl>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">后台记录</div>
                    <dl class="footprint">
                        <dt>2025年10月16日</dt>
                        <dd>分页新增页容量控制</dd>
                        <dt>2025年10月12日</dt>
                        <dd>新增管家提醒功能</dd>
                        <dt>2025年10月10日</dt>
                        <dd>新增Win10快捷菜单</dd>
                    </dl>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item layui-this">
        <a href="index.jsp"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item">
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
<!-- 全局脚本 -->
<script src="js/global.js"></script>
<!-- 本页脚本 -->
<script src="js/home.js"></script>
<script type="text/javascript">
    function submit() {
        if (true) {
            document.getElementById('myForm').submit();
        }else {
            return;
        }
    }
</script>
</body>
</html>