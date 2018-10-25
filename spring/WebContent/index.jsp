<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="css/bootstrap.min.js"></script>  -->
<!-- 메인 css파일 -->
<link rel='stylesheet' type='text/css' href='main.css'/>

<!-- jquery -->
<script src='./lib/jquery-3.3.1.min.js'></script>
<script src='./css/jquery-ui.min.js'></script>
<link href='./css/jquery-ui.css' rel='stylesheet' type='text/css'/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<div id='index'>
	<c:choose>
	<c:when test="${id == null }">
		<input type='button' value='로그인'  id='btnLogin'/>
	</c:when>
	<c:when test="${id != null }">
		<input type='button' value='로그아웃' id='btnLogout'/>
		<input type='text'   size='5px'    id='mid' value='${id }' readonly='readonly' />
	</c:when>	
	
	</c:choose>
	<header><%@include file='header.jsp'%></header>
	
	<div id='center'>
		<div id='menu'><%@include file='menu.jsp'%></div>
		<div id='content'><%@include file='content.jsp'%></div>
	</div>
	
	<footer><%@include file='footer.jsp'%></footer>
</div>
<script>
// jquery를 사용하더라도 세션에 대한 부분은 최초에 한번 새로고침이 되어야만 적용되기 때문에 
// 	login.jsp를 로드하면서 login.jsp가 새로운 페이지로 열리도록 하는 소스를 넣어줌.
// 	따라서 index.jsp에 있는 css나 jquery에 대한 기본 설정부분이 login.jsp에도 모두 포함되어 있어야함.
$('#index #btnLogin').click(function(){
	location.href = './student/login.jsp';
});
$('#index #btnLogout').click(function(){
	location.href = 'logout.std';
});
</script>
</body>
</html>