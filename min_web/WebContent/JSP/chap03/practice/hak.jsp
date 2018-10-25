<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hak</title>
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

</style>
</head>
<body>
<h3 id='title'>정수형 정수를 전달받아 학점을 구하여 반환받아 출력</h3>
<%!
public char hakjum(int a){
	char gr = 'F';
	
	if (a >= 90){
		gr = 'A';
	} else if (a >= 80){
		gr = 'B';
	} else if (a >= 70){
		gr = 'C';
	} else if (a >= 60){
		gr = 'D';
	}
	
	
	return gr;
	
// 영역이 다르니까 당연히 out.print는 선언문 내에서 사용할 수 없다 . 하지만 꼼수는 존재!! info.jsp에서 확인가능!
	
}
%>

<%= hakjum(78) %>
</body>
</html>