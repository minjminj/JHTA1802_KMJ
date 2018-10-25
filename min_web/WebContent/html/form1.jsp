<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form1</title>
</head>
<body>
	<form name= 'frm' method = 'post'>
	
	<label for = 'mid'>아이디</label>
		<input type = 'text' id = 'mid' name = 'mid' value = 'kim' size = '6' maxlength = '5'/><br/>
	
	<input type = 'button' value = '버튼'/><br/>
	
	<label>취미</label><br/>						<!-- 체크박스는 기본적으로 중복선택이 가능 -->
		<input type = 'checkbox' name = 'hobby' value = '축구'/>축구<br/>		<!-- 체크박스를 클릭해야만 선택 가능 -->
		<input type = 'checkbox' name = 'hobby' value = '야구'/>야구<br/>
		<input type = 'checkbox' name = 'hobby'value = '배구'/>배구<br/>
				
		<label><input type = 'checkbox' name = 'hobby' value = '농구'/>농구</label><br/>   <!-- 체크박스를 클릭하지 않고 문구를 클릭해도 선택 가능 -->
		<label><input type = 'checkbox' name = 'hobby' value = '비치발리볼'/>비치발리볼</label><br/>
		<label><input type = 'checkbox' name = 'hobby' value = '탁구'/>탁구</label><br/>
	
	<input type = 'file' name = 'artfile' /><br/>
	
	<input type = 'hidden' name = 'hiddenvalue'/><br/>
	
	<input type = 'image' src = '../img/daniel.jpg' width = '150' height = '200' /><br/>
	
	<label>암호</label><input type = 'password' name = 'pw'/><br/>
	
	<label>성별</label>
		<label><input type = 'radio' name = 'gender' value = '여자'/>여자</label>		<!-- 체크박스와 달리 중복선택이 불가능함 -->
		<label><input type = 'radio' name = 'gender' value = '남자'/>남자</label>		<!--  만약, radio의 이름을 지정해주지 않으면 중복선택 가능하게 코드가 짜여짐. 즉 radio는 이름을 구분함 -->
		<label><input type = 'radio' name = 'gender' value = '혹시'/>혹시</label><br>
	
	<input type = 'reset' /><br/>
	
	<input type = 'submit' />
	
	</form>
	
	
<% //jsp영역
// form의 method속성이 get이면 return
if (request.getMethod().equals("GET")) return;
request.setCharacterEncoding("UTF-8");
%>
<ul>
	<li>아이디: <%=request.getParameter("mid") %></li>
	<li>취미: <%=Arrays.toString(request.getParameterValues("hobby")) %></li>
	<li>첨부파일명: <%=request.getParameter("artfile") %></li>
	<li>히든값: <%=request.getParameter("hiddenvalue") %></li>
	<li>암호: <%=request.getParameter("pw") %></li>
	<li>성별: <%=request.getParameter("gender") %></li>
</ul>

</body>
</html>