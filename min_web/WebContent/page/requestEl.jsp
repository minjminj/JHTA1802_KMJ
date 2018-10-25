<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setAttribute("name", "김민정");
%>

<ol>
	<li>Request: <%=request.getAttribute("name") %></li>
	<li>EL: ${requestScope.name}</li>
	<li>URI: ${pageContext.request.requestURI}</li>
</ol>
</body>
</html>