package com.blog.servlet;

import com.alibaba.fastjson.JSONObject;
import com.blog.dto.TypeDTO;
import com.blog.service.TypeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/type.do")
public class TypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理响应数据中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        TypeService typeService = new TypeService();
        String action = request.getParameter("action");

        /*
         * 获取所有分类
         * @return
         * */
        if(action.equals("gettype")){
            List<TypeDTO> typeList = new ArrayList<TypeDTO>();
            try {
                typeList = typeService.getAllType();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (typeList != null) {
                //将list转化成json响应到浏览器
                String typeJson = JSONObject.toJSONString(typeList);
                response.getWriter().write(typeJson);

            }
        }
        else if(action.equals("updateType")){
            String typename = request.getParameter("typename");
            String id = request.getParameter("id");
            int typeId = Integer.parseInt(id);
            boolean result=false;
            try {
                result = typeService.updateType(typename,typeId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(result==true){
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('修改成功');");
                out.println("window.location.href='add-category.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        /*
         * 添加分类
         * @return
         * */
        else if(action.equals("addtype")){
            String typename = request.getParameter("typename");
            boolean result=false;
            try {
                result = typeService.addType(typename);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(result==true){
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('添加成功');");
                out.println("window.location.href='add-category.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        else if(action.equals("deleteType")){
            String typeId = request.getParameter("id");
            Integer wrapper  = Integer.parseInt(typeId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            boolean result=false;
            try {
                result = typeService.deleteType(id);
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
                out.println("window.location.href='add-category.jsp';");
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
                out.println("window.location.href='add-category.jsp';");
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
            }

        }
        /*
         * 根据ID查询分类
         * @return
         * */
        else if(action.equals("getType")){
            //获取要修改的类型的编号
            String typeId = request.getParameter("id");
            //Sring类型转化Integer包装类
            Integer wrapper  = Integer.parseInt(typeId);
            //Integer类型转化int类型
            int id = wrapper.intValue();
            try {
                //根据编号查到分类的旧信息
                TypeDTO typeDTO = new TypeDTO();
                typeDTO = typeService.getIdType(id);
                //把所有分类信息存储到request中
                request.setAttribute("typeDTO",typeDTO);
                //转发数据到修改页面
                request.getRequestDispatcher("update-category.jsp").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
