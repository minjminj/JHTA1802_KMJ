<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form3</title>

<style>
	label.label{
		width:120px;
		display:inline-block;
		text-align:right;
		margin-right:8px;
	}
	
	input:focus, textarea:focus{
		background-color:#ddaabb;
	}
	
	input[type=submit]:hover{
		color: #ff0000;
		font-weight:bold;
	}
</style>
</head>
<body>
<form name='frm' method='post'>
	<label class='label'>ID</label>
		<input type='text' name='id'/><br/>
	
	<label class='label'>Password</label>
		<input type='password' name='pw'/><br/>
	
	<label class='label'>Phone Number</label>
		<input type='number' name='number'/><br/>
	
	<label class='label'>Address</label>
		<input type='address' name='address'/><br/>
	
	<label class='label'>Gender</label>
		<label><input type='radio' name='gender' value='female'>female</label>
		<label><input type='radio' name='gender' value='male'>male</label><br/>
	
	<label class='label'>Favorite Fruits</label>
		<label><input type='checkbox' name='favorite' value = 'apple'>apple</label>
		<label><input type='checkbox' name='favorite' value = 'pear'>pear</label>
		<label><input type='checkbox' name='favorite' value = 'peach'>peach</label>
		<label><input type='checkbox' name='favorite' value = 'watermelon'>watermelon</label>
		<label><input type='checkbox' name='favorite' value = 'sweetmelon'>sweetmelon</label>
		<label><input type='checkbox' name='favorite' value = 'strawberry'>strawberry</label><br/>
	
	<br/>
	<label class='label'>Image</label>
		<input type = 'image' src = '../img/suzi.jpg' width = '150' height = '200'/><br/>
	
	<label class='label'>Self</label>
		<textarea rows = '40' cols = '10' name = 'pr'></textarea><br/>
	
	<br/>
	<input type = 'submit' value = 'submit'/>
</form>

<%
if (request.getMethod().equals("GET")) return;
request.setCharacterEncoding("utf-8");
%>

<ul>
	<li>아이디: <%=request.getParameter("id") %></li><br/>
	<li>암호: <%=request.getParameter("pw") %></li><br/>
	<li>연락처: <%=request.getParameter("number") %></li><br/>
	<li>주소: <%=request.getParameter("address") %></li><br/>
	<li>성별: <%=request.getParameter("gender") %></li><br/>
	<li>좋아하는 과일: <%=Arrays.toString(request.getParameterValues("favorite")) %></li><br/>
	<li>자기소개: <%=request.getParameter("pr") %></li>

</ul>

</body>
</html>