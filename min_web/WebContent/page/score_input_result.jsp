<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>input_result</title>
</head>
<body>
<div id='sresult'>
	<h3 id='title'>성적 입력 결과</h3>
	<jsp:useBean id='score' class='bean.ScoreVo' scope='page'/>
	<jsp:setProperty property='*' name='score'/>
	
	<ol>
		<li>아이디: <%=score.getId() %></li>
		<li>과목 : <%=score.getSubject() %></li>
		<li>날짜 : <%=score.getDate() %></li>
		<li>점수: <%=score.getScore() %></li>
	</ol>
</div>
</body>
</html>