<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include_action_main</title>
<link href="https://fonts.googleapis.com/css?family=Paytone+One" rel="stylesheet">
<style>
* {font-family: 'Paytone One', sans-serif;}
	div {
		width: 800px; height: 100%;
		border: 0.5px solid #dddddd;
		border-radius:2px;
		margin: 0 auto;
		overflow: hidden;
	}
	
	div > h3 {
		display: inline-block;
		box-sizing: border-box;
		width: 794px;
		padding-top: 20px;
		padding-bottom: 20px;
		border: 1px outset #FFE3EE;
		border-radius: 2px;
		margin: 3px;
		text-align: center;
		font-weight: bold;
		background-color: rgba(255, 227, 238, 0.5);
		
	}
	
	div > #left {
		display: inline-block;
		box-sizing: border-box;
		width: 250px;
		height: 500px;
		border: 1px outset #FFE3EE;
		border-radius: 2px;
		margin: 3px;
		float: left;
	}
	
	div > #left:after{
		content: "";
		background-image: url(suzimini.jpg);
		background-position: bottom;
		background-repeat: no-repeat;
		opacity: 0.6 !important;
	}

	div > #left:hover {
		background-color: rgba(255, 255, 179, 0.4);
		color: #aaaaaa;
	}
	
	div > #right {
		display: inline-block;
		box-sizing: border-box;
		width: 534px;
		height: 500px;
		border: 1px outset #FFE3EE;
		border-radius: 2px;
		margin: 3px;
		float: right;
	}
	
	#footer {
		clear: both;
		border: 1px outset #FFE3EE;
		border-radius: 2px;
		margin: 3px;
		font-weight: bold;
		font-size: 30px;
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	
	section > iframe {
		border: 0;
		border-top: 1px solid #aaaaaa;
		overflow: scroll;
	}

</style>
</head>
<body>
<%
	String min = "dan.jsp";	// 최초 include될 파일
	if (request.getParameter("min") != null){
		min = request.getParameter("min");
	}

%>




<div id='main' >
	<h3>Include_action_main</h3>
	<nav id='left'>
		<jsp:include page='include_action_menu.jsp'/>
	</nav>
	<section id='right'>
		<h3>Contents</h3>
		<jsp:include page='<%=min %>'/>
	</section>
	<footer id='footer'>
		HTA-1802
	</footer>
</div>
</body>
</html>