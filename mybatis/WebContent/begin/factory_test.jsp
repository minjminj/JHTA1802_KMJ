<%@page import="bean.BeginFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='factory_test'>
	<h3>Factory Test</h3>
	<div id='info'>
		SqlSessionFactory가 생성되어 반환되는지 여부 테스트
	</div>
	
	<%
			SqlSession s = BeginFactory.getFatory().openSession();
				if(s == null) {
			out.print("세션 생성시 오류 발생");
				}else {
			out.print("성공적으로 세션 생성");
				}
		%>
</div>
</body>
</html>