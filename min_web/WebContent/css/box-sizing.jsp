<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>box-sizing</title>

<style>
	div	{
		width:200px;
		height:100px;
		border:1px solid #0000ff;
	}
	
	div#padding, div#boxing {
		padding:20px;
	}
	
	div#boxing {				/* 원래 지정한 width와 height에 맞게, padding을 적용하고 싶을때 box-sizing해야함.*/
		box-sizing:border-box;
	}

</style>
</head>
<body>
<h1>normal</h1>
<div id='normal'>김민정</div>

<h1>padding</h1>
<div id='padding'>김민정</div>

<h1>box-sizing</h1>
<div id='boxing'>김민정</div>

</body>
</html>