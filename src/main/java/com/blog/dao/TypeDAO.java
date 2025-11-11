package com.blog.dao;

import com.blog.dao.utils.JDBCUtils;
import com.blog.dto.TypeDTO;

import java.util.ArrayList;
import java.util.List;

public class TypeDAO extends JDBCUtils {
    //查询所有分类
    public List<TypeDTO> getAllType() throws Exception {
        List<TypeDTO> list = new ArrayList<TypeDTO>();
        String sql = "select * from t_type";
        list = this.getTypeDTOList(sql);
        if(list!=null){
            return list;
        }
        return null;
    }
    //添加分类
    public boolean addType(String typename) throws Exception {
        String sql="insert into t_type values(0,?)";
        TypeDAO typeDAO = new TypeDAO();
        if(typeDAO.executeNonQuery(sql,typename)!=0){
            return true;
        }
        return false;
    }
    //更新分类
    public boolean updateType(String typename,int id) throws Exception {
        String sql="update t_type set typeName=? where id=?";
        TypeDAO typeDAO = new TypeDAO();
        if(typeDAO.executeNonQuery(sql,typename,id)!=0){
            return true;
        }
        return false;
    }
    //根据id删除分类
    public boolean deleteType(int id) throws Exception {
        String sql="delete from t_type where id=?";
        TypeDAO typeDAO = new TypeDAO();
        if(typeDAO.executeNonQuery(sql,id)!=0){
            return true;
        }
        return false;
    }
    //根据ID查询分类
    public TypeDTO getIdType(int id) throws Exception {
        String sql = "select * from t_type where id=?";
        TypeDTO typeDTO = new TypeDTO();
        typeDTO = super.getIdType(sql,id);
        if(typeDTO!=null){
            return typeDTO;
        }
        return null;
    }
}
