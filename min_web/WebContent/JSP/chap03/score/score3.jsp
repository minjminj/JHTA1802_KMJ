<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>score3</title>
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

.in {
	border: 0px;
	border-bottom: 1.5px solid #999999;
	box-shadow:0.3px 0px 0.3px #999999;
	margin-top:2px;
	margin-bottom:2px;
	font-family: 'Gaegu', cursive;
}
#sub {
	margin-left: 30px;
	font-family: 'Gaegu', cursive;
}

label {font-family: 'Gaegu', cursive;}

</style>
</head>
<body>
<%
	String korean = request.getParameter("kor");
	String english = request.getParameter("eng");
	String math = request.getParameter("mat");
	
	korean = (korean == null)? "":korean;
	math = (math == null)? "":math;
    english = (english == null)? "":english;
 
	String msgKor ="";
	String msgEng ="";
	String msgMat ="";
	
	if (request.getAttribute("msgKor") != null){
		msgKor = (String)request.getAttribute("msgKor");
	}
	
	if (request.getAttribute("msgEng") != null){
		msgEng = (String)request.getAttribute("msgEng");
	}
	
	if (request.getAttribute("msgMat") != null){
		msgMat = (String)request.getAttribute("msgMat");
	}
	
%>
<h3 id='title'>3개의 성적을 입력받아 총점, 평균, 학점을 구하여 동일한 페이지에 출력</h3>
<form name='frm' method='post' action='include_action_main.jsp?min=../chap03/score/score3_result_teacher.jsp'>
								<!-- 경로를 설정할때 scroe3은 이미 main에 include되어있기 때문에 action의 경로설정 처음 출발하는 기준이 main이 되어 있음. -->
	<label >국어</label>
	<input type='text' name='kor' class='in' size='9' value="<%=korean%>"/>
	<output class='out'><%=msgKor %></output>
	<br/>
	<label>영어</label>
	<input type='text' name='eng' class='in' size='9' value="<%=english%>"/>
	<output class='out'><%=msgEng %></output>
	<br/>
	<label>수학</label>
	<input type='text' name='mat' class='in' size='9' value="<%=math%>"/>
	<output class='out'><%=msgMat %></output>
	<br/>
	<input type='submit' value='성적 계산' id='sub' name='submit'/> 
</form>
<hr/>
<%
// 	request.setCharacterEncoding("utf-8");
// 	if (request.getMethod().equals("GET")) return;
	
// 	int kor = Integer.parseInt(request.getParameter("kor"));
// 	int eng = Integer.parseInt(request.getParameter("eng"));
// 	int mat = Integer.parseInt(request.getParameter("mat"));
	
// 	int tot = kor + eng + mat;
// 	double avg = tot / 3.0;
	
// 	out.print("<li> 국어: " + kor);
// 	out.print("<li> 영어: " + eng);
// 	out.print("<li> 수학: " + mat);
// 	out.print("<li> 총점: " + tot);
// 	out.print("<li> 평균: " + avg);
%>
</body>
</html>