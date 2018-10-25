<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope_result</title>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">
<style>
* {font-family: 'Gaegu', cursive;}
#title {
	border-left:10px solid pink;
	padding-left:10px;
	box-sizing:border-box;
	background:#eeeeee;
	color: #222222;
}

</style>
</head>
<body>
<h3 id='title'>
	form에서 전달받은 값을 application, session, request, page에 저장한 후 다시 확인해보기
</h3>
<%	
	// form의 정보를 각 영역에 저장
	if (request.getMethod().equals("POST")){
		String msg = request.getParameter("msg");
		application.setAttribute("msg", msg);	// 모든 사용자들에게 공유될 정보
		session.setAttribute("msg", msg);	// 로그인정보, 인터넷 창 종료시 정보 리셋
		request.setAttribute("msg", msg);
		pageContext.setAttribute("msg", msg);
	}
%>
<ul>
	<li>Application: <%=application.getAttribute("msg") %></li>
	<li>Session: <%=session.getAttribute("msg") %></li>
	<li>Request: <%=request.getAttribute("msg") %></li>
	<li>PageContext: <%=pageContext.getAttribute("msg") %></li>
</ul>
<p/>
<a href='scope_result.jsp'>reloading..</a>
</body>
</html>