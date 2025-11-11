package com.blog.dao;

import com.blog.dao.utils.JDBCUtils;
import com.blog.dto.ArticleDTO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ArticleDAO extends JDBCUtils {

    public static void main(String[] args) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        ArticleDAO articleDAO = new ArticleDAO();
        list=articleDAO.getArticleList("JAVA");
        System.out.println(list);
    }
    //增加文章
    public boolean addArticle(ArticleDTO articleDTO) throws Exception {
        String sql="insert into t_article values(0,?,?,?,?,?)";
        if(this.executeNonQuery(sql,
                articleDTO.getTitle(),
                articleDTO.getContent(),
                articleDTO.getTypename(),
                articleDTO.getUsername(),
                articleDTO.getTime())!=0){
            return true;
        }
        return false;
    }
    //删除文章
    public boolean deleteArticle(int articleId) throws Exception {
        String sql = "delete from t_article where id=?";
        if(this.executeNonQuery(sql,articleId)>0){
            return true;
        }
        return false;
    }
    //修改文章
    public boolean editArticle(ArticleDTO articleDTO) throws Exception {
        String sql="update t_article set title=?,content=?,typename=?,time=? where id=?";
        if(this.executeNonQuery(sql,
                articleDTO.getTitle(),
                articleDTO.getContent(),
                articleDTO.getTypename(),
                articleDTO.getTime(),
                articleDTO.getId())>0){
            return true;
        }
        return false;
    }
    //查询文章,模糊查询,根据标题查找
    public List<ArticleDTO> getArticleList(String title) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        String sql = "select * from t_article where title like concat('%',?,'%')";
        list=this.getArticleList(sql,title);
        if(list!=null){
            return list;
        }
        return null;
    }

    //查询所有文章  ALL
    public List<ArticleDTO> getAllArticle() throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        String sql = "select * from t_article";
        list = this.getAllArticleList(sql);
        if(list!=null){
            return list;
        }
        return null;
    }

    //查询指定用户的所有文章
    public List<ArticleDTO> getUserArticle(String username) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        String sql = "select * from t_article where username=?";
        list = this.getUserArticleList(sql,username);
        if(list!=null){
            return list;
        }
        return null;
    }

    //查询指定文章ID的文章
    public ArticleDTO getIDArticle(int id) throws Exception {
        String sql = "select * from t_article where id=?";
        ArticleDTO articleDTO = new ArticleDTO();
        articleDTO = this.getIDArticleList(sql,id);
        if(articleDTO!=null){
            return articleDTO;
        }
        return null;
    }
    //查询指定分类的文章
    public List<ArticleDTO> getTypeArticle(String typename) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        String sql = "select * from t_article where typename=?";
        list = this.getTypeArticle(sql,typename);
        if(list!=null){
            return list;
        }
        return null;
    }

}
