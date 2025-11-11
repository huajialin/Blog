<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.blog.dto.UserDTO" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title>会员中心</title>
    <link rel="shortcut icon" href="images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="css/global.css" rel="stylesheet"/>
    <!-- 比较好用的代码着色插件 -->
    <link href="css/prettify.css" rel="stylesheet"/>
    <!-- 本页样式表 -->
    <link href="css/detail.css" rel="stylesheet"/>
    <!-- My97DatePicker -->
    <script src="lib/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<!-- 权限判断，如果未登入，则不能访问会员中心 -->
<%
    request.setCharacterEncoding("UTF-8");
    UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
    if (userDTO == null) {
%>
<script language="JavaScript" type="text/javascript">
    alert("未登入，请登入！");
    window.location.href = "login.jsp";
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
                <button type="button" onclick="javascrtpt:window.location.href='user-article.jsp'"
                        class="layui-btn layui-btn-fluid">发布文章
                </button>
                <button type="button" onclick="javascrtpt:window.location.href='user-article-manage.jsp'"
                        class="layui-btn layui-btn-fluid">文章管理
                </button>
            </div>
        </blockquote>
        <div class="blog-main" style="width: 100%">
            <div class="blog-main-left" style="width: 100%">
                <div class="article-detail shadow">


                    <!-- 文章内容（使用Ueditor富文本编辑器发表的） -->
                    <form class="layui-form layui-form-pane" action="article.do?action=addarticle" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">文章标题</label>
                            <div class="layui-input-block">
                                <%--文章标题 --%> <input type="text" name="title" autocomplete="off" placeholder="请输入标题"
                                                     class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" pane="">
                            <label class="layui-form-label">文章分类</label>
                            <%--文章分类 --%>
                            <div class="layui-input-block">
                                <% for (TypeDTO typeDTO : typeDAO.getAllType()) { %>
                                <input type="radio" name="typename" value="<%=typeDTO.getTypeName()%>"
                                       title="<%=typeDTO.getTypeName()%>">
                                <%}%>
                            </div>
                        </div>

                        <%--发布时间 --%>
                        <div class="layui-form-item">
                            <label class="layui-form-label">发布日期</label>
                            <div class="layui-input-block">
                                <input readonly="readonly" onclick="WdatePicker({el:this})" type="text" name="time"
                                       autocomplete="off" placeholder="请选择日期" class="layui-input">
                            </div>
                        </div>
                        <!-- 加载编辑器的容器 -->
                        <script id="container" name="content" type="text/plain">

                        </script>
                        <!-- 配置文件 -->
                        <script type="text/javascript" src="lib/utf8-jsp/ueditor.config.js"></script>
                        <!-- 编辑器源码文件 -->
                        <script type="text/javascript" src="lib/utf8-jsp/ueditor.all.js"></script>
                        <!-- 实例化编辑器 -->
                        <script type="text/javascript">
                            var ue = UE.getEditor('container', {
                                initialFrameWidth: '100%',//设置编辑器宽度
                                initialFrameHeight: 300,//设置编辑器高度
                                scaleEnabled: true
                            });
                        </script>
                        <script type="text/javascript">
                            var radiovar = document.getElementsByName("typename");
                            radiovar[0].checked = "checked";
                        </script>

                        <div style="width: 300px; margin-top: 10px;margin-left: 450px;">
                            <button type="submit" class="layui-btn layui-btn-fluid">保存发布</button>
                            <button type="reset" class="layui-btn layui-btn-fluid">取消发布</button>
                        </div>
                    </form>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
                <!--这个div位置不能改，否则需要添加一个div来代替它或者修改样式表-->

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