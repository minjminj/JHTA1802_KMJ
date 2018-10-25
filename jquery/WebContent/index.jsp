<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
<link rel='stylesheet' type='text/css' href='main.css'/>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Schoolbell|Patrick+Hand|Merienda|Shadows+Into+Light|Hanalei+Fill|Kirang+Haerang|Sunflower|Ubuntu:300" rel="stylesheet">
<script src='./lib/jquery-3.3.1.min.js'></script>
<script src='./css/jquery-ui.min.js'></script>
<link href='./css/jquery-ui.css' rel='stylesheet' type='text/css'/>

<!-- CDN버전 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->

</head>
<body>
<div id='index'>
	<header>
		<a href='index.jsp'>MJ's jQuery Practice Home</a>
		<ul>
			<li><a href='../ajax/index.jsp'>ajax</a></li>
			<li><a href='../min_web/page/index.jsp'>min</a></li>
		</ul>
	</header>
	
	<div id='main_menu'><%@include file="main_menu.jsp" %></div>
	
	<div id='center'>
		<div id='sub_menu'></div>
		
		<div id='content'>나야나</div>
	</div>
	
	<footer><%@include file="footer.jsp" %></footer>
</div>
</body>
</html>