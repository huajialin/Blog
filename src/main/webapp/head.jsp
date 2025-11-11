<%@ page import="com.blog.dto.TypeDTO" %>
<%@ page import="com.blog.dao.TypeDAO" %>
<%! TypeDAO typeDAO = new TypeDAO();%>
<%--
  Created by IntelliJ IDEA.
  User: az102
  Date: 2020/12/14
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--销毁登入信息--%>

<!-- 用户登陆 -->
<c:choose>
    <c:when test="${userDTO.username == null }">
        <!-- 顶部未登录 -->
        <a class="blog-user" href="login.jsp" style="color: #FFFFFF">登入</a>
    </c:when>
    <c:otherwise>
        <!-- 顶部已登录 -->
        <a class="blog-user" href="user-article.jsp" style="color: #FFFFFF;margin-right: 50px;">欢迎您 ${userDTO.username}</a>
        <a class="blog-user" href="loginOut.do" style="color: #FFFFFF;">退出</a>
    </c:otherwise>
</c:choose>
<!-- 不落阁 -->
<a class="blog-logo" href="index.jsp">不落阁</a>
<!-- 导航菜单 -->
<ul class="layui-nav" lay-filter="nav" style="text-align:left;padding-left:100px;">
    <li class="layui-nav-item layui-this">
        <a href="index.jsp"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item  layui-this">
        <a href="javascript:;"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏&nbsp;</a>
        <dl class="layui-nav-child">
            <% for (TypeDTO typeDTO :typeDAO.getAllType()) { %>
                <dd><a href="articleAll.do?action=type&typename=<%=typeDTO.getTypeName()%>"><%=typeDTO.getTypeName()%></a></dd>
            <%}%>
        </dl>
    </li>
    <li class="layui-nav-item  layui-this">
        <a href="user-article.jsp"><i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;会员中心</a>
    </li>
</ul>