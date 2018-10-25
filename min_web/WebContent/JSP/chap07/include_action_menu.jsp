<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include_action_menu</title>
<link href="https://fonts.googleapis.com/css?family=Paytone+One" rel="stylesheet">
<style>
* {font-family: 'Paytone One', sans-serif;}
	a {
		text-decoration: none;
		display: inline-block;
		margin-top: 3px;
		margin-bottom: 7px;
	}
	
	a:hover {
		text-decoration: underline;
		backgound: #cccccc;
		font-size: 20px;
		text-weight: bold;
		color: black;
	}
	
	ul, li {
		list-style: none;
		padding-left: 0;
		margin-left: 0;
	}


</style>
</head>
<body>
<h3>Menu</h3>
<form name='fmenu' method='post'></form>
<ul>
	<li><a href='include_action_main.jsp?min=../chap03/practice/no7.jsp'>no7</a></li>
	<li><a href='include_action_main.jsp?min=../chap03/practice/gugudan.jsp'>gugudan</a></li>
	<li><a href='include_action_main.jsp?min=../chap03/practice/hak.jsp'>hak</a></li>
	<li><a href='include_action_main.jsp?min=../chap03/score/score3.jsp'>score3</a></li>
</ul>
</form>
</body>
</html>