<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet_register_result</title>


</head>
<body>
<div id='mem_result' class='animated bounceInRight'>
	<h3 id='title'>회원 입력 결과</h3>
<!-- 		form에 저장된 결과가 member에 모두 저장됨 -->
	
	${msg }
	
	<ol>
		<li>아이디: ${m.id }</li>
		<li>이름:  ${m.name }</li>
		<li>연락처: ${m.phone }</li>
		<li>비밀번호: ${m.pwd }</li>
		<li>우편번호:  ${m.post }</li>
		<li>주소:  ${m.ar }</li>
		<li>이메일:  ${m.email }</li>
		<li>사진 : <img src='../upload/${m.photO }'></li>
		
	</ol>
		<a href="list.hta"><Button class='btn'>목록</Button></a>
		
	
</div>

</body>
</html>