<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    
	<style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	#allmap {height: 100%;width:100%;overflow: hidden;}
	#result {width:100%;font-size:12px;}
	dl,dt,dd,ul,li{
		margin:0;
		padding:0;
		list-style:none;
	}
	dt{
		font-size:14px;
		font-family:"微软雅黑";
		font-weight:bold;
		border-bottom:1px dotted #000;
		padding:5px 0 5px 5px;
		margin:5px 0;
	}
	dd{
		padding:5px 0 0 5px;
	}
	li{
		line-height:28px;
	}
	.cityList{
			height: 320px;
			width:372px;
			overflow-y:auto;
		}
		.sel_container{
			z-index:9999;
			font-size:12px;
			position:absolute;
			right:0px;
			top:0px;
			width:140px;
			background:rgba(255,255,255,0.8);
			height:30px;
			line-height:30px;
			padding:5px;
		}
		.map_popup {
			position: absolute;
			z-index: 200000;
			width: 382px;
			height: 344px;
			right:0px;
			top:40px;
		}
		.map_popup .popup_main { 
			background:#fff;
			border: 1px solid #8BA4D8;
			height: 100%;
			overflow: hidden;
			position: absolute;
			width: 100%;
			z-index: 2;
		}
		.map_popup .title {
			background: url("http://map.baidu.com/img/popup_title.gif") repeat scroll 0 0 transparent;
			color: #6688CC;
			font-weight: bold;
			height: 24px;
			line-height: 25px;
			padding-left: 7px;
		}
		.map_popup button {
			background: url("http://map.baidu.com/img/popup_close.gif") no-repeat scroll 0 0 transparent;
			cursor: pointer;
			height: 12px;
			position: absolute;
			right: 4px;
			top: 6px;
			width: 12px;
		}	
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4162bLRn0ny4l4Ksr2pzhp2ZSGkl0m5H"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
	<script type="text/javascript" src="http://api.map.baidu.com/library/CityList/1.2/src/CityList_min.js"></script>
	<title>宠物网地图</title>
</head>
<body>
	<div id="allmap">	
	</div>

	<!--城市列表-->
	<div class="sel_container"><strong id="curCity">北京市</strong> [<a id="curCityText" href="javascript:void(0)">更换城市</a>]</div>
	<div class="map_popup" id="cityList" style="display:none;">
		<div class="popup_main">
			<div class="title">城市列表</div>
			<div class="cityList" id="citylist_container"></div>
			<button id="popup_close"></button>
		</div>
	</div>
