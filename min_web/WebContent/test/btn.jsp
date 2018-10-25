<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">
<title>Insert title here</title>
<style>
ul > li {
	list-style: none;
}

ul > li > a {
	display: inline-block;
	text-transform: uppercase;
	text-decoration: none;
	margin: 100px auto;
	margin-left: 200px;
	text-align: center;
	width: 125px;
	height: 25px;
	padding: 20px;
	border: 2px solid black;
	color: black;
	font-family: arial;
	transition: .5s ease-in-out;
}

ul > li > a:hover {
	color: white;
	background: black;
}

ul > li> a:hover span:first-child::before {
	left: -17%;
}

ul > li> a:hover span:second-child::before {
	right: -17%;
}

ul > li > a > span:first-child:before{
	display: inline-block;
    content: '';
    position: relative;
    left: -154%;
    top: -162%;
    width: 130px;
    padding: 20px;
    height: 25px;
    border-top: 3px solid #f6f705;
    transition: .5s ease-in-out;
}

ul > li > a > span:second-child:before{
	display: inline-block;
    content: '';
    position: relative;
    right: -118%;
    bottom: 107px;
    width: 125px;
    padding: 20px;
    height: 25px;
    border-bottom: 3px solid #f6f705;
    transition: .5s ease-in-out;
}


</style>
</head>
<body>
	<ul>
		<li><a href='#'>kim Min jeong<span></span><span></span><span></span><span></span></a></li>
	</ul>
</body>
</html>