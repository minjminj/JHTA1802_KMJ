<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>For 삭제</title>
</head>
<body>
<h3 id='deletemem' class='animated slideInLeft'>회원 정보 삭제 결과</h3>
<jsp:useBean id="member" class='bean.MemberVo' scope='page'/>
<jsp:setProperty property="*" name="member"/>

<%
	
	String sec = "list.jsp";
	pageContext.setAttribute("sec", sec);
	

	int nowPage = 1;
	
	if (request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	MemberDao dao = new MemberDao();
	if (dao.delete(member)){
		out.print("정상적으로 삭제됨");
	} else {
		out.print("삭제 중 오류 발생");
	}
	
	
%>

<div id='dele' class='animated fadeIn' action='index.jsp'>
	<form name='frmStore' method='post'>
		<input type='hidden' value='${param.nav }' name='nav'/>
		<input type='hidden' value='${sec }' name='sec'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='submit' value='목록' name='btnList' class='btn'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
	</form>
</div>
<script>
var ff = document.frmStore;

ff.btnList.onclick = function(){
	ff.nav.value = 'chap08_member_control.jsp'
	ff.sec.value = 'list.jsp';
	ff.submit();
}
</script>
</body>
</html>