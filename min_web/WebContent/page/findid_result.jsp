<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기 실행</title>
</head>
<body>

<%
	String msg = "";
	String email = request.getParameter("email");
 	String nav = request.getParameter("nav");
 	String sec = "findId.jsp";
 	String url =  "";
	
	
	
	MemberDao dao = new MemberDao();
	MemberVo v = dao.info(email);
	
	if (email == null || email == ""){
		sec += "?msg=이메일 입력";
		url = "index.jsp?nav=" + nav + "&sec=" + sec;
		out.print("<script>location.href='" + url + "'</script>");
 	} else if (email.equals(v.getEmail())){
 		sec = sec + "?msg=가입하셨던 아이디는 " + v.getId(); 
 		url = "index.jsp?nav=" + nav + "&sec=" + sec;
		out.print("<script>location.href='" + url + "'</script>");
 	}

%>

</body>
</html>