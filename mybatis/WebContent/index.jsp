<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배운다 mybatis</title>

<link href="https://fonts.googleapis.com/css?family=Patrick+Hand|Abril+Fatface|Kalam" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='./css/index.css'/>
<script src='./lib/jquery-3.3.1.min.js'></script>
<script src='./css/jquery-ui.min.js'></script>
<link href='./css/jquery-ui.css' rel='stylesheet' type='text/css'/>

</head>
<body>
<div id='index'>
	<header>
		<div id='home'><%@include file="home.jsp" %></div>
		<div id='menu'><%@include file="main.jsp" %></div>
	</header>
	
	
	<div id='center'>
		<div id='wall'></div>
		<div id='content'></div>
	</div>
	
	
	<footer>MJ COMPANY</footer>
	
	
</div>
<script>
$(function(){
	$('#content').load('./intro.jsp');
});
</script>
</body>
</html>