<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style>
#mask {
	background: url(img/index3_3_4.jpg);
	opacity: 0.5;
	filter: alpha(opacity = 75);
	height: 1000px;
	width: 100% position:absolute;
	left: 0;
	top: 0;
	z-index: 1000;
}

#login {
	position: fixed;
	left: 28%;
	top: 25%;
	text-align: center;
	z-index: 1001;
}

.loginCon {
	margin: 0 auto;
	width: 808px;
	height: 468px;
	background: #FFF;
	text-align: center;
	border: 4px solid #eee;
	border-radius: 2px;
}

.captchas {
	position: relative;
}

.checkbox {
	margin-left: -276px;
	margin-top: 20px;
}

.sign-register a {
	text-decoration: none;
	font-size: 14px;
	color: #000;
	margin-top: 5px;
}

#close {
	width: 60px;
	height: 40px;
	cursor: pointer;
	right: 5px;
	position: absolute;
	top: 5px;
	font-size: 14px;
}
.error{
	color: red;
	position:absolute;
	right:100px;
	font-size:14px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	function checkEmail(){
		var email =$("#email").val();
		if (email == "" ) {
			$("#codeId").addClass("error");
			$("#codeId").html("请输入邮箱！");
		}else{
			$("#codeId").removeClass("error");
			$("#codeId").html("")
		}
	}
	function checkPassword(){
		var password =$("#password").val();
		if (password == "") {
			$("#passwordId").addClass("error");
			$("#passwordId").html("请输入密码！");
		}else{
			$("#passwordId").removeClass("error");
			$("#passwordId").html("")
		}
	}
	function checkForm() {
		checkEmail();
		checkPassword();
		if ($(".error").size()>0) {
			return false;
		}
	}
</script>
</head>
<body>
	<form
		action="${pageContext.request.contextPath }/register_login3.action"
		onsubmit="return checkForm()" method="post">
		<div id="mask"></div>
		<div id="login">
			
			<div class="loginCon">
				<div class="logo">
					<img src="img/logo1.png" style="height: 190px;" />
				</div>
				<SPAN id="codeId" style="FONT-WEIGHT: bold;"></SPAN>
				<div>
					<input type="text" class="user" value="请输入邮箱"
						onfocus="javascript:this.value=''" name="email" id="email"
						style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
				</div>
				<a><hr width="350px" /></a>
				<SPAN id="passwordId" style="FONT-WEIGHT: bold;"></SPAN>
				<div>
					<input type="password" class="password" 
						onfocus="javascript:this.value=''" name="password" id="password"
						style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
				</div>
				<a><hr width="350px" /></a>
				<!-- <div class="captchas">
				<input type="text" class="captcha" value="请输入验证码"
					style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
				<div>
					<img src=""
						style="position: absolute; width: 80px; height: 30px; left: 600px; top: -3px;" />
				</div>
			</div> -->
				<!-- <a><hr width="350px" /></a> -->
				<div class="checkbox">
					<input type="checkbox" /><span>记住密码</span>
				</div>
				<button
					style="width: 350px; height: 50px; margin-top: 20px; border-radius: 5px; background: #ecc30a; outline: none; font-size: 18px;">登录</button>
				<div class="sign-register">
					<a href="register.jsp"><span>注册新账号|</span></a><a href="#"><span>忘记密码</span></a>
				</div>
				<div id="close">
					<a href="index.jsp"><span>返回>></span>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
