<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event_album</title>
<style>
	#img>img {
		border:3px solid #ffffff;
	}
	#img>img:hover{
		border:3px solid #8888ff;
	}
</style>
<script>
// img1 ~ img6까지 for문을 사용한 이벤트 핸들러(onmouseover) 추가
window.onload = function(){
	var f = 'img';
	for (i=1 ; i<7 ; i++){
		document.getElementById(f+i).onmouseover = mover;
	}
}
function mover(event){
	var m = document.getElementById('main');
	m.src = event.srcElement.src;
}
</script>
</head>
<body>
<h2>ALBUM</h2>
<img src='kdw.JPG' width='400px' height='350px' id='main'/>
<div id='img'>
	<img src='kdw.JPG' width='50px' height='40px' id='img1'>
	<img src='123123123.jpg' width='50px' height='40px' id='img2'>
	<img src='Irene.jpg' width='50px' height='40px' id='img3'>
	<img src='suzi.jpg' width='50px' height='40px' id='img4'>
	<img src='bo.JPG' width='50px' height='40px' id='img5'>
	<img src='dan.jpg' width='50px' height='40px' id='img6'>
</div>
</body>
</html>