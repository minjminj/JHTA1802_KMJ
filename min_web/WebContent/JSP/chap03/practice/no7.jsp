<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>no7</title>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">
<style>
#title {
	border-left:10px solid pink;
	padding-left:10px;
	box-sizing:border-box;
	background:#eeeeee;
	color: #222222;
	font-family: 'Gaegu', cursive;
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
	font-family: 'Gaegu', cursive;
}
.in {
	border: 0px;
	border-bottom: 1.5px solid #999999;
	box-shadow:0.3px 0px 0.3px #999999;
	font-family: 'Gaegu', cursive;
}

#sub {
	margin-top: 3px;
	margin-left: 65px;	
	font-family: 'Gaegu', cursive;
}


</style>
</head>
<body>
<h3 id='title'>정수 x를 입력받아 x의 약수들을 구하여 출력</h3>
<form name='frm' method='post'>
	<label class='la'>정수 x</label>
	<input type='text' name='intx' size='10' class='in'><br/>
	
	<input type='submit' value='약수구하기' id='sub'/>	
</form>
<p/>
<%
	request.setCharacterEncoding("utf-8");
	if (request.getMethod().equals("GET")) return;
	
	int x = Integer.parseInt(request.getParameter("intx"));
	String xixi = "x의 약수: ";	
	for (int i=1 ; i<=x ; i++){
			if (x%i == 0){
				xixi += i + "    ";
			}
		}

	out.print("<li>정수 x: " + x);
	out.print("<li>x의 약수들: " + xixi);
%>
</body>
</html>