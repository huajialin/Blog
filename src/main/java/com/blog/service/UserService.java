package com.blog.service;

import com.blog.dao.ArticleDAO;
import com.blog.dao.UserDAO;
import com.blog.dto.ArticleDTO;
import com.blog.dto.UserDTO;

import java.util.ArrayList;
import java.util.List;

public class UserService {
    UserDAO userDAO = new UserDAO();

    /*用户注册业务
     * @return true 表示插入成功  false 表示插入失败 或者 用户名重复
     */
    public boolean register(UserDTO userDTO) throws Exception {
        if (userDAO.isExistUsername(userDTO) == false) {
            boolean result = userDAO.addUser(userDTO);
            return result;  //如果用户名不存在则插入到数据库
        }else{
            return false; //如果用户名存在则返回false
        }
    }
    /*自用户登入业务
     * @return  true 表示登入成功，false表示登入失败
     */
    public UserDTO login(UserDTO userDTO) throws Exception{
        if(userDAO.userLogin(userDTO)!=null){
            return userDTO;
        }
        return null;
    }

    /*获取所有前台用户
     * @return  true 表示登入成功，false表示登入失败
     */
    public List<UserDTO> getAllUser() throws Exception {
        List<UserDTO> list = new ArrayList<UserDTO>();
        list = userDAO.getAllUser();
        if(list!=null){
            return list;
        }
        return null;
    }
    /*删除前台用户
     * @return  true 表示登入成功，false表示登入失败
     */
    public boolean deleteUser(int userId) throws Exception {
        if(userDAO.deleteUser(userId)==true){
            return true;
        }
        return false;
    }
    /*更新前台用户
     * @return
     */
    public boolean newUpdateUser(int userId,String password) throws Exception {
        if(userDAO.newUpdateUser(userId,password)==true){
            return true;
        }
        return false;
    }
    /*获取指定ID用户信息
     * @return  true 表示登入成功，false表示登入失败
     */
    public UserDTO getIDUser(int id) throws Exception {
        UserDAO userDAO = new UserDAO();
        return userDAO.getIDUser(id); //返回一个dto
    }
}
