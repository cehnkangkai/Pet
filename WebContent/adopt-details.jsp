<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="picPath" value="http://localhost:8082/upload/"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" href="css/adopt-details.css">
<link rel="stylesheet" href="iconfont/iconfont.css">
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.4.2.min.js"></script>
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
			<li class="active"><a
				href="${pageContext.request.contextPath }/rypet_findPetAllAdopt.action">领养中心</a></li>
			<li><a
				href="${pageContext.request.contextPath }/rypet_findPetAll.action">宠物认领</a></li>
			<li><a href="publish-adopt.jsp">发布领养</a></li>
			<li><a href="publish-pet-claim.jsp">发布认领</a></li>
		</ul>
	</div>
	<div class="back">
		<a href="adopt.jsp">返回</a>
	</div>
	<div class="wrap">

		<div class="details">

			<div class="big-img">
				<img src="${picPath }${model.petFindImage}" alt="">
			</div>

			<div class="small-img">
				<ul>
					<li><a href=""><img src="${picPath }${model.petFindfimg}"
							alt=""></a></li>
					<li><a href=""><img src="${picPath }${model.petFindfimg2}"
							alt=""></a></li>
					<li><a href=""><img src="${picPath }${model.petFindImage}"
							alt=""></a></li>
				</ul>
			</div>
			<a href="###" class="next"></a> <a href="###" class="prev"></a>
		</div>

		<div class="information">
			<h1>${model.petTitle }</h1>
			<ul>
				<li><label for="">宠物名称：</label> <span>${model.petName }</span></li>
				<li><label for="">宠物类别：</label> <span>${model.petBreed }</span></li>
				<li><label for="">宠物品种：</label> <span>${model.petSort }</span></li>
				<li><label for="">宠物年龄：</label> <span>${model.petAge }</span></li>
				<li><label for="">宠物性别：</label> <span>${model.petSex }</span></li>
				<li><label for="">领养方式：</label> <span>${model.petWay }</span></li>
				<li><label for="">联系人：</label> <span>${model.petLink }</span></li>
				<li><label for="">联系方式：</label> <span> <c:if
							test="${uRegister == null }">
							<a href="${pageContext.request.contextPath }/login2.jsp">登录</a>可见
				</c:if> 
					<c:if test="${uRegister != null }">
				电话：${model.petLinkNum } 
					<c:if test="${model.petLInkqq != null }">
						qq:${model.petLInkqq }
				</c:if>
						</c:if>
				</span></li>
				<li><label for="">领养地址：</label> <span>${model.petFindAddr }</span></li>
			</ul>
		</div>
	</div>

	<div class="explain">
		<h2>详细介绍</h2>
		<p>${model.petIntroduce }</p>
	</div>

	<div class="disscuss">
		<h2>评论</h2>
		<div class="container-user">
			<div class="user">
				<img src="img/animal/small.jpg" alt="">
				<p>
					<label for="">萌宠家族</label> <span>3月27日</span>
				</p>
			</div>

			<div class="remark">
				<p>好可爱的泰迪，我很喜欢。我可以领养吗，我肯定会好好爱她的。</p>
			</div>

			<div class="remark-rf">
				<a href=""><i class="iconfont">&#xe633;&nbsp;&nbsp;<span
						class="remark">回复</span></i></a> <a href=""><i class="iconfont">&#xe62c;&nbsp;&nbsp;<span>2</span></i></a>
			</div>
		</div>

		<div class="container-user">
			<div class="user">
				<img src="img/animal/small.jpg" alt="">
				<p>
					<label for="">萌宠家族</label> <span>3月27日</span>
				</p>
			</div>

			<div class="remark">
				<p>好可爱的泰迪，我很喜欢。我可以领养吗，我肯定会好好爱她的。</p>
			</div>

			<div class="remark-rf">
				<a href=""><i class="iconfont">&#xe633;&nbsp;&nbsp;<span
						class="remark">回复</span></i></a> <a href=""><i class="iconfont">&#xe62c;&nbsp;&nbsp;<span>2</span></i></a>
			</div>
		</div>

	</div>

	<div class="my-remark" id="my-remark">
		<a href="javascript:;"><i class="iconfont">&#xe84d;&nbsp;<span>我来说两句...</span></i></a>
	</div>

	<div class="display" id="display">
		<div class="message">
			<p>来说两句吧...</p>
		</div>
		<button value="取消">取消</button>
		<button value="发表">发表</button>
	</div>
	<script>
		$('#display').hide();
		$('#my-remark a').click(function() {
			$('#display').show(500);
		})
	</script>

</body>
</html>
