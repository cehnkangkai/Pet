<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="picPath" value="http://localhost:8082/upload/"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="css/pet-talk.css" rel="stylesheet">
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajax_show.js"></script>
<script src="js/jquery.form.js"></script>
<script type="text/javascript">
	function checkForm() {
		alert("ni")
		var size = document.getElementById("multifile").files.length;
		var cont = $("#content").val();
		if (cont == null || size != 4) {
			return false;
		} else {
			return true;
		}
	}
</script>
<style type="text/css">
.fileInputContainer {
	height: 23px;
	background: url(img/personal/6.jpg);
	position: relative;
	width: 25px;
	margin-left: 20px;
}

.fileInput {
	height: 24px;
	font-size: 300px;
	position: absolute;
	right: 0;
	top: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer;
}
</style>
<style>
.write {
	position: absolute;
	top: 18px;
	left: 1180px;
}

.write a {
	color: #ecc30a;
}

.write a span {
	display: block;
	width: 20px;
	height: 20px;
}

.push_write_say {
	display: none;
}

.base {
	position: absolute;
	width: 1920px;
	height: 2000px;
	background: #ccc;
	opacity: 0.7;
	top: 0px;
	left: 0px;
	z-index: 1000;
}

.write_say {
	width: 600px;
	height: 200px;
	position: absolute;
	z-index: 1001;
	background: #FFF;
	left: 700px;
	top: 350px;
	border-top: 2px solid #ecc30a;
}

.write_say #btn_2 {
	position: absolute;
	top: 5px;
	right: 5px;
}

.write_say p {
	border-bottom: 2px solid #eee;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
}

.write_say .list {
	margin-top: 15px;
}

.write_say a span {
	padding-left: 10px;
	margin-top: 15px;
}

.write_say .list button {
	position: absolute;
	width: 50px;
	height: 27px;
	background: #F90;
	left: 530px;
	top: 155px;
}
</style>
<script>
	function showFileName() {
		console.log(" FileList Demo:");
		var file;
		//取得FileList取得的file集合 
		for (var i = 0; i < document.getElementById("multifile").files.length; i++) {
			//file对象为用户选择的某一个文件 
			file = document.getElementById("multifile").files[i]; //此时取出这个文件进行处理，这里只是显示文件名 
			console.log(file.name);
		}
	}
</script>
<script type="text/javascript">
	/* 	$('#formOne').submit(function (){
	 alert("jinali ")
	 var ajax_url= "${pageContext.request.contextPath }/commentAction_sendComment.action";//转发路径
	 var ajax_type=$(this).attr('method');//提交方式
	 var ajax_data=$(this).serialize();//提交的数据
	 alert(ajax_data);
	
	 $.ajax({
	 type:ajax_type,
	 url:ajax_url,
	 data:ajax_data,
	 success:function(msg){
	 if (msg==null) {
	 alert("无值传入")
	 }else{
	 alert(msg);
	 }
	 }
	 });
	 })  */

	$(document)
			.ready(
					function() {
						var options = {
							target : '#commentL',
							beforeSubmit : showRequest,
							success : showResponse,
							url : '${pageContext.request.contextPath }/commentAction_sendComment.action',
							type : 'post',
							dataType : 'json',
							clearForm : true,
							resetForm : true,
							timeout : 3000
						}

						$('#formOne').ajaxForm(options);
						function showRequest(formData, jqForm, options) {
							var queryString = $.param(formData);
							alert(queryString);
							return true;
						}
						function showResponse(responseText, statusText, xhr,
								$form) {

							alert('状态:' + statusText + '\n\n返回的文本内容：\n'
									+ responseText + '\n\n在div元素中已经显示额这部分内容');
						}
					});
