<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기 실행</title>
</head>
<body>

<%
	String msg = "";
	String id = request.getParameter("id");
	String email = request.getParameter("email");
 	String nav = request.getParameter("nav");
 	String sec = "findPwd.jsp";
 	String url =  "";
	
	
	
	MemberDao dao = new MemberDao();
	MemberVo v = dao.info(email);
	
	if (email == null || email == "" || id == null || id == ""){
		sec += "?msg=아이디 또는 이메일을 입력하세요.";
		url = "index.jsp?nav=" + nav + "&sec=" + sec;
		out.print("<script>location.href='" + url + "'</script>");
		v = null;
		
 	} 
	else if (email.equals(v.getEmail()) && id.equals(v.getId())){
 		sec = sec + "?msg=가입하셨던 비밀번호는 비밀입니다" ; 
 		url = "index.jsp?nav=" + nav + "&sec=" + sec;
		out.print("<script>location.href='" + url + "'</script>");
		v = null;
		
 	} 
	else if (email != v.getEmail() || id != v.getId()){
 		sec += "?msg=일치하는 아이디 또는 이메일이 존재하지 않습니다.";
 		url = "index.jsp?nav=" + nav + "&sec=" + sec;
		out.print("<script>location.href='" + url + "'</script>");
		v = null;
		
 	} 
%>

</body>
</html>