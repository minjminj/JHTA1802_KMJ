<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>window</title>
<link href="https://fonts.googleapis.com/css?family=Poor+Story" rel="stylesheet">
<style>
	#btn {
		background-color: pink;
		color: white;
		font-weight: bold;
		border: outset;
		padding: 3px;
	}
	div {
		font-family: 'Poor Story', cursive;
		font-size: 20px;
		width: 300px;
		padding: 10px;
		box-sizing: border-box;
		text-align: center;
		border: 2px solid pink;
		background-color: #eedddd;
		color: #555555;
		border-radius: 3px;
	}
</style>
<script>
window.onload = function(){
	week =['일요일','월요일','화요일','수요일','목요일','금요일','토요일','일요일'];
	var btn = document.getElementById('btn');
		btn.onclick = viewDate;
	var div1 = document.getElementById('div1');
}
function viewDate(){
	var now = new Date();
	var str= '< ';
	str += now.getFullYear() + '년 ';
	str += (now.getMonth()+1) + '월 ';
	str += now.getDate() + '일 ';
	str += week[now.getDay()] + '    ';
	str += ' >';

	div1.innerHTML = str;
}
</script>
</head>
<body>
<input type='button' id='btn' name='btn' value='VIWE DATE'/>
<p/>
<div id='div1'></div>
</body>
</html>