<%@page import="bean.BoardDao"%>
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
	BoardDao dao = new BoardDao();
	String msg = dao.insert(request);
	request.setAttribute("msg", dao.getMsg());
%>
${msg }
<input type='button' id='btnList' value='List'/>
<p/>

<script>
$(function(){
	$('#btnList').click(function(){
		$('#content').load('./board/list.jsp')
	});
});
</script>
</body>
</html>