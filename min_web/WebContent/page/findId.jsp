<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 정보를 확인해서 아이디찾기</title>

<script>

</script>
</head>
<body>
<h3 id='titleid' class='animated slideInLeft'>아이디 찾기</h3>

<%
	String msg = "";
	String nav = request.getParameter("nav");
	String sec = request.getParameter("sec");
	
	
	if (request.getAttribute("msg") != null){
		msg = (String)request.getAttribute("msg");
	} else {
		msg = request.getParameter("msg");
	}
	
	if (msg == null) msg="";

%>

<div id='findid'>
	<form name='frm' method='post'>
		<label class='la'>이메일</label>
		<input type='email' name='email'/>
		
		<p/>
		<input type='button' name='idid' value='아이디 찾기' class='btn'/>
		<br/>
		<output name='msg' class='msg'><%=msg %></output><br/>
		
		<p/>
		<a class='a' href='index.jsp?sec=login.jsp'>로그인 하러가기</a> 
		
		<input type='hidden' name='nav' value='<%=nav%>'/>
		<input type='hidden' name='sec' value='<%=sec%>'/>
	</form>
</div>
<script>
function find(){
	var ff = document.frm;
	ff.idid.onclick = function(){
		ff.method = 'get';
		ff.nav.value = 'chap08_member_control.jsp';
		ff.sec.value = 'findid_result.jsp';
		ff.action ='index.jsp';
		ff.submit();
	}
}
find();
</script>
</body>
</html>