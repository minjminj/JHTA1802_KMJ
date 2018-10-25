<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 스크립틀릿
Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat();

/*public void sum(){
	// 전체 페이지가 서블릿으로 바뀌면서 하나의 메소드에 포함되는 형태가 된다.
	// 메소드 안에 메소드를 선언하는 꼴이 되는데 이는 불가능한 형태. 그래서 오류가 발생하는 것.
	// 만약 꼭 메소드를 만들어서 써야겠다 하면,,,
}*/
%>

<%!
// 느낌표가 함께 있느 형태(선언문)에 메소드를 정의해야함.
public void sum(){
	
}
%>
<%=
// 선언문
"김민정" %>
<% out.print("김민영"); 
// out 은 jspWriter의 변수명%>

<h3>servlet code 확인</h3>
</body>
</html>