<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>param</title>
</head>
<body>
<h3>EL: param test</h3>
<form name='frm' method='post'>
	<label>name</label>
	<input type='text' name='name' value='<%=request.getParameter("name")%>'/><br/>
	<label>kor</label>
	<input type='text' name='kor' value='${param.kor }' /><br/>
	
	<br/>
	<input type='submit' value='send'/>
	
</form>
<hr/>
<%
	if(request.getMethod().equals("GET")) return;
%>

<h4>request</h4>
<li>Name: <%=request.getParameter("name") %></li>
<li>kor: <%=request.getParameter("kor") %></li>



<h4>EL</h4>
<li>Name: ${param.name }</li>
<li>kor: ${param.kor }</li>

</body>
</html>