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
	top: 20%;
	text-align: center;
	z-index: 1001;
}

.loginCon {
	margin: 0 auto;
	width: 808px;
	height: 600px;
	background: #FFF;
	text-align: center;
	border: 4px solid #eee;
	border-radius: 5px;
}

.loginCon label span {
	font-size: 14px;
}

.captchas {
	position: relative;
}

.checkbox {
	margin-left: -220px;
	margin-top: 20px;
	font-size: 14px;
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	//验证登录名
	function  checkCode() {
		var code=$("#username").val();
		if (code.trim()=="") {
			$("#codeId").addClass("error");
			$("#codeId").html("用户名不能为空");
		}else{
			var url ="${pageContext.request.contextPath}/register_checkName.action"
			var param = {"username":code};
			$.post(url,param,function(data){
				if(data && data == "no"){
					$("#codeId").addClass("error");
					$("#codeId").html("用户名已经存在");
				}else{
					$("#codeId").removeClass("error");
					$("#codeId").html("");
				}
			})
		}
	}
	function isEmail(str) {
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		
		 return reg.test(str);
	}
	function  checkEmail() {
		var code=$("#email").val();
		if (code.trim()=="" ) {
			$("#emailId").addClass("error");
			$("#emailId").html("邮箱不能为空");
		}else if (!isEmail(code)) {
			$("#emailId").addClass("error");
			$("#emailId").html("邮箱格式不正确");
		}else{
			var url ="${pageContext.request.contextPath}/register_checkEmail.action"
			var param = {"email":code};
			$.post(url,param,function(data){
				if(data && data == "no"){
					$("#emailId").addClass("error");
					$("#emailId").html("邮箱已经存在");
				}else{
					$("#emailId").removeClass("error");
					$("#emailId").html("");
				}
			})
		}
	}
	/* 检验密码是否一致 */
	function checkPassword() {
	
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		if(repassword != password ){
			$("#repasswordID").addClass("error");
			$("#repasswordID").html("两次密码输入不一致");
		}else {
			$("#repasswordID").removeClass("error");
			$("#repasswordID").html("");
		}
	}
	//校验验证码
	function  checkImage() {
		var image = $("#image").val();
		if (image==null) {
			alert("请输入验证码！")
		}else  {
			var url ="${pageContext.request.contextPath}/register_checkImage().action";
			var param = {"image":image};
			$.post(url,param,function(data){
				if ( data == "no") {
					alert("验证码错误！")
				}
			})
		}
		var rimage = "<%=request.getSession().getAttribute("session_vcode") %>";
		if(image.indexOf(rimage) <-1 ){
			alert("验证码错误！");
		}
	}
	function fresh(){
		/* var img = $("#image").val();  */
		 var img = document.getElementById("imgs"); 
		img.src="${pageContext.request.contextPath }/register_image.action?flag="+new Date().getTime();
	}
	function checkForm(){
		checkCode();
		checkEmail();
		checkPassword();
		checkImage();
		if ($(".error").size()>0) {
			return false;
		}
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/register_regist.action" method="post" onsubmit="return checkForm()">
	<div id="mask"></div>
	<div id="login">
		<div class="loginCon">
			<div class="logo">
				<img src="img/logo1.png" style="height: 190px;" />
			</div>
			<div><!--  -->
				<label><span>用户名：</span></label><input type="text" name="username" class="text" id="username"
					 onblur="checkCode()"
					style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
					
					<SPAN id="codeId" style="FONT-WEIGHT: bold;"></SPAN>
			</div>
			
			<a><hr width="350px" /></a>
			<div>
				<label><span>邮箱：</span></label><input type="text" class="text" name="email" id="email" onblur="checkEmail()"
					style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
					<SPAN id="emailId" style="FONT-WEIGHT: bold;"></SPAN>
			</div>
			<a><hr width="350px" /></a>
			<div>
				<label><span>密码：</span></label><input type="password" name="password"
					class="password" id="password"
					style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
			</div>
			<a><hr width="350px" /></a>
			<div>
				<label><span>确认密码：</span></label><input type="password" 
					class="password" value="" name="repassword" onblur="checkPassword()" id="repassword"
					style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />	
					<SPAN id="repasswordID" style="FONT-WEIGHT: bold;"></SPAN>
			</div>
			<a><hr width="350px" /></a>
			<div class="captchas">
				<label><span>验证码：</span></label><input type="text" class="captcha" onblur="checkImage()"
					value="" id="image" name="image" 
					style="border: 0px; outline: none; background: #FFF; margin-left: 100px;" />
					<SPAN id="imgId" style="FONT-WEIGHT: bold;"></SPAN>
				<div>
					<img src="${pageContext.request.contextPath }/register_image.action" onclick="fresh()"
						id="imgs" 	style="position: absolute; width: 80px; height: 30px; left: 600px; top: -3px;" />
				</div>
			</div>
			<a><hr width="350px" /></a>
			<div class="checkbox">
				<input type="checkbox" /><span><a href="#">我已阅读服务条款</a></span>
			</div>
			<input
				type="submit"	style="width: 350px; height: 50px; margin-top: 20px; border-radius: 5px; background: #ecc30a; outline: none; font-size: 18px;" value="提交注册">
			<div id="close">
				<a href="index.jsp"><span>返回>></span></a>
			</div>
		</div>
	</div>
	</form>
</body>
</html>
