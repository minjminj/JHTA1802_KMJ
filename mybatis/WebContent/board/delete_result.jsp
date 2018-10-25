<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	BoardDao dao = new BoardDao();
	dao.delete(request);
	
	request.setAttribute("msg", dao.getMsg());
	request.setAttribute("findStr", dao.getFindStr());
	request.setAttribute("nowPage", dao.getNowPage());
%>

${msg}
</body>
</html>