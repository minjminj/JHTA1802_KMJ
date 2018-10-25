<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type='text/css' href='mjmade.css/'> -->
<link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">
<title>BUTTON Hover Effect</title>

<style>
body {
	margin: 0;
	padding: 0;
}

a {
	margin: 0;
	padding: 0;
	position: absolute;
	top: 50%;
	left: 50%;
 	transform: translate(-50%, -50%); 
	font-size: 24px;
	text-transform: uppercase;
	text-decoration: none;
/* 	font-family: 'Fjalla One', sans-serif; */ 
	font-family: arial;
	background: white;
	border: 2px solid #262626;
	padding: 20px;
	overflow: hidden;
	
}

a:before {
	content: '';
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: #ff003b;
	transition: .5s ease-in-out;
	
}

a:hover:before {
	left: 0;
	z-index: -1;
}
span {
	color: #262626;
	transition: .5s ease-in-out;
	z-index: 1;
	
}
a:hover span {
	color: white;
}

</style>

</head>
<body>
	<a href="#"><span>BUTTON Hover Effect</span></a>
</body>
</html>