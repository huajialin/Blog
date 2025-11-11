package com.blog.service;

import com.blog.dao.ArticleDAO;
import com.blog.dto.ArticleDTO;

import java.util.ArrayList;
import java.util.List;

public class ArticleService {

    //增加文章
    public boolean addArticleService(ArticleDTO articleDTO) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        if(articleDAO.addArticle(articleDTO)==true){
            return true;
        }
        return false;
    }

    //删除文章
    public boolean deleteArticle(int articleId) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        if(articleDAO.deleteArticle(articleId)==true){
            return true;
        }
        return false;
    }
    //更新文章
    public boolean editArticle(ArticleDTO articleDTO) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        if(articleDAO.editArticle(articleDTO)==true){
            return true;
        }
        return false;
    }

    //查询所有文章
    public List<ArticleDTO>  queryALLArticle() throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        return articleDAO.getAllArticle();
    }

    //查询指定用户所有文章
    public List<ArticleDTO>  queryUserArticle(String username) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        return articleDAO.getUserArticle(username);
    }

    //查询指定ID文章
    public ArticleDTO queryIDArticle(int id) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        return articleDAO.getIDArticle(id); //返回一个dto
    }

    //模糊查询，相关关键词的标题文章
    public List<ArticleDTO> getArticleList(String title) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        list = articleDAO.getArticleList(title);
        if(list!=null){
            return list;
        }
        return null;
    }
    ////查询指定分类的文章
    public List<ArticleDTO> getTypeArticle(String typename) throws Exception {
        ArticleDAO articleDAO = new ArticleDAO();
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        list = articleDAO.getTypeArticle(typename);
        if(list!=null){
            return list;
        }
        return null;
    }















}
