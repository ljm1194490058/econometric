<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>经济预测与政策模拟系统平台——登录</title>
	<link rel="stylesheet" type="text/css" href="../css/2.0_login.css"/>
</head>
<body style="background-color: #eee">
	<div style="padding-top:0;left:10%;">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab">登 录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up">
				<label for="tab-2" class="tab">注 册</label>
				
				<div class="login-form">
					<form action="login" method="post">
						<div class="sign-in-htm">
							<div class="group">
								<label for="user" class="label">用户名</label>
								<input id="user" name="user" type="text" class="input">
							</div>
							<div class="group">
								<label for="pass" class="label">密码</label>
								<input id="pass" name="pass" type="password" class="input" data-type="password">
							</div>
							<div class="group">
								<input id="check" type="checkbox" class="check" checked>
								<label for="check">
									<span class="icon"></span>记住密码
								</label>
							</div>

							<div class="group">
								<a href="3.0功能界面.jsp">
									<input type="submit" class="button" value="登 录">
								</a>
							</div>

							<div class="foot-lnk">
								<br/>
								<a href="2.0.1找回密码.html">忘记密码?</a>
							</div>
						</div>
					</form>

					<div class="sign-up-htm"><br/><br/>

						<div class="group">
							<label for="user" class="label" style="font-size:20px"><b>请选择注册类型</b></label>
				    	</div>
						<div class="group">
							<br/><br/>
                            <form action="register" method="post">
								<input type="submit" class="button" value="个 人 注 册" >
                            </form>
						</div>
						<br/><br/>
						<div class="group">
							<a href="3.0.1团队注册.html">
								<input type="submit" class="button" value="团 队 注 册">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>