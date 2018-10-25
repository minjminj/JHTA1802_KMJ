<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<link href="https://fonts.googleapis.com/css?family=Paytone+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='index_max.css'/>
<link rel="stylesheet"  type='text/css' href="fadeIn.css">
<!-- <link rel='stylesheet' type='tex bt/css' href='index_max.css' media='screen and (min-width:1200px)'/> -->
<!-- <link rel='stylesheet' type='text/css' href='index_med.css' media='screen and (min-width:1000px) and (max-width:1199px)'/> -->
<!-- <link rel='stylesheet' type='text/css' href='index_min.css' media='screen and (max-width:999px)'/> -->

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String nav ="../html/html_index.jsp";
	if (request.getParameter("nav") != null){
		nav = request.getParameter("nav");
	}
	
	String sec ="../html/anchor.jsp";
	if (request.getParameter("sec") != null){
		sec = request.getParameter("sec");
	}
	
	
	String aside = "./aside_html.jsp";
	if (request.getParameter("aside") != null){
		aside = request.getParameter("aside");
	}
	
%>

<header id='header' class='animated lightSpeedIn'>
	<jsp:include page='header.jsp'/>
</header>

<div id='content'>
	<nav id='nav'>
		<jsp:include page="<%=nav %>"/>
		
	</nav>
	<div id='sec'>
		<jsp:include page="<%=sec %>"/>
	</div>
	<aside id='aside'>
		<jsp:include page="<%=aside %>"/>
	</aside>
</div>

<footer id='footer'>
	<%@ include file='footer.jsp' %>
	<p class="info">Style created by <a href="">김민정</a></p>
</footer>
</body>
</html>