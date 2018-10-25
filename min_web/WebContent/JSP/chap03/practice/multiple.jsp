<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>multiple</title>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">
<style>
* {font-family: 'Gaegu', cursive;}
#title {
	border-left:10px solid pink;
	padding-left:10px;
	box-sizing:border-box;
	background:#eeeeee;
	color: #222222;
}
.la {
background-color: #999999;
	color: white;
	border: 1px solid #cccccc;
	text-align: right;
	width: 59px;
	display: inline-block;
	padding-right: 2px;
	box-sizing: border-box;
}

</style>
</head>
<body>
<h3 id='title'>두 정수 x,y(x<=y)와 z(배수)를 입력받아 x~y까지의 수중 z의 배수를 동일한 페이지에 출력</h3>
<form name='frm' method='post'>
	<label class='la'>정수 x</label>
	<input type='text' name='intx' size='6'/>
	<label class='la'>정수 y</label>
	<input type='text' name='inty' size='6'/>
	<label class='la'>정수 z</label>
	<input type='text' name='intz' size='6'/>
	
	<input type='submit' value='얍!!'/>
</form>
<hr/>

<%
	request.setCharacterEncoding("utf-8");
	if (request.getMethod().equals("GET")) return;
	
	int x = Integer.parseInt(request.getParameter("intx"));
	int y = Integer.parseInt(request.getParameter("inty"));
	int z = Integer.parseInt(request.getParameter("intz"));
	
	String zzz =" ";
	int cnt = 0;
		for (int i=x ; i<=y ; i++){
			if (i%z == 0){
				zzz+= i;
				cnt ++;
				zzz+= ",";
			} 
		}
		
	out.print("<li>정수 x: " + x);
	out.print("<li>정수 y: " + y);
	out.print("<li>정수 z: " + z);
	out.print("<li>x~y까지의 수 중 z의 배수들: " + zzz);
%>
</body>
</html>