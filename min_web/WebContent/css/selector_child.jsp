<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector_child</title>

<style>
	/* #header 안에 있는 후손(모든단계)의 속성 지정*/
	#header > h1{
		color:#ff4444;
	}
</style>
</head>
<body>
	<div id='header'>
		<h1 class='title'>Lorem ipsum</h1>
		<div id='nav'>
			<h1>Navigation</h1>
		</div>
	</div>
	
	<div id='section'>
		<h1 class='title'>Lorem ipsum</h1>
		<p>documents.............</p>
	</div>
</body>
</html>