<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var url="${pageContext.request.contextPath}/articleAll.do";
            $.post(url,function (data) {
/*                var jsonObj=eval(data);
                //将json数据遍历转化成相应的html代码插入到首页
                var html="";
                for(var i=0;i<jsonObj.length;i++){

                }
                alert(html);*/
            })
        })
    </script>
</head>
<body>

</body>
</html>
