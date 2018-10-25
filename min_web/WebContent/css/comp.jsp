<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comp</title>
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
<h3 id=title>두 수를 매개변수로 받아 합계와 평균을 문자열로 반환받아 표현식으로 출력</h3>
<%!
public String compute(int a, int b){
	String str ="";
	int s = a + b;
	double av = s / 2.0;
	str = "<li>합계: " + s
		+ "<li>평균: " + av;
	
	return str;
}
%>

<%= compute(5, 13) %>

</body>
</html>