package com.blog.servlet;

import com.blog.dto.AdminUserDTO;
import com.blog.service.AdminUserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/admin/adminuser.do")
public class AdminUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //前端获取action  用户名和密码
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminUserDTO adminUserDTO = new AdminUserDTO();
        adminUserDTO.setUsername(username);
        adminUserDTO.setPassword(password);

        //创建一个AdminUserService的实例
        AdminUserService adminUserService = new AdminUserService();


        //session 销毁

        /*
         * 以下是验证登入
         * @return
         * */

        if (action.equals("admin-login")) {
            boolean result = false;
            try {
                result=adminUserService.adminLogin(username,password);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(result==true){
                request.getSession().setAttribute("adminUserDTO",adminUserDTO);  //后台登入信息存入session
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('登入成功');");
                out.println("window.location.href='admin.jsp';");
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
                out.println("alert('用户登入失败，用户名密码错误');");
                out.println("window.location.href='admin-login.jsp';");
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
