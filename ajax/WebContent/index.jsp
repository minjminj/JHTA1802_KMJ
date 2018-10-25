<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<style>
#ajax {
	width: 1000px;
	margin: auto;
	font-family: 'Gamja Flower', cursive;
	font-size: 20px;
}

#ajax #header {
	background-color: #a3c9c7;
	height: 80px;
	text-align: center;
	line-height: 80px;
}

#ajax #center {
	overflow: hidden;
	margin-top: 4px;
    margin-bottom: 4px;
}

#ajax #center #left {
	background-color: #ef9e9f;
	display: inline-block;
	width: 230px;
	float: left;
	box-sizing: border-box;
	padding: 5px;
}

#ajax #center #content {
	background-color: #cb7575;
	display: inline-block;
	width: 753px;
	float: left;	
	height: 841.36px;
	padding-top: 5px;
	padding-left: 15px;
	margin-left: 2px;
	overflow: scroll;
	
}

#ajax #footer {
	background-color: #353848;
	height: 80px;
	text-align: center;
	line-height: 80px;
}

.btn {
	font-family: 'Do Hyeon', sans-serif;
	border: 0;
	background: #cb7575;
	font-size: 15px;
	padding: 10px;
}

.btn:hover {
	font-family: 'Do Hyeon', sans-serif;
	border: 1px solid white;
	background: black;
	color: white;
	font-size: 15px;
	padding: 10px;
}
</style>

<script>
var xhr;
window.onload = function(){
	xhr = new XMLHttpRequest();
	xhr.open('get', '/ajax/menu.jsp', true);
	xhr.onreadystatechange = menuLoad;
	xhr.send();
}
function menuLoad(){
	var left = document.getElementById('left');
	if (xhr.status == 200 && xhr.readyState == 4){
		var str = xhr.responseText;
		left.innerHTML = str;
	}
}

function pageLoad(url){
	if (xhr == null) xhr = new XMLHttpRequest();
	
	var content = document.getElementById('content');
	
	xhr.open('get', url, true);
	xhr.onreadystatechange = function(){
		if (xhr.status == 200 && xhr.readyState == 4){
			var doc = xhr.responseText;
			content.innerHTML = doc;
			makeScript(doc);
		}
	}
	xhr.send();
}

// ajax로 include된  파일의 script 부분 parsing
function makeScript(doc){
	// script 태그 사이에 있는 모든 문자열을 match
	var mat = doc.match(/<script[^>]*>(([^<]|\n|\r|<[^\/])+)<\/script>/);
	var sc = document.getElementById("script");
	if (mat == null) return;
	sc.text = mat[1];
	eval.call(window, sc.text);
}
</script>

<!-- index를 제외한 다른 include된 파일 혹은 페이지 내에 존재하는 script 영역의 소스를 가져오는 script! -->
<script id='script'></script>
</head>
<body>
<div id='ajax'>
	<div id='header'>
		1802 Ajax HOME PAGE
	</div>
	<div id='center'>
		<div id='left'> Left
		</div>
		<div id='content'>Content</div>
	</div>
	<div id=footer>
		1802기 Ajax Study
	</div>
</div>
</body>
</html>