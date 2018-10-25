<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 메인 css파일 -->
<link rel='stylesheet' type='text/css' href='../main.css'/>

<!-- jquery -->
<script src='../lib/jquery-3.3.1.min.js'></script>
<script src='../css/jquery-ui.min.js'></script>
<link href='../css/jquery-ui.css' rel='stylesheet' type='text/css'/>
</head>
<body>
<div id='index'>
	<header><%@include file='../header.jsp'%></header>
	
	<div id='center'>
		<div id='menu'><%@include file='../menu.jsp'%></div>
		<div id='content'>
			<div id='login'>
				<h3>로그인</h3>
				<form name='login_frm' id='login_frm' method='post'>
					<output value='${msg }'></output>
					<label>아이디</label><input type='text' name='id' id='id'/><br>
					<label>비밀번호</label><input type='password' name='pwd'/><p/>
					<input type='button' id='btnGoLogin' value='로그인' class='btn'/>
					<input type='button' id='btnCancle'  value='취 소'  class='btn'/><p/>
					<a href='#'>아이디/비밀번호 찾기</a>
				</form>
			</div>
		</div>
	</div>
	
	<footer><%@include file='../footer.jsp'%></footer>
</div>

<script>
$(function(){
	$('#login #btnGoLogin').click(function(){
		var ff = document.login_frm;
		ff.action = "../login.std"; // jqeury를 쓰지만 같은 페이지에서 열어주는 경우가 아니니 action과 submit을 사용
		ff.submit();
	});
	
	$('#login a').click(function(){
		$('#content').load('find.jsp');
	})
});
</script>
</body>
</html>