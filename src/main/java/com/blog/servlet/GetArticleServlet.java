package com.blog.servlet;

import com.alibaba.fastjson.JSONObject;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/articleAll.do")
public class GetArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        ArticleService articleService = new ArticleService();
        HttpSession session = request.getSession();
        UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
        /*
         * 获取所有文章
         * @return
         * */
        if (action.equals("all")) {
            List<ArticleDTO> allList = new ArrayList<ArticleDTO>();
            try {
                allList = articleService.queryALLArticle();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (allList != null) {
                //将list转化成json响应到浏览器
                String allArticleJson = JSONObject.toJSONString(allList);
                response.getWriter().write(allArticleJson);
            }
            /*
             * 获取指定用户所有文章
             * @return
             * */
        }else if(action.equals("username")){
            List<ArticleDTO> userList = new ArrayList<ArticleDTO>();
            try {
                userList = articleService.queryUserArticle(userDTO.getUsername());
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (userList != null) {
                //将list转化成json响应到浏览器
                String userArticleJson = JSONObject.toJSONString(userList);
                response.getWriter().write(userArticleJson);
            }
        }
        /*
         * 前台--获取指定id的文章，获取旧数据
         * @return
         * */
        else if(action.equals("update")){
            //获取要修改的文章的编号
            String articleId = request.getParameter("id");
            //Sring类型转化Integer包装类
            Integer wrapper  = Integer.parseInt(articleId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            try {
                //根据编号查到文章的旧信息
                ArticleDTO articleDTO = articleService.queryIDArticle(id);
                //把所有文章信息存储到request中
                request.setAttribute("articleDTO",articleDTO);
                //转发数据到修改页面
                request.getRequestDispatcher("user-article-update.jsp").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 前台--获取指定id的文章，更新新数据
         * @return
         * */
        else if(action.equals("newUpdate")){
            try {
                /*获取表单信息*/
                String articleId = request.getParameter("id");
                Integer wrapper  = Integer.parseInt(articleId);
                //Integer类型转化int类型
                int id = wrapper.intValue();
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String typename = request.getParameter("typename");
                String time = request.getParameter("time");
                //封装成一个ArticleDTO
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(id);
                articleDTO.setTitle(title);
                articleDTO.setContent(content);
                articleDTO.setTypename(typename);
                articleDTO.setTime(time);
                if(articleService.editArticle(articleDTO)==true){
                    response.setCharacterEncoding("utf-8");
                    response.setContentType("text/html; charset=utf-8");
                    PrintWriter out = response.getWriter();
                    out.println("<html>");
                    out.println("<head>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('修改成功');");
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
                    out.println("alert('修改失败');");
                    out.println("window.location.href='user-article-manage.jsp';");
                    out.println("</script>");
                    out.println("</body>");
                    out.println("</html>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 后台--获取指定id的文章，获取旧数据
         * @return
         * */
        else if(action.equals("update-admin")){
            //获取要修改的文章的编号
            String articleId = request.getParameter("id");
            //Sring类型转化Integer包装类
            Integer wrapper  = Integer.parseInt(articleId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            try {
                //根据编号查到文章的旧信息
                ArticleDTO articleDTO = articleService.queryIDArticle(id);
                //把所有文章信息存储到request中
                request.setAttribute("articleDTO",articleDTO);
                //转发数据到修改页面
                request.getRequestDispatcher("admin/update-article.jsp").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 后台--获取指定id的文章，更新新数据
         * @return
         * */
        else if(action.equals("newUpdate-admin")){
            try {
                /*获取表单信息*/
                String articleId = request.getParameter("id");
                Integer wrapper  = Integer.parseInt(articleId);
                //Integer类型转化int类型
                int id = wrapper.intValue();
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String typename = request.getParameter("typename");
                String time = request.getParameter("time");
                //封装成一个ArticleDTO
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(id);
                articleDTO.setTitle(title);
                articleDTO.setContent(content);
                articleDTO.setTypename(typename);
                articleDTO.setTime(time);
                if(articleService.editArticle(articleDTO)==true){
                    response.setCharacterEncoding("utf-8");
                    response.setContentType("text/html; charset=utf-8");
                    PrintWriter out = response.getWriter();
                    out.println("<html>");
                    out.println("<head>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('修改成功');");
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
                    out.println("alert('修改失败');");
                    out.println("window.location.href='article.jsp';");
                    out.println("</script>");
                    out.println("</body>");
                    out.println("</html>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 获取指定id的文章内容
         * @return
         * */
        else if(action.equals("read")){
            //获取要修改的文章的编号
            String articleId = request.getParameter("id");
            //Sring类型转化Integer包装类
            Integer wrapper  = Integer.parseInt(articleId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            try {
                //根据编号查到文章的旧信息
                ArticleDTO articleDTO = articleService.queryIDArticle(id);
                //把所有文章信息存储到request中
                request.setAttribute("articleDTO",articleDTO);
                //转发数据到修改页面
                request.getRequestDispatcher("detail.jsp").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 获取与标题相关关键词的文章
         * @return
         * */
        else if(action.equals("search")){
            String title = request.getParameter("title");
            List<ArticleDTO> list = new ArrayList<ArticleDTO>();
            try {
                list = articleService.getArticleList(title);
                if(list!=null){
                    //把所有文章信息存储到request中
                    request.setAttribute("articleDTO",list);
                    //转发数据到查询页面
                    request.getRequestDispatcher("article-search.jsp").forward(request,response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 获取相关分类的文章
         * @return
         * */
        else if(action.equals("type")){
            String typename = request.getParameter("typename");
            List<ArticleDTO> list = new ArrayList<ArticleDTO>();
            try {
                list = articleService.getTypeArticle(typename);
                if(list!=null){
                    //把所有文章信息存储到request中
                    request.setAttribute("articleDTO",list);
                    //转发数据到查询页面
                    request.getRequestDispatcher("article.jsp").forward(request,response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
