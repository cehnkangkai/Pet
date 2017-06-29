<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="picPath" value="http://localhost:8082/upload/"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/adopt.css">
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<!--导航-->
	<div class="search-pet">
		<a><p>
				寻</br>宠</br>启</br>示</br>
			</p></a>
	</div>
	<div class="header">
		<ul>
			<li><a href="public-welfare.jsp">公益&nbsp;&nbsp;</a><span
				style="color: #FFF">&gt;</span></li>
			<li class="active"><a href="${pageContext.request.contextPath }/rypet_findPetAllAdopt.action">领养中心</a></li>
			<li><a
				href="${pageContext.request.contextPath }/rypet_findPetAll.action">宠物认领</a></li>
			<li><a href="publish-adopt.jsp">发布领养</a></li>
			<li><a href="publish-pet-claim.jsp">发布认领</a></li>
		</ul>
	</div>
	<div class="mark">
		<a href="#">
			<h3>帮助流浪动物快速回家</h3>
			<p>
				如果您捡到或丢失一只宠物，请用手机<span>（扫一扫）</span>微信二维码 打开，查看您附近的寻宠信息与招领启事。
			</p>
			<div class="Two-microcode">
				<img src="img/r.png" />
			</div>
		</a>
	</div>
	<!--宠物领养-->
	<div class="adopt">
		<div class="adopt-content">
			<dl class="type type-left">
				<dt class="animation-type">宠物类型：</dt>
				<dd class="active">
					<a>全部</a>
				</dd>
				<dd>
					<a>狗狗</a>
				</dd>
				<dd>
					<a>猫猫</a>
				</dd>
				<dd>
					<a>其它</a>
				</dd>
			</dl>

			<dl class="type type-right">
				<dt class="animation-type">领养方式：</dt>
				<dd class="active">
					<a>全部</a>
				</dd>
				<dd>
					<a>有偿</a>
				</dd>
				<dd>
					<a>免费</a>
				</dd>
			</dl>
		</div>
	</div>

	<div class="adopt-show">
		<ul>
			<c:forEach items="${list }" var="rypet">
			<li><a href="${pageContext.request.contextPath }/rypet_findAdoptById.action?rypet_id=${rypet.rypet_id}"><img
					src="${picPath }${rypet.petFindImage }"></a>
				<div class="sale">
					<p>${rypet.petTitle }</p>
				</div>
				<div class="author">
					<img src="img/adopt/tou.gif" />
					<p>${rypet.userName }</p>
					<p>发表于 ${rypet.putTime }</p>
				</div></li>
				</c:forEach>
			
			
		</ul>
	</div>
	<div class="footer"></div>
</body>
</html>
