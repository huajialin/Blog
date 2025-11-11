package com.blog.service;

import com.blog.dao.AdminUserDAO;
import com.blog.dto.AdminUserDTO;

public class AdminUserService {

    /*后台用户登入业务
     * @return  true 表示登入成功，false表示登入失败
     */
    public boolean adminLogin(String username,String password) throws Exception {
        AdminUserDAO adminUserDAO = new AdminUserDAO();
        if(adminUserDAO.checkLogin(username,password)==true){
            return true;
        }
        return false;
    }
}
