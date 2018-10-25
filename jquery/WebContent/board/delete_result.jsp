<%@page import="bean.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 delete_result</title>
</head>
<body>
<h3 class='deletemem animated slideInLeft'>회원 정보 삭제 결과</h3>
<%
	//MultipartRequest req = new MultipartRequest(request, ".", "utf-8");
	BoardDao dao = new BoardDao();
	dao.delete(request);
	request.setAttribute("nowPage", dao.getNowPage());
	request.setAttribute("findStr", dao.getFindStr());
	request.setAttribute("message", dao.getMessage());
%>
<p>
${message }
<p/>

<div class='dele animated fadeIn' >
	<form name='frmStore' id='frmStore' method='post'>
<%-- 		<input type='hidden' value='${param.nav }' name='nav'/> --%>
<%-- 		<input type='hidden' value='${param.sec }' name='sec'/> --%>
		<input type='hidden' value='${findStr }' name='findStr'/>
		<input type='button' value='목록' name='btnList' class='btn'/>
		<input type='hidden' name='nowPage' value='${nowPage }'/>
	</form>
</div>
<script>
$(function(){
	document.frmStore.btnList.onclick = function(){
		var page = './board/list.jsp';
 		var param = $('#frmStore').serialize();
 		$('#content').load(page, param);
	}
});
</script>
</body>
</html>