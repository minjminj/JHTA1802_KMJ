<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugudan</title>
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
<h3 id='title'>선언문을 사용하여 gugu(int)를 만들어 구구단을 문자열로 반환하여 표현식으로 출력</h3>
<%! // 선언문(전역형 변수 및 메소드를 선언할 때)
public String gugu(int dan){
	String str = "";
	int r = 0;
	for (int i=1 ; i<10 ; i++){
		r = dan * i;
		str += String.format("%d * %d = %d <br/>", dan , i ,r);
	}
	return str;
}
%>

<%= gugu(5) %>
</body>
</html>