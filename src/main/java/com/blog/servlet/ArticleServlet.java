package com.blog.servlet;

import com.alibaba.fastjson.JSONObject;
import com.blog.dto.AdminUserDTO;
import com.blog.dto.ArticleDTO;
import com.blog.dto.UserDTO;
import com.blog.service.ArticleService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/article.do")
public class ArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理响应数据中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        ArticleDTO articleDTO = new ArticleDTO();
        ArticleService articleService = new ArticleService();


        /*
         * 以下发布文章
         * @return
         * */
        if (action.equals("addarticle")) {
            boolean result = false;
            /*获取session中用户登入信息*/
            UserDTO userDTO = (UserDTO) request.getSession().getAttribute("userDTO");
            /*获取发布信息*/
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String typename = request.getParameter("typename");
            String username = userDTO.getUsername();
            String time = request.getParameter("time");
            articleDTO.setTitle(title);
            articleDTO.setContent(content);
            articleDTO.setTypename(typename);
            articleDTO.setUsername(username);
            articleDTO.setTime(time);

            try {
                result=articleService.addArticleService(articleDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(result==true){
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('发布成功');");
                out.println("window.location.href='user-article.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }else{
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('发布失败');");
                out.println("window.location.href='user-article.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        /*
         * 前台-以下删除文章
         * @return
         * */
        else if(action.equals("delete")){
            boolean result = false;
            String articleId = request.getParameter("id");
            Integer wrapper  = Integer.parseInt(articleId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            articleDTO.setId(id);
            try {
                result = articleService.deleteArticle(articleDTO.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }if(result==true){
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('删除成功');");
                out.println("window.location.href='user-article-manage.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }else{
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('删除失败');");
                out.println("window.location.href='user-article-manage.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        /*
         * 后台-以下删除文章
         * @return
         * */
        else if(action.equals("delete-admin")){
            boolean result = false;
            String articleId = request.getParameter("id");
            Integer wrapper  = Integer.parseInt(articleId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            articleDTO.setId(id);
            try {
                result = articleService.deleteArticle(articleDTO.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }if(result==true){
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('删除成功');");
                out.println("window.location.href='admin/article.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }else{
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('删除失败');");
                out.println("window.location.href='admin/user-article-manage.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request,response);
    }
}
