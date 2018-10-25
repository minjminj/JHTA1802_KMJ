<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	margin: 0;
	pdding: 0;
	background: #262626;
	font-family: sans-serif;
}

.bbb{
	position: absolute;
	top: 50%;
	left: 50%;
	tranform: translate(-50%, -50%);
	width: 300px;
	height: 110px;
	background: white;
	border-radius: 75px;
	text-align: center;
	font-size: 30px;
	line-height: 75px;
	text-decoration: none;
	color: #262626;
	transition: 0.5s;
	text-transform: uppercase;
}

.bbb.active {
	background: transparent;
	color: white;
}

.bbb:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	background: #ff0047;
	width: 50%;
	height: 100%;
	transition: 0.5s;
	z-index: -1;
	transform: translateX(-200px) rotate(-325deg);
	opacity: 0;
	visibility: hidden;
}

.bbb.active:before {
	left: 50px;
	transform: translateX(0) rotate(35deg);
	border-top-left-radius:75px;
	border-bottom-left-radius:75px;
	opacity: 1;
	visibility: visible;
}

.bbb:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	background: #ff0047;
	width: 50%;
	height: 100%;
	transition: 0.5s;
	z-index: -1;
	transform: translateX(200px) rotate(325deg);
	opacity: 0;
	visibility: hidden;
}

.bbb.active:after {
	right: 50px;
	transform: translateX(0) rotate(-35deg);
	border-top-right-radius:75px;
	border-bottom-right-radius:75px;
	opacity: 1;
	visibility: visible;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<a class='bbb' href='#'>LIKE</a>
	<script src='https://code.jquery.com/jquery-3.3.1.js'></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.bbb').click(function(){
				$('.bbb').toggleClass('active')
			})
		})
	</script>
</body>
</html>