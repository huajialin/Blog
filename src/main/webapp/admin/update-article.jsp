<%@ page import="com.blog.dao.TypeDAO" %>
<%@ page import="com.blog.dto.AdminUserDTO" %>
<%@ page import="com.blog.dto.ArticleDTO" %>
<%@ page import="com.blog.dto.TypeDTO" %>
<%! TypeDAO typeDAO = new TypeDAO();%>
<%--
  Created by IntelliJ IDEA.
  User: az102
  Date: 2020/12/14
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String cp = request.getContextPath();%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章修改 - 异清轩博客管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=cp%>/css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="<%=cp%>/images/icon/icon.png">
    <link rel="shortcut icon" href="<%=cp%>/images/icon/favicon.ico">
    <script src="<%=cp%>/js/jquery-2.1.4.min.js"></script>
    <!-- My97DatePicker -->
    <script src="<%=cp%>/lib/My97DatePicker/WdatePicker.js"></script>
    <!--[if gte IE 9]>
    <script src="<%=cp%>/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/js/respond.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.jsp';</script>
    <![endif]-->
    <!-- 权限判断，如果未登入，则不能访问会员中心 -->
    <%
        request.setCharacterEncoding("UTF-8");
        AdminUserDTO adminUserDTO = (AdminUserDTO)session.getAttribute("adminUserDTO");
        if(adminUserDTO==null){
    %>
    <script language="JavaScript" type="text/javascript">
        alert("未登入，请登入！");
        window.location.href="admin-login.jsp";
    </script>
    <%
        }
    %>
    <!-- 代码结束 -->


    <!-- 获取转发过来的文章信息-->
    <%
        Object articleObj = request.getAttribute("articleDTO");
        ArticleDTO articleDTO = (ArticleDTO) articleObj;
    %>

    <!-- 根据转发过来的文章类型信息，选择类型-->
    <script type="text/javascript">
        $(document).ready(function(){
            var type='<%=articleDTO.getTypename()%>';
            <% for (TypeDTO typeDTO : typeDAO.getAllType()) { %>
            if(type=='<%=typeDTO.getTypeName()%>'){
                $("input[name='typename'][value='<%=typeDTO.getTypeName()%>']").attr("checked",true);
            }
            <%}%>
        });
    </script>

</head>

<body class="user-select">
<section class="container-fluid">
    <header>
        <%@ include file="header.jsp" %>
    </header>
    <div class="row">
        <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="admin/admin.jsp">首页</a></li>
                <li><a href="admin/article.jsp">文章</a></li>
                <li><a href="admin/comment.jsp">评论</a></li>
                <li><a href="admin/add-category.jsp">栏目</a></li>
                <li><a href="admin/manage-user.jsp">用户</a></li>
            </ul>
        </aside>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <div class="row">
                <form action="${pageContext.request.contextPath}/articleAll.do?action=newUpdate-admin" method="post" class="add-article-form">
                    <div class="col-md-9">
                        <h1 class="page-header">文章修改</h1>
                        <div style="display: none"><input name="id" value="<%=articleDTO.getId()%>"></div>
                        <div class="form-group">
                            <label for="article-title" name="title" class="sr-only">标题</label>
                            <input type="text" id="article-title" name="title" value="<%=articleDTO.getTitle()%>" class="form-control" placeholder="在此处输入标题" value="" required autofocus autocomplete="off">
                        </div>
                        <div class="form-group">
                            <!-- 加载编辑器的容器 -->
                            <script id="container" name="content" type="text/plain">
                                    <%=articleDTO.getContent()%>
                             </script>
                            <!-- 配置文件 -->
                            <script type="text/javascript" src="<%=cp%>/lib/utf8-jsp/ueditor.config.js"></script>
                            <!-- 编辑器源码文件 -->
                            <script type="text/javascript" src="<%=cp%>/lib/utf8-jsp/ueditor.all.js"></script>
                            <!-- 实例化编辑器 -->
                            <script type="text/javascript">
                                var ue = UE.getEditor('container');
                            </script>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <h1 class="page-header">操作</h1>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>栏目</span></h2>
                            <div class="add-article-box-content">
                                <ul class="category-list">
                                    <% for (TypeDTO typeDTO : typeDAO.getAllType()) { %>
                                    <li>
                                        <label>
                                            <input name="typename" type="radio" id="Java" value="<%=typeDTO.getTypeName()%>">
                                            <%=typeDTO.getTypeName()%> <em class="hidden-md">( 栏目ID: <span><%=typeDTO.getId()%></span> )</em></label>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>日期</span></h2>
                            <div class="add-article-box-content">
                                <input readonly="readonly" onclick="WdatePicker()" value="<%=articleDTO.getTime()%>" type="text" class="form-control" placeholder="请选择日期" name="time" autocomplete="off">
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>缩略图</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" class="form-control" placeholder="点击按钮选择图片" id="pictureUpload" name="titlepic" autocomplete="off">
                            </div>
                            <div class="add-article-box-footer">
                                <button class="btn btn-default" type="button" ID="upImage">选择</button>
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>发布</span></h2>
                            <div class="add-article-box-footer">
                                <button class="btn btn-primary" type="submit" name="submit">更新</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form action="" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >个人信息</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">用户名:</td>
                            <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">电话:</td>
                            <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">旧密码:</td>
                            <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">新密码:</td>
                            <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">确认密码:</td>
                            <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr></tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >登录记录</h4>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr>
                        <th>登录IP</th>
                        <th>登录时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>::1:55570</td>
                        <td>2016-01-08 15:50:28</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:64377</td>
                        <td>2016-01-08 10:27:44</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:64027</td>
                        <td>2016-01-08 10:19:25</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:57081</td>
                        <td>2016-01-06 10:35:12</td>
                        <td>成功</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
    <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
            </div>
            <div class="modal-body" style="text-align:center"> <img src="<%=cp%>/images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
        </div>
    </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
            </div>
            <div class="modal-body"> <img src="<%=cp%>/images/baoman/baoman_01.gif" alt="深思熟虑" />
                <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
    <ul class="list-group rightClickMenuList">
        <li class="list-group-item disabled">欢迎访问异清轩博客</li>
        <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
        <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
        <li class="list-group-item"><span>系统：</span>Windows10 </li>
        <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
    </ul>
</div>
<script src="<%=cp%>/js/bootstrap.min.js"></script>
<script src="<%=cp%>/js/admin-scripts.js"></script>
</body>
</html>