<script type="text/javascript">
	// 百度地图API功能
    var map = new BMap.Map('allmap');
    var poi = new BMap.Point(117.292364,31.804710);
    map.centerAndZoom(poi, 13);
    map.enableScrollWheelZoom();//可平移
	map.addControl(new BMap.NavigationControl());//可缩放控件
	map.setMapStyle({style:'bluish'});
	
	 //功能:给自己添加的标记注册事件,点击该标记,则弹出信息框
	function addMarkerTest(point,url){
		var myIcon = new BMap.Icon(url, new BMap.Size(50, 50)); //定义自己的标注
		var marker2 = new BMap.Marker(point, {
			icon: myIcon
		}); // 创建标注
		//marker.enableDragging(); //marker可拖拽
		marker2.addEventListener("click", function(e){
			searchInfoWindow.open(marker2);
		});
		map.addOverlay(marker2); //在地图中添加marker
	}
	//管理员来放置图片标记
	var point= new BMap.Point(117.292364,31.874718);
	addMarkerTest(point,"http://localhost:8081/Pet/img/01.jpg" );
	var point= new BMap.Point(117.292364,31.87471);
	addMarkerTest(point,"http://localhost:8081/Pet/img/02.jpg");
	var point= new BMap.Point(17.274541,31.92769);
	addMarkerTest(point,"http://localhost:8081/Pet/img/04.jpg");
	var point= new BMap.Point(117.135987,31.807478);
	addMarkerTest(point,"http://localhost:8081/Pet/img/04a.jpg");
	var point= new BMap.Point(17.135987,31.807478);
	addMarkerTest(point,"http://localhost:8081/Pet/img/05.jpg");
	var point= new BMap.Point( 117.45334,31.788328);
	addMarkerTest(point,"http://localhost:8081/Pet/img/06.jpg");
	
	
		//设置内容
    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                    '<img src="img/01.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                    '地址：安徽省巢湖学院<br/>简介：厉害了,我的哥' +
                  '</div>';
				  
				  
	
	function myFun(result){//功能:根据当前Ip来定位
		var cityName = result.name;
		map.setCenter(cityName);
		alert("当前定位于:"+cityName);
	}
	var myCity = new BMap.LocalCity();//获得当前所在城市
	myCity.get(myFun);
	var customLayer;
	function addCustomLayer(keyword) {//功能:在提示框中搜索关键字
		if (customLayer) {
			map.removeTileLayer(customLayer);
		}
		customLayer=new BMap.CustomLayer({
			geotableId: 30960,
			q: '', //检索关键字
			tags: '', //空格分隔的多字符串
			filter: '' //过滤条件,参考http://developer.baidu.com/map/lbs-geosearch.htm#.search.nearby
		});
		map.addTileLayer(customLayer);
		customLayer.addEventListener('hotspotclick',callback);//监听点击地图上的热点图层
	}
	function callback(e)//功能:单击热点图层
	{
			var customPoi = e.customPoi;//poi的默认字段
			var contentPoi=e.content;//poi的自定义字段
			var content = '<p style="width:280px;margin:0;line-height:20px;">地址：' + customPoi.address + '<br/>价格:'+contentPoi.dayprice+'元'+'</p>';
			var searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
				title: customPoi.title, //标题
				width: 290, //宽度
				height: 40, //高度
				panel : "panel", //检索结果面板
				enableAutoPan : true, //自动平移
				enableSendToPhone: true, //是否显示发送到手机按钮
				searchTypes :[
					BMAPLIB_TAB_SEARCH,   //周边检索
					BMAPLIB_TAB_TO_HERE,  //到这里去
					BMAPLIB_TAB_FROM_HERE //从这里出发
				]
			});
			var point = new BMap.Point(customPoi.point.lng, customPoi.point.lat);
			searchInfoWindow.open(point);
	}


    //创建检索信息窗口对象
    var searchInfoWindow = null;
	searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
			title  : "丢失信息",      //标题
			width  : 290,             //宽度
			height : 105,              //高度
			panel  : "panel",         //检索结果面板
			enableAutoPan : true,     //自动平移
			searchTypes   :[
				BMAPLIB_TAB_SEARCH,   //周边检索
				BMAPLIB_TAB_TO_HERE,  //到这里去
				BMAPLIB_TAB_FROM_HERE //从这里出发
			]
		});
		

	//功能:切换城市,并改变地图
	// 创建CityList对象，并放在citylist_container节点内
	var myCl = new BMapLib.CityList({container : "citylist_container", map : map});

	// 给城市点击时，添加相关操作
	myCl.addEventListener("cityclick", function(e) {
		// 修改当前城市显示
		document.getElementById("curCity").innerHTML = e.name;

		// 点击后隐藏城市列表
		document.getElementById("cityList").style.display = "none";
	});
	// 给“更换城市”链接添加点击操作
	document.getElementById("curCityText").onclick = function() {
		var cl = document.getElementById("cityList");
		if (cl.style.display == "none") {
			cl.style.display = "";
		} else {
			cl.style.display = "none";
		}	
	};
	// 给城市列表上的关闭按钮添加点击操作
	document.getElementById("popup_close").onclick = function() {
		var cl = document.getElementById("cityList");
		if (cl.style.display == "none") {
			cl.style.display = "";
		} else {
			cl.style.display = "none";
		}	
	};
</script>
</body>
</html>
