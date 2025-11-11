package com.blog.dao.utils;
import com.blog.dao.TypeDAO;
import com.blog.dto.AdminUserDTO;
import com.blog.dto.ArticleDTO;
import com.blog.dto.TypeDTO;
import com.blog.dto.UserDTO;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JDBCUtils {
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;

    //数据库连接操作
    public void init() throws Exception {
        Class.forName("org.gjt.mm.mysql.Driver");
        String url = "jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=UTF8&autoReconnect=true&autoReconnectForPools=true";
        String user = "root";
        String pwd = "root";
        conn = DriverManager.getConnection(url, user, pwd);
    }

    //数据库关闭操作
    public void closeAll() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }



    /*通用数据库所有 增删改 操作
     * sql 带？号的sql语句
     * params ？中具体的参数
     * @return
     */
    public int executeNonQuery(String sql, Object... params) throws Exception {
        //获取一个连接
        init();
        //根据sql和连接，获取一个声明
        try {
            pstmt = conn.prepareStatement(sql);
            //加入所有参数
            for(int i =0;i<params.length;i++){
                pstmt.setObject(i+1,params[i]);
            }
            int hang = pstmt.executeUpdate(); //返回影响的行数
            this.closeAll();
            return hang;
        } catch (SQLException e){
            System.out.println("执行通用数据库Sql出错");
            e.printStackTrace();
        }
        return 0;
    }



    /*自定义查询用户名是否存在
     * sql 带？号的sql语句
     * params ？中具体的参数
     * @return
     */
    public UserDTO getUserDTO(String sql,String username) throws Exception {
        //获取一个连接
        init();
        //根据sql和连接，获取一个声明
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,username); //把用户名加入到参数中，替换？
            rs = pstmt.executeQuery(); //执行查询，获取结果集合
            if(rs.next()){    //true说明查到一条数据
                UserDTO userDTO = new UserDTO();
                userDTO.setId(rs.getInt("id"));
                userDTO.setUsername(rs.getString("username"));
                userDTO.setPassword(rs.getString("password"));
                this.closeAll();
                return userDTO;
            }
        }catch (SQLException e){
            System.out.println("执行查询用户名是否存在Sql出错");
            e.printStackTrace();
        }
        return null;
    }

    /*自定义查询用户登入，根据用户名和密码
     * sql 带？号的sql语句
     * params ？中具体的参数
     * @return
     */
    public UserDTO getUserDTO(String sql,String username,String password) throws Exception {
        //获取一个连接
        init();
        //根据sql和连接，获取一个声明
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,username);
            pstmt.setObject(2,password);
            rs = pstmt.executeQuery();
            if(rs.next()){
                UserDTO userDTO = new UserDTO();
                userDTO.setId(rs.getInt("id"));
                userDTO.setUsername(rs.getString("username"));
                userDTO.setPassword(rs.getString("password"));
                this.closeAll();
                return userDTO;
            }
        }catch (SQLException e){
            System.out.println("执行查询用户名是否存在Sql出错");
            e.printStackTrace();
        }
        return null;
    }


    /*自定义查后台用户登入，根据用户名和密码
     *登入验证
     * sql 带？号的sql语句
     * params ？中具体的参数
     * @return
     */
    public boolean checkLogin(String username,String password) throws Exception {
        init();
        String sql = "select * from t_adminuser where username = ? and password= ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,username);
        pstmt.setString(2,password);
        rs = pstmt.executeQuery();
        if (rs.next()){
            this.closeAll();
            return true;
        }else{
            return false;
        }
    }


    /*数据库模糊 查询 操作,根据文章标题模糊查询对应的文章
     * @return
     */

    public List<ArticleDTO> getArticleList(String sql, String title) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,title); //加参数
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(rs.getInt("id"));
                articleDTO.setTitle(rs.getString("title"));
                articleDTO.setContent(rs.getString("content"));
                articleDTO.setTypename(rs.getString("typename"));
                articleDTO.setUsername(rs.getString("username"));
                articleDTO.setTime(rs.getString("time"));
                list.add(articleDTO);
            }
            return list;
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }
    /*数据库模糊 查询 操作,根据文章标题模糊查询对应的文章
     * @return
     */
    public List<ArticleDTO> getTypeArticle(String sql,String typename) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,typename); //加参数
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(rs.getInt("id"));
                articleDTO.setTitle(rs.getString("title"));
                articleDTO.setContent(rs.getString("content"));
                articleDTO.setTypename(rs.getString("typename"));
                articleDTO.setUsername(rs.getString("username"));
                articleDTO.setTime(rs.getString("time"));
                list.add(articleDTO);
            }
            return list;
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }


    /*查询所有发布的文章
     * @return
     */

    public List<ArticleDTO> getAllArticleList(String sql) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(rs.getInt("id"));
                articleDTO.setTitle(rs.getString("title"));
                articleDTO.setContent(rs.getString("content"));
                articleDTO.setTypename(rs.getString("typename"));
                articleDTO.setUsername(rs.getString("username"));
                articleDTO.setTime(rs.getString("time"));
                list.add(articleDTO);
            }
            return list;
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }


    /*根据用户名查询所有发布的文章
     * @return
     */

    public List<ArticleDTO> getUserArticleList(String sql,String username) throws Exception {
        List<ArticleDTO> list = new ArrayList<ArticleDTO>();
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,username); //加参数
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(rs.getInt("id"));
                articleDTO.setTitle(rs.getString("title"));
                articleDTO.setContent(rs.getString("content"));
                articleDTO.setTypename(rs.getString("typename"));
                articleDTO.setUsername(rs.getString("username"));
                articleDTO.setTime(rs.getString("time"));
                list.add(articleDTO);
            }
            return list;
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }

    /*根据文章ID查询文章
     * @return
     */
    public ArticleDTO getIDArticleList(String sql,int id) throws Exception {
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,id); //加参数
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setId(rs.getInt("id"));
                articleDTO.setTitle(rs.getString("title"));
                articleDTO.setContent(rs.getString("content"));
                articleDTO.setTypename(rs.getString("typename"));
                articleDTO.setUsername(rs.getString("username"));
                articleDTO.setTime(rs.getString("time"));
                return articleDTO;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }

    /*查询所有分类
     * @return
     */
    public List<TypeDTO> getTypeDTOList(String sql) throws Exception {
        List<TypeDTO> list = new ArrayList<TypeDTO>();
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                TypeDTO typeDTO = new TypeDTO();
                typeDTO.setId(rs.getInt("id"));
                typeDTO.setTypeName(rs.getString("typeName"));
                list.add(typeDTO);
            }
            return list;
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }
    /*根据ID查询分类
     * @return
     */
    public TypeDTO getIdType(String sql,int id) throws Exception {
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,id); //加参数
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                TypeDTO typeDTO = new TypeDTO();
                typeDTO.setId(rs.getInt("id"));
                typeDTO.setTypeName(rs.getString("typeName"));
                this.closeAll();
                return typeDTO;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }

    /*查询所有用户
     * @return
     */
    public List<UserDTO> getAllUser(String sql) throws Exception {
        List<UserDTO> list = new ArrayList<UserDTO>();
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                UserDTO userDTO = new UserDTO();
                userDTO.setId(rs.getInt("id"));
                userDTO.setUsername(rs.getString("username"));
                list.add(userDTO);
            }
            return list;
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }


    /*根据用户ID查询用户信息
     * @return
     */
    public UserDTO getIDUser(String sql,int id) throws Exception {
        //获取一个连接
        init();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1,id); //加参数
            rs = pstmt.executeQuery(); //执行查询
            while (rs.next()){   //循环读取数据
                UserDTO userDTO = new UserDTO();
                userDTO.setId(rs.getInt("id"));
                userDTO.setUsername(rs.getString("username"));
                userDTO.setPassword(rs.getString("password"));
                return userDTO;
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            this.closeAll();
        }
        return null;
    }




}
