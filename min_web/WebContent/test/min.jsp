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
/*  	overflow:hidden;  */
}

ul > li > a:hover {
	color: white;
	background: black;
	border: 0;
}

ul > li> a:hover span:first-child::before {
	left: -18%;
	z-index: 1;
}

ul > li> a:hover span:last-child::before {
	right: 16%;
	z-index: 1;
}

ul > li > a > span:first-child:before{
	display: inline-block;
    content: '';
    position: relative;
    left: -151%;
    top: -158%;
    width: 125px;
    padding: 20px;
    height: 25px;
    border-top: 3px solid #f6f705;
    border-left: 3px solid #f6f705;
    transition: .5s ease-in-out;
    z-index: -1;
   
}

ul > li > a > span:last-child:before{
	display: inline-block;
    content: '';
    position: relative;
    right: -115%;
    bottom: 109px;
    width: 125px;
    padding: 20px;
    height: 25px;
    border-bottom: 3px solid #f6f705;
    border-right: 3px solid #f6f705;
    transition: .5s ease-in-out;
    z-index: -1;
    
}


</style>
</head>
<body>
	<ul>
		<li><a href='#'>kim Min jeong<span></span><span></span></a></li>
	</ul>
</body>
</html>