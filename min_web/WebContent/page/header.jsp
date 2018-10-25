<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var loginInit = function(nav, sec, aside){
	var blogin = document.getElementById("blogin");
	var blogout = document.getElementById("blogout");
	var url = "index.jsp"
			+ "?nav=" + nav
			+ "&oldsec=" + sec
			+ "&aside=" + aside;
	
	if (blogin != null){
		blogin.onclick = function(){
			location.href = url + "&sec=./login.jsp";
		}
	}
	if (blogout != null){
		blogout.onclick = function(){
			location.href = url + "&sec=./logout.jsp";
		}
	}
}
</script>
</head>
<body>
<%
	//String mid = request.getParameter("mid");
	//session.setAttribute("MEMBERID", mid);
	String session_id = (String)session.getAttribute("MEMBERID");
	request.setAttribute("id", session_id);


		String na = "../html/html_index.jsp";
 		String se = "../html/anchor.jsp";
 		String as =	"./aside_html.jsp";
		
		if (request.getParameter("nav") != null){
			na = request.getParameter("nav");
		}
		if (request.getParameter("sec") != null){
			se = request.getParameter("sec");
		}
		if (request.getParameter("aside") != null){
			as = request.getParameter("aside");
		}
		
		

%>

<div id='header_main'>
	<ul id='home'>
		<li><a href='./index.jsp' style='display:inline'>MJ HOME</a></li>
		<li><a href='../../ajax/index.jsp' style='display:inline'>AJAX HOME</a></li>
		<li><a href='../../jquery/index.jsp' style='display:inline'>JQUERY HOME</a></li>
	</ul>

	<div id='top_menu'>
			<c:choose>
			<c:when test='${empty id }'>
				<input type='submit' value='로그인' id='blogin'/>
			</c:when>
			
			<c:otherwise>
				<input type='text'	value="${id }님" size='5' id='idbox'/>
				<input type='button' value='로그아웃' id='blogout'/>
			</c:otherwise>
			</c:choose>
		
	</div>
	
	<ul id='sub_menu'>
		<li><a href='index.jsp?nav=../board/control.jsp&sec=../board/info.jsp'>BOARD</a></li>
		<li><a href='index.jsp?nav=../html/html_index.jsp&aside=aside_html.jsp'>HTML</a></li>
		<li><a href='index.jsp?nav=../css/css_index.jsp&aside=aside_css.jsp'>CSS</a></li>
		<li><a href='#'>JS</a></li>
		<li><a href='#'>JSP</a></li>
		<li><a href='#'>AJAX</a></li>
		<li><a href='#'>JQUERY</a></li>
		<li><a href='#'>MYBATIS</a></li>
		<li><a href='index.jsp?nav=./score_control.jsp&sec=./score_info.jsp'>SCORE</a></li>
		<li><a href='index.jsp?nav=./chap08_member_control.jsp&sec=./chap08_member_info.jsp'>MEMBER</a></li>
		<li><a href='index.jsp?nav=../servlet_member/chap08_member_control.jsp&sec=../servlet_member/chap08_member_info.jsp'>MEMBER(S)</a></li>
	</ul>
</div>

<script>loginInit('<%=na%>', '<%=se%>', '<%=as%>')</script>
</body>
</html>
