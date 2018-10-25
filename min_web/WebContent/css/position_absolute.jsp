<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>position_abloute</title>

<style>
	#box1, #box2 {
		width: 400px; height:300px;
		border: 1px solid #888888;
		position: relative;
	}
	
	#box1 > div, #box2 > div {
		position: absolute;
		width: 100px; height: 100px;
		opacity: 0.5;
	}
	
 	#box1 > .red { 
 		background-color: red; 
 		top: 10px; left: 10px; 
 	} 
	
 	#box1 > .green { 
 		background-color: green; 
 		top: 50px; left: 50px; 
	}
 	#box1 > .blue { 
 		background-color: blue; 
		top: 90px; left: 90px; 
 	} 
	
 	#box2 > .red { 
 		background-color: red; 
 		bottom: 10px; right: 10px; 
 	} 
	
 	#box2 > .green { 
		background-color: green; 
		bottom: 50px; right: 50px; 
 	}
	
 	#box2 > .blue { 
 		background-color: blue; 
 		bottom: 90px; right: 90px; 
 	} 
</style>

</head>

<body>

<h1>position: absolute</h1>

<div id='box1'>
	<div class='red'></div>
	<div class='green'></div>
	<div class='blue'></div>
</div>

<div id='box2'>
	<div class='red'></div>
	<div class='green'></div>
	<div class='blue'></div>
</div>

</body>
</html>