<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hap</title>
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
	width: 50px;
	display: inline-block;
}

</style>
</head>
<body>
<h3 id='title'>두 정수 x,y(x<=y)를 입력받아 x~y까지의 합계와 평균을 계산하여 동일한 페이지에 출력</h3>
<form name='frm' method='post'>
	<label class='la'>정수 x</label>
	<input type='text' name='intx' size='6'/>
	<label class='la'>정수 y</label>
	<input type='text' name='inty' size='6'/>
	<input type='submit' value='계 에 산'/>
</form>
<hr/>
<%
	request.setCharacterEncoding("utf-8");
	if (request.getMethod().equals("GET")) return;
	
	int x = Integer.parseInt(request.getParameter("intx"));
	int y = Integer.parseInt(request.getParameter("inty"));
	int tot = 0;
		for (int i=x ; i<=y ; i++){
			tot += i;
		}
	double avg = tot/3.0;
	
	out.print("<li>정수 x: " + x);
	out.print("<li>정수 y: " + y);
	out.print("<li>합계 : " + tot);
	out.print("<li>평균: " + avg);
	%>
</body>
</html>