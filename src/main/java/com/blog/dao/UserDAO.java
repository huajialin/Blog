package com.blog.dao;

import com.blog.dao.utils.JDBCUtils;
import com.blog.dto.ArticleDTO;
import com.blog.dto.UserDTO;

import java.util.ArrayList;
import java.util.List;

/*
*
* 描述：对数据库中user表进行 增删改查 基本操作的定义
* @return
* */
public class UserDAO extends JDBCUtils {
    //新增用户
    public boolean addUser(UserDTO user) throws Exception {
        String sql="insert into t_user values(0,?,?)";
        if(this.executeNonQuery(sql, user.getUsername(), user.getPassword())>0){
            return true;
        }
        return false;
    }

    //查询用户名是否存在
    public boolean isExistUsername(UserDTO userDTO) throws Exception {
        String sql="select * from t_user where username=?";
        if(this.getUserDTO(sql,userDTO.getUsername())!=null){
            return true;
        }
        return false;
    }


    //用户登入验证  验证用户名密码是否正确
    public UserDTO userLogin(UserDTO userDTO) throws Exception {
        String sql="select * from t_user where username=? and password=?";
        if(this.getUserDTO(sql,userDTO.getUsername(),userDTO.getPassword())!=null){
            return userDTO;
        }
        return null;
    }

    //删除用户
    public boolean deleteUser(int userId) throws Exception {
        String sql = "delete from t_user where id=?";
        if(this.executeNonQuery(sql,userId)>0){
            return true;
        }
        return false;
    }
    //更新用户密码
    public boolean newUpdateUser(int userId,String password) throws Exception {
        String sql = "update t_user set password=? where id=?";
        if(this.executeNonQuery(sql,password,userId)>0){
            return true;
        }
        return false;
    }

    //获取所有用户
    public List<UserDTO> getAllUser() throws Exception {
        String sql = "select * from t_user";
        List<UserDTO> list = new ArrayList<UserDTO>();
        list = this.getAllUser(sql);
        if(list!=null){
            return list;
        }
        return null;
    }

    //获取指定ID用户
    public UserDTO getIDUser(int id) throws Exception {
        String sql = "select * from t_user where id=?";
        UserDTO userDTO = new UserDTO();
        userDTO = this.getIDUser(sql,id);
        if(userDTO!=null){
            return userDTO;
        }
        return null;
    }







}
