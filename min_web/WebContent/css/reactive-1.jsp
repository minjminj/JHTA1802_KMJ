<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reactive-1</title>
<link href="https://fonts.googleapis.com/css?family=Kirang+Haerang" rel="stylesheet">

<style>
	@media screen and (max-width:600px){
		html {
			background-color: red;
			color: white;
			font-family: 'Kirang Haerang', cursive;
			font-size: 30px;
		}
	}
	
	@media screen and (min-width:601px) and (max-width:800px){
		html {
			background-color: green;
			color: white;
			font-family: 'Kirang Haerang', cursive;
			font-size: 50px;
		}
	}
	
	@media screen and (min-width:801px){
		html {
			background-color: blue;
			color: white;
			font-family: 'Kirang Haerang', cursive;
			font-size: 70px;
		}
	}
</style>
</head>
<body>
<h1>reavtive_1(반응형 웹)</h1>
<ul>
	<li>0~600까지는 바탕색을 red</li>
	<li>601~800까지는 바탕색을 green</li>
	<li>801~ 바탕색을 blue</li>
</ul>

</body>
</html>