<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope</title>
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

</style>
</head>
<body>
<h3 id='title'>scope</h3>
<form name='frm' method='post' action='scope_result.jsp'>
	<label>Data</label>
	<input type='text' name='msg' value='kim min jeong'/>
	<input type='submit' value='TEST'/>

</form>
</body>
</html>