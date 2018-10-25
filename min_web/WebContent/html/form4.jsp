<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form4</title>
</head>
<body>
<div>
<form name='frm' method='post'>
	<label>subject</label><br/><br/>
		<label>kor<input type='number' name='kor' value='국어' min='0' max='100'/></label><br/>
		<label>eng<input type='number' name='eng' value='영어' min='0' max='100'/></label><br/>
		<label>math<input type='number' name='math' value='수학' min='0' max='100'/></label><br/>
		<label>data<input type='number' name='dataprocessing' value='전산' min='0' max='100'/></label><br/>
		<label>history<input type='number' name='history' value='역사' min='0' max='100'/></label><br/>
		<label>g.history<input type='number' name='globalhistory' value='세계사' min='0' max='100'/></label><br/>
</div>	
	<br/><br/><br/>
	
		<label>zone<select size='1' name='zone'></label>
			<legend>zone</legend>
			<option value='서울'>서울</option>
			<option value='경기'>경기</option>
			<option value='강원'>강원</option>
			<option value='충청'>충청</option>
			<option value='호남'>호남</option>
			<option value='영남'>영남</option>
			<option value='제주'>제주</option>
		</select>

	
	<br/>
	<label>hard</label>
		<input type='range' name='range' min='1' max='100'/><br/>
	
	<br/>
	<input type='submit' name='submit' value='subject'/>
		
</form>
<%
if (request.getMethod().equals("GET")) return;
request.setCharacterEncoding("utf-8");

int tot = Integer.parseInt(request.getParameter("kor"))
		+ Integer.parseInt(request.getParameter("eng"))
		+ Integer.parseInt(request.getParameter("math"))
		+ Integer.parseInt(request.getParameter("dataprocessing"))
		+ Integer.parseInt(request.getParameter("history"))
		+ Integer.parseInt(request.getParameter("globalhistory"));

double avg = tot / 6.0;
%>

<article>
<ul>
	<li>kor: <%=request.getParameter("kor") %></li>
	<li>eng: <%=request.getParameter("eng") %></li>
	<li>math: <%=request.getParameter("math") %></li>
	<li>data: <%=request.getParameter("dataprocessing") %></li>
	<li>history: <%=request.getParameter("history") %></li>
	<li>g.history: <%=request.getParameter("globalhistory") %></li>
	<li>total: <%=tot %></li>
	<li>average: <%=avg %></li>
	<li>zone: <%=request.getParameter("zone") %></li>
	<li>hard: <%=request.getParameter("range") %></li>
</ul>
</article>
</body>
</html>