<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>登入</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/normalize.min.css">


    <link rel="stylesheet" href="css/style-2.css">

    <script src="http://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>
    <script src="plug/layui/layui.js"></script>

</head>

<body>


<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>

<div class="form">

    <ul class="tab-group">
        <li class="tab active"><a href="#signup">注册</a></li>
        <li class="tab"><a href="#login">登入</a></li>
    </ul>

    <div class="tab-content">
        <!--注册模块-->
        <div id="signup">
            <h1>注册</h1>

            <form action="user.do?action=register" method="post">

                <div class="field-wrap">
                    <label>
                        用户名<span class="req">*</span>
                    </label>
                    <input type="text" name="username" required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        密码<span class="req">*</span>
                    </label>
                    <input type="password" name="password" required autocomplete="off"/>
                </div>

                <button type="submit" class="button button-block"/>注册</button>

            </form>

        </div>

        <!--登入模块-->
        <div id="login">
            <h1>欢迎回来!</h1>

            <form action="user.do?action=login" method="post">

                <div class="field-wrap">
                    <label>
                        用户名<span class="req">*</span>
                    </label>
                    <input type="text" name="username" required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        密码<span class="req">*</span>
                    </label>
                    <input type="password" name="password" required autocomplete="off"/>
                </div>


                <button type="submit" class="button button-block"/>登入</button>

            </form>

        </div>

    </div><!-- tab-content -->

</div> <!-- /form -->
<script src='js/jquery.min.js'></script>

<script  src="js/index.js"></script>

</body>
</html>