</script>
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="pet_icon">
				<img src="img/logo1.png" />
			</div>
			<div class="header-sub">
				<ul>
					<li><a href="index.jsp">首页</a></li>
					<li class="active"><a href="pet-talk.jsp">pet说</a></li>
					<li><a href="public-welfare.jsp">公益</a></li>
					<li><a href="shop.jsp">宠物商城</a></li>
					<li><a href="#">宠物资讯</a></li>
				</ul>
				<c:if test="${uRegister == null }">
					<a href="login.jsp"> <span class="glyphicon glyphicon-user">
							登录</span>
					</a>
					<!-- <a href="register.jsp"> <span class="glyphicon glyphicon-user">
							注册</span>
					</a> -->

				</c:if>
				<c:if test="${uRegister != null }">
					<a href="personal.jsp"> <span class="glyphicon glyphicon-user">
							欢迎你：${uRegister.username }</span>
					</a>
				</c:if>
				<!--写说说-->
				<div class="write">
					<a><span class="glyphicon glyphicon-edit write_icon"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--弹出发表框-->
	<div class="push_write_say">
		<div class="base"></div>
		<div class="write_say">
			<span id="btn_2" class="glyphicon glyphicon-remove"></span>
			<div>
				<p>有什么新鲜事想告诉大家? (请上传四张图片)</p>
			</div>
			<form
				action="${pageContext.request.contextPath }/userAction_sendPetTalk"
				method="post" enctype="multipart/form-data"
				onsubmit="return checkForm()">
				<div>
					<input type="text" name="content" id="content"
						style="width: 572px; height: 80px; margin-left: 12px; margin-top: 10px" />
				</div>
				<div class="list">
					<%-- <a><span><img src="img/personal/6.jpg" /></span></a> --%>
					<div class="fileInputContainer">
						<input class="fileInput" type="file" name="upload" id="multifile"
							multiple />
					</div>
					<%-- <a><span><img src="img/personal/5.jpg" /></span></a> 
							 <a><span><img
							src="img/personal/8.jpg" /></span></a> <a><span><img
							src="img/personal/9.jpg" /></span></a> --%>
					<button class="sumbit">发表</button>

				</div>
			</form>
		</div>
	</div>
	</div>
	<div class="top">
		<img src="img/pet-talk/12.jpg" />
	</div>
	</div>
	<!--专栏-->
	<div class="middle">
		<div class="icon">
			<img src="img/pet-talk/triangle.png" />
		</div>
		<div class="icon-content">
			<span>专栏</span>
		</div>
		<div class="img-show">
			<ul>
				<li><img src="img/pet-talk/4.jpg" /></li>
				<li><img
					src="img/pet-talk/u=3918362583,541858217&fm=23&gp=0.jpg" /></li>
				<li><img
					src="img/pet-talk/u=3262333099,2640887624&fm=23&gp=0.jpg" /></li>
			</ul>
		</div>
	</div>
	<!--内容部分-->
	<div class="content_right">
		<div class="content_right_content">
			<s:iterator value="list">
				<div class="content_right_content_top">
					<div>
						<a><img src="img/pet-talk/head.jpg" height="70"
							style="border-radius: 70px; margin-left: 20px; margin-top: 10px;"></a>
					</div>
					<span><a><s:property value="register_id" /></a></span> <span
						class="time"><s:property value="dt" /></span>
					<%--  <a><img
						src=""
						style="position: absolute; left: 870px; top: 15px; color: #333" /></span></a> --%>
					<a> <%-- <span class="glyphicon glyphicon-remove" 
						style="position: absolute; left: 962px; top: 20px; color: #333"></span> --%>
						<form
							action="${pageContext.request.contextPath }/userAction_deleteTalk.action"
							method="post">
							<input type="hidden" name="pettalk_id"
								value="<s:property value="pettalk_id"/>">
							<button class="glyphicon glyphicon-remove" id="delete"
								type="submit"
								style="position: absolute; left: 962px; top: 20px; color: #333"></button>
						</form>
					</a>
				</div>
				<div class="content_right_content_middle">
					<p>
						<s:property value="content" />
					</p>
					<div>
						<div class="content_img_show">
							<img src="${picPath }<s:property value="photoPath"/>" />
						</div>
						<div class="content_img_show">
							<img src="${picPath }<s:property value="photoPathTwo"/>" />
						</div>
						<div class="content_img_show">
							<img src="${picPath }<s:property value="photoPathThere"/>" />
						</div>
						<div class="content_img_show">
							<img src="${picPath }<s:property value="photoName"/>" />
						</div>
					</div>
					<div id="commentL"></div>
				</div>
				<div class="content_right_content_footer">
					<div class="footer_one">
						<a><span><img src="img/personal/10.jpg" />收藏</span></a>
					</div>
					<div class="footer_two">
						<a><span><img src="img/personal/icon.jpg" />转发</span></a>
					</div>
					<div class="footer_three">
						<a><span><img src="img/personal/icon2.jpg " />评论</span></a>
					</div>
					<div class="footer_four">
						<a><span><img src="img/personal/icon3.jpg" />赞</span></a>
					</div>
				</div>
				<!--评论板块-->
				<div class="comment" style="display: none">
					<form id="formOne" method="post">
						<div class="publish_comment">
							<div class="publish_commment_top">
								<a><img src="img/pet-talk/head.jpg" /></a> <input type="hidden"
									name="pettalkid" value="<s:property value='pettalk_id'/>"
									id="pettalkid"> <input type="text" name="pcontent"
									id="pcontent" style="height: 45px; width: 643px;" />
							</div>
							<div class="publish_foot">
								<input type="submit" value="提交"
									style="background: #ecc30a; width: 60px; height: 30px; margin-top: -26px; margin-left: 632px; margin-bottom: 20px; color: #fff" />
							</div>
						</div>
					</form>

					<div class="comment_list" id="comment_list"></div>

				</div>
			</s:iterator>
			<s:url id="url_pre" value="userAction_findAll.action">
				<c:if test="${ requestScope.pageNow>1 }">
					<s:param name="pageNow" value="pageNow-1"></s:param>
					<!-- 设置传递参数:pageNow减一 -->
				</c:if>
			</s:url>


			<s:url id="url_next" value="userAction_findAll.action">
				<c:if test="${ requestScope.pageNow<requestScope.totalPage }">
					<s:param name="pageNow" value="pageNow+1"></s:param>
				</c:if>
			</s:url>
			<%-- <c:if test="${requestScope.pageNow>1 }">
		<s:a href="%{url_pre}">
                                                               上一页
                </s:a>
	</c:if>
	<c:if test="${requestScope.pageNow<requestScope.totalPage }">
		<s:a href="%{url_next}">
                                                               下一页
                 </s:a>
	</c:if>
	[当前第${requestScope.pageNow}页/总共${requestScope.totalPage}页]
	<div id="morePetTalk"></div>
	<div class="load_more">
		<hr />
		<a><span>加载更多</span></a>
		<hr />
	</div>
	<div class="footer"></div>
</body> --%>
			<script>
				$(function() {
					$(".write_icon").click(function() {
						$(".push_write_say").show();
					})
					$("#btn_2").click(function() {
						$(".push_write_say").hide();
					})
				})
			</script>
			<script>
				$(function() {
					$(".footer_three").click(function() {
						$(".comment").show();
					})
				})
				/* $("#delete").click(function deleteTalk() {
					alert("niaho ")
					
				}) */
			</script>
</html>
