<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>welcome page</title>
</head>

<body>
    this is the first try   =    ${message }

    <p id="demo">不能回去睡觉</p>
    <script>
        document.getElementById("demo").innerHTML='${message_2}';
    </script>


    <form action="register.do" method="post">
        姓名：<input type="text" name="name" >
        <input type="text" name="age" >
        <input type="submit" value="注册">
    </form>

</body>
</html>
