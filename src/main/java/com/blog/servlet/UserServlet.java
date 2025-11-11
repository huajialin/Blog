package com.blog.servlet;

import com.alibaba.fastjson.JSONObject;
import com.blog.dto.TypeDTO;
import com.blog.dto.UserDTO;
import com.blog.service.UserService;

import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user.do")
public class UserServlet extends jakarta.servlet.http.HttpServlet {
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        //获取login.jsp  action，username，password 的值
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDTO userDTO = new UserDTO();
        userDTO.setUsername(username);
        userDTO.setPassword(password);

        UserService userService = new UserService();
        /*
         * 以下是用户注册业务
         * @return
         * */
        if (action.equals("register")) {
            boolean result = false;
            try {
                result = userService.register(userDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result) {
                // request.setAttribute("msg","注册成功");
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('注册成功');");
                out.println("window.location.href='index.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                // request.setAttribute("msg","用户名已经存，注册失败");
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('用户名已经存，注册失败');");
                out.println("window.location.href='login.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
            /*
             * 以下是用户登入业务
             * @return
             * */
        } else if (action.equals("login")) {
            UserDTO result = null;
            try {
                result = userService.login(userDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result != null) {
                request.setAttribute("msg", "登入成功");
                request.getSession().setAttribute("userDTO", userDTO);  //把当前的登入信息存入session
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('登入成功');");
                out.println("window.location.href='index.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                request.setAttribute("msg", "用户登入失败，用户名密码错误");
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('用户登入失败，用户名密码错误');");
                out.println("window.location.href='login.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
            /*
             * 以下是注销登入业务
             * @return
             * */
        } else if (action.equals("loginout")) {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
            /*
             * 以下是获取全部用户
             * @return
             * */
        } else if (action.equals("getAllUser")) {
            List<UserDTO> userList = new ArrayList<UserDTO>();
            try {
                userList = userService.getAllUser();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (userList != null) {
                //将list转化成json响应到浏览器
                String typeJson = JSONObject.toJSONString(userList);
                response.getWriter().write(typeJson);
            }
            /*
             * 以下是后台添加用户业务
             * @return
             * */
        } else if (action.equals("addUser")) {
            boolean result = false;
            try {
                result = userService.register(userDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }if (result) {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('添加成功');");
                out.println("window.location.href='admin/manage-user.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('用户名已经存，添加失败');");
                out.println("window.location.href='admin/manage-user.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
            /*
             * 以下是删除用户业务
             * @return
             * */
        }else if(action.equals("delete")){
            boolean result = false;
            String userId = request.getParameter("id");
            Integer wrapper  = Integer.parseInt(userId);
            int id = wrapper.intValue();
            userDTO.setId(id);
            try {
                result = userService.deleteUser(userDTO.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }if (result == true) {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('删除成功');");
                out.println("window.location.href='admin/manage-user.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('删除失败');");
                out.println("window.location.href='admin/manage-user.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        /*
         * 以下是更新用户业务，获取旧数据
         * @return
         * */
        else if(action.equals("updateUser")){
            //获取要修改的文章的编号
            String userId = request.getParameter("id");
            //Sring类型转化Integer包装类
            Integer wrapper  = Integer.parseInt(userId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            try {
                userDTO = userService.getIDUser(id);
                request.setAttribute("userDTO",userDTO);
                request.getRequestDispatcher("admin/user-data-update.jsp").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         * 以下是更新用户业务，添加新数据
         * @return
         * */
        else if(action.equals("newUpdateUser")){
            boolean result = false;
            String userId = request.getParameter("id");
            Integer wrapper  = Integer.parseInt(userId);
            int id = wrapper.intValue();
            userDTO.setId(id);
            try {
                result = userService.newUpdateUser(userDTO.getId(),userDTO.getPassword());
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result == true) {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('修改成功');");
                out.println("window.location.href='admin/manage-user.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            } else {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('修改失败');");
                out.println("window.location.href='admin/manage-user.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
        this.doPost(request, response);
    }

}
