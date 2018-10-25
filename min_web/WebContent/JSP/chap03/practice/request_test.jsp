<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request_test</title>
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
	width: 60px;
	display: inline-block;
}
</style>
</head>
<body>
<h3 id='title'>성명, 주소 , 애완동물을 입력받아 그 결과를 출력</h3>
<form name='frm' method='post'>
	<label class='la'>성명</label>
	<input type='text' name='irum' /><br/>
	
	<label class='la'>주소</label>
	<input type='text' name='address' ><br/>
	
	<label class='la'>애완동물</label>
	<label><input type='checkbox' name='pet' value='강아지'>강아지</label>
	<label><input type='checkbox' name='pet' value='고양이'>고양이</label>
	<label><input type='checkbox' name='pet' value='아기돼지'>아기돼지</label>
	<label><input type='checkbox' name='pet' value='친칠라'>친칠라</label>
<p/>
	<input type='submit' value='전송'/>
</form>
<hr/>
<%
	request.setCharacterEncoding("utf-8");
	if (request.getMethod().equals("GET")) return;

	String irum = request.getParameter("irum");
	String address = request.getParameter("address");
	String[] pet = request.getParameterValues("pet");
	
	out.print("<li>Name: " + irum);
	out.print("<li>Address: " + address);
	out.print("<li>Pet: " + pet);
%>
</body>
</html>