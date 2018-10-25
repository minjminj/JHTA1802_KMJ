<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_result</title>
</head>
<body>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	String url = "";	
	String na = "../html/html_index.jsp";
	String se = "../html/anchor.jsp";
	String as =	"./aside_html.jsp";
	
	// 로딩할 페이지 정보를 저장
	if (request.getParameter("nav") != null){
		na = request.getParameter("nav");
	}
	if (request.getParameter("oldsec") != null){
		se = request.getParameter("oldsec");
	}
	if (request.getParameter("aside") != null){
		as = request.getParameter("aside");
	}
	url = "index.jsp"
		+ "?nav=" + na
		+ "&aside=" + as;
	
	// 로그인 시 입력된 아이디와 비밀번호가 데이터에 저장된 정보와 일치하는가 판단하기

	MemberDao dao = new MemberDao();
	MemberVo vo = dao.login(mid);
	
	if (mid != null || mid != "" || pwd != null || pwd != ""){ 
		if (vo != null){
							if (pwd.equals(vo.getPwd())){
								session.setAttribute("MEMBERID", mid);
								url += "&sec=" + se;
								out.print("<script>location.href='" + url + "'</script>");
							} else{
								se = "login.jsp?msg=비밀번호를 확인하세요";
								url += "&sec=" + se;
								//out.print("<script>location.href='./index.jsp?=sec./login.jsp?msg=비밀번호를 확인하세요'</script>");
								out.print("<script>location.href='" + url + "'</script>");
							}
		} else {
			se = "login.jsp?msg=아이디를 확인하세요";
			url += "&sec=" + se;
			//out.print("<script>location.href='./index.jsp?=sec./login.jsp?msg=아이디를 확인하세요'</script>");
			out.print("<script>location.href='" + url + "'</script>");
		}
	}
	

	
%>
</body>
</html>	