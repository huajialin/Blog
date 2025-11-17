一、项目整体结构（树状展示）
plaintext
Blog/
├── pom.xml
├── blog.sql
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── blog/
│       │           ├── dao/
│       │           │   ├── ArticleDAO.java
│       │           │   ├── UserDAO.java
│       │           │   ├── AdminUserDAO.java
│       │           │   └── utils/
│       │           │       └── JDBCUtils.java
│       │           ├── dto/
│       │           │   ├── UserDTO.java
│       │           │   ├── ArticleDTO.java
│       │           │   ├── AdminUserDTO.java
│       │           │   └── TypeDTO.java
│       │           ├── service/
│       │           │   ├── UserService.java
│       │           │   ├── ArticleService.java
│       │           │   └── AdminUserService.java
│       │           └── servlet/
│       │               ├── UserServlet.java
│       │               ├── GetArticleServlet.java
│       │               └── ArticleServlet.java
│       └── webapp/
│           ├── css/
│           │   ├── global.css
│           │   └── about.css
│           ├── js/
│           │   └── global.js
│           ├── lib/
│           │   └── utf8-jsp/
│           │       ├── dialogs/
│           │       │   ├── scrawl/
│           │       │   │   └── scrawl.js
│           │       │   ├── video/
│           │       │   │   └── video.js
│           │       │   └── attachment/
│           │       │       └── attachment.js
│           │       └── third-party/
│           │           └── webuploader/
│           │               ├── webuploader.withoutimage.js
│           │               └── webuploader.flashonly.js
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── index.jsp
│           ├── login.jsp
│           ├── user-article-update.jsp
│           ├── user-article-manage.jsp
│           ├── detail.jsp
│           └── admin/
│               ├── update-article.jsp
│               ├── article.jsp
│               └── manage-user.jsp

二、人员分工对应的项目文件
1. 人员 1：用户体系核心功能
plaintext
Blog/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── blog/
│       │           ├── dao/
│       │           │   └── UserDAO.java  // 用户数据CRUD（注册/登录/信息修改的数据库操作）
│       │           ├── dto/
│       │           │   └── UserDTO.java  // 用户数据传输模型（封装账号、密码、个人信息等）
│       │           ├── service/
│       │           │   └── UserService.java  // 用户业务逻辑（注册校验、密码加密、Session管理）
│       │           └── servlet/
│       │               └── UserServlet.java  // 处理用户请求（注册/登录/信息修改的接口）
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml  // 配置UserServlet映射（用户相关请求路由）
│           └── admin/
│               └── manage-user.jsp  // 管理员用户管理功能（与用户数据交互部分）

2. 人员 2：文章核心功能
plaintext
Blog/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── blog/
│       │           ├── dao/
│       │           │   └── ArticleDAO.java  // 文章数据CRUD（发布/编辑/删除的数据库操作）
│       │           ├── dto/
│       │           │   ├── ArticleDTO.java  // 文章数据传输模型（封装标题、内容、分类等）
│       │           │   └── TypeDTO.java  // 文章分类/标签数据模型
│       │           ├── service/
│       │           │   └── ArticleService.java  // 文章业务逻辑（阅读量统计、分页查询、分类关联）
│       │           └── servlet/
│       │               ├── GetArticleServlet.java  // 文章查询/详情展示接口
│       │               └── ArticleServlet.java  // 文章发布/编辑/删除接口
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml  // 配置Article相关Servlet映射（文章请求路由）
│           ├── user-article-update.jsp  // 文章编辑/发布功能（与文章数据交互部分）
│           ├── user-article-manage.jsp  // 用户文章管理（列表/删除功能交互部分）
│           ├── detail.jsp  // 文章详情展示（阅读量统计交互部分）
│           └── admin/
│               ├── update-article.jsp  // 管理员文章编辑功能
│               └── article.jsp  // 管理员文章管理功能

3. 人员 3：富文本与文件上传
plaintext
Blog/
└── src/
    └── main/
        └── webapp/
            └── lib/
                └── utf8-jsp/
                    ├── dialogs/
                    │   ├── scrawl/
                    │   │   └── scrawl.js  // 富文本涂鸦功能（画笔控制、画布交互、撤销/保存）
                    │   ├── video/
                    │   │   └── video.js  // 视频上传管理（文件选择、进度显示、错误处理）
                    │   └── attachment/
                    │       └── attachment.js  // 附件上传管理（文件队列、格式校验、状态切换）
                    └── third-party/
                        └── webuploader/
                            ├── webuploader.withoutimage.js  // 非图片文件上传核心逻辑
                            └── webuploader.flashonly.js  // Flash兼容的文件上传处理

4. 人员 4：前端页面与交互
plaintext
Blog/
└── src/
    └── main/
        └── webapp/
            ├── css/
            │   ├── global.css  // 全局页面样式（布局、组件样式）
            │   └── about.css  // 相关页面样式补充
            ├── js/
            │   └── global.js  // 前端基础交互（页面跳转、表单验证、异步请求）
            ├── index.jsp  // 首页布局与静态渲染（文章列表展示、导航栏）
            ├── login.jsp  // 登录/注册页面布局（表单样式、交互反馈）
            ├── user-article-update.jsp  // 文章编辑页布局（富文本编辑器嵌入、按钮交互）
            ├── user-article-manage.jsp  // 文章管理页布局（分页控件、操作按钮）
            ├── detail.jsp  // 文章详情页布局（内容渲染、评论区占位）
            └── admin/
                ├── update-article.jsp  // 管理员编辑页布局
                ├── article.jsp  // 管理员文章管理页布局
                └── manage-user.jsp  // 管理员用户管理页布局
