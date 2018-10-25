<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
</title>
</head>
<body>
<h3>page, request, session, application scope 사용 예</h3>

<%
	String name = "kim min jeong";

	pageContext.setAttribute("name", "kim min jeong");
	request.setAttribute("name", "Stacia");
	session.setAttribute("name", "KangDaniel");
	application.setAttribute("name", "Elena");
%>

<ol>
	<li>pageScope: ${pageScope.name }</li>
	<li>requestScope: ${requestScope.name }</li>
	<li>sessionScope: ${sessionScope.name }</li>
	<li>applicationScope: ${applicationScope.name }</li>
</ol>
</body>
</html>