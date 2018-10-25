<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>score2</title>
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
	margin-bottom: 2.5px;
	display: inline-block;
}
.in {
	border: 0px;
	border-bottom: 1.5px solid #999999;
	box-shadow:0.3px 0px 0.3px #999999;
}

#sub {
    margin-left: 62px;
}

</style>
</head>
<body>
<h3 id='title'>이름, 성별(radio), 과목(국어, 영어, 수학) 점수를 입력받아 평균이 60미만이거나 각 과목 중 40미만이 있으면 불합격처리</h3>
<form name='frm' method='post'>
	<label class='la'>이름</label>
	<input type='text' name='irum' class='in' size='10'/><br/>
	<label class='la'>성별</label>
		<label><input type='radio' name='sex' value='Female'>F</label>
		<label><input type='radio' name='sex' value='Male'>M</label><br/>
	<label class='la'>국어</label>
	<input type='text' name='kor' class='in' size='10'/><br/>
	<label class='la'>영어</label>
	<input type='text' name='eng' class='in' size='10'/><br/>
	<label class='la'>수학</label>
	<input type='text' name='mat' class='in' size='10'/><br/>
	<br/>
	<input type='submit' value='성적계산' id='sub'/>
</form>
<hr/>

<%
	request.setCharacterEncoding("utf-8");
	if (request.getMethod().equals("GET")) return;
	
	String irum = request.getParameter("irum");
	String sex = request.getParameter("sex");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	int tot = kor + eng + mat;
	double avg = tot / 3.0;
	
	String hap = "합격";
	if (avg < 60 || kor <40 || eng < 40 || mat < 40){
		hap = "불합격";
	}
	
	out.print("<li>이름: " + irum); 
	out.print("<li>성별: " + sex); 
	out.print("<li>국어: " + kor); 
	out.print("<li>영어: " + eng); 
	out.print("<li>수학: " + mat); 
	out.print("<li>평균: " + avg); 
	out.print("<li>합격: " + hap); 
%>
</body>
</html>