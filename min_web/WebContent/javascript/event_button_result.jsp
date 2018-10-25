<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event_button_result</title>
</head>
<body>
<% //JSP의 영역. 즉,scriptlet
//request 객체는 사용자가 요청한 정보를 갖고 있음.
request.setCharacterEncoding("utf-8");
String mid = request.getParameter("mid");
out.print("ID: " + mid);
%>
</body>
</html>