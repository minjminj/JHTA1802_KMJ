<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>분리된 로그인</title>
</head>
<body>
	
<!--

	1. 로그인 시 입력된 아이디와 비밀번호가 데이터에 저장된 정보와 일치하는가 판단하기
	2. 로그인 시 아이디와 비밀번호에 오류가 있다면 메시지로 표시
	
	1. 과 2. 를 모두 LoginServlet에서 처리하고 결과만 받아온다!!!!!!!!!!!!!!!!!!!!
	View와 Control의 분리!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
 -->

	


<div id='loginmain'>
	<h4>login</h4>
	<form name='flogin' method='post' action='halae.login'>
		<label>아이디</label>
		<input type='text' name='mid'/><br/>
		
		<label>암호</label>
		<input type='password' name='pwd'/><br/>
		<output name='msg' class='msg'>${msg }</output><br/>
		
		<p/>
		<input type='submit' value='LOGIN' id='btnlogin' name='btnlogin'/>
		
		<p/>
		<a class='a' href='index.jsp?sec=findId.jsp'>아이디찾기</a> 
		<a class='a' href='index.jsp?sec=findPwd.jsp'>암호찾기</a> 
		
	
	</form>
</div>


</body>
</html>