<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info</title>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">
<style>
* {font-family: 'Gaegu', cursive;}
#title {
	border-left:10px solid #ff5555;
	padding-left:10px;
	box-sizing:border-box;
	background:#ffeeee;
}

</style>
</head>
<body>
<h3 id='title'>임의의 아이디, 성명, 연락처를 전달받아 선언문 내에서 출력</h3>
<%
info(out,"aaa", "길동이", "010-1111-1234");
%>

<%!
public void info(JspWriter out, String id, String name, String phone){
	try{
	out.print("<li> 아이디: " + id);
	out.print("<li> 성명  : " + name);
	out.print("<li> 연락처: " + phone);
		
	} catch(Exception ex){}
}
%>
</body>
</html>