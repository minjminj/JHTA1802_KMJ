<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event_element</title>
<style>
	div{
		border: 1px solid #aaaaaa;
		width: 300px; height: 230px;
		display: inline-block;
	}
	span{
		border: 1px solid #aaaaaa;
		display: inline-block;
		width: 600px; height: 100px;
		background: #eeeeee;
	}
	div > img {width: 300px; height: 230px;}
</style>
<script>
window.onload = function(){
	var d1 = document.getElementById("div1");
	var d2 = document.getElementById("div2");
	var d3 = document.getElementById("div3");
	var d4 = document.getElementById("div4");
	
	d1.onclick = chk;
	d2.onclick = chk;
	d3.onclick = chk;
	d4.onclick = chk;
	
	d4.onmousemove = chk;
}
// 매개변수 event에는 이벤트와 관련된 모든 정보가 대입됨.
function chk(ev){
	var event = ev || window.event;
	var info = document.getElementById('info');
	var ele = event.srcElement.id;
	var x = event.x;
	var y = event.y;
	var cx = event.clientX;
	var cy = event.clientY;
	
	info.innerHTML = '<li> id: ' + ele
					+'<li> x :  ' + x
					+'<li> y :  ' + y
					+'<li> cx : ' + cx
					+'<li> cy : ' + cy
}
</script>
</head>
<body>
<div id='div1'>
	<img src='dan.jpg'/>
</div>
<div id='div2'>
	<img src='suzi.jpg'/>
</div>
<div id='div3'>
	<img src='Irene.jpg'/>
</div>
<div id='div4'>
	<img src='123123123.jpg'/>
</div>
<p/>
<span id='info'></span>
</body>
</html>