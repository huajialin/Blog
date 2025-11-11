package com.blog.service;

import com.blog.dao.TypeDAO;
import com.blog.dto.TypeDTO;

import java.util.ArrayList;
import java.util.List;

public class TypeService {
    //查询所有分类
    public List<TypeDTO> getAllType() throws Exception {
        TypeDAO typeDAO = new TypeDAO();
        List<TypeDTO> list = new ArrayList<TypeDTO>();
        list = typeDAO.getAllType();
        if(list!=null){
            return list;
        }
        return null;
    }
    //添加分类
    public boolean addType(String typename) throws Exception {
        TypeDAO typeDAO = new TypeDAO();
        if(typeDAO.addType(typename)==true){
            return true;
        }
        return false;
    }

    //根据id删除分类
    public boolean deleteType(int id) throws Exception {
        TypeDAO typeDAO = new TypeDAO();
        if(typeDAO.deleteType(id)==true){
            return true;
        }
        return false;
    }
    //根据id更新分类
    public boolean updateType(String typeName,int id) throws Exception {
        TypeDAO typeDAO = new TypeDAO();
        if(typeDAO.updateType(typeName,id)==true){
            return true;
        }
        return false;
    }
    //根据ID查询分类
    public TypeDTO getIdType(int id) throws Exception {
        TypeDTO typeDTO = new TypeDTO();
        TypeDAO typeDAO = new TypeDAO();
        typeDTO = typeDAO.getIdType(id);
        if(typeDTO!=null){
            return typeDTO;
        }
        return null;
    }
}
