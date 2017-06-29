function showMessage(){//显示评论
	// 1.创建异步对象
	var xhr = createXMLHttp();
	alert("正在加載");
	// 2.设置监听
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				// 获得响应数据
				var data = xhr.responseText;
				alert("正在响应");
				// 写到span元素中.
				var span1 = document.getElementById("comment_list");
				span1.innerHTML = data;
			}
		}
	}
	// 
	var pettalkid = document.getElementById("pettalkid").value;
	// 3.打开连接
	xhr.open("GET","/Pet/commentAction_findCommentByPettalkid?"+new Date().getTime()+"&pettalk_id="+pettalkid,true);
	// 4.发送请求 
	xhr.send(null);
}

function showMap(){//显示地图
	// 1.创建异步对象
	var xhr = createXMLHttp();
	alert("正在执行");
	// 2.设置监听
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				// 获得响应数据
				var data = xhr.responseText;
				alert("正在响应");
				// 写到span元素中.
				var span1 = document.getElementById("map_pet");
				span1.innerHTML = data;
			}
		}
	}
	// 3.打开连接
	xhr.open("GET","/Pet/commentAction_showMap?"+new Date().getTime(),true);
	// 4.发送请求 
	xhr.send(null);	
}

function createXMLHttp(){
   var xmlHttp;
   try{ // Firefox, Opera 8.0+, Safari
        xmlHttp=new XMLHttpRequest();
    }
    catch (e){
	   try{// Internet Explorer
	         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	      }
	    catch (e){
	      try{
	         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	      }
	      catch (e){}
	      }
    }

	return xmlHttp;
 }

