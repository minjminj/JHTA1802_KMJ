<%@page import="bean.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 register_result</title>
</head>
<body>

<%
 	//MultipartRequest multi = new MultipartRequest(request, ".", "utf-8"); // 이건 사진 경로가 없을때 사용하는 MultipartRequetst형식
	BoardDao dao = new BoardDao();
	dao.insert(request);
	request.setAttribute("nowPage", dao.getNowPage());
	request.setAttribute("findStr", dao.getFindStr());
	request.setAttribute("message", dao.getMessage());
%>
<p/>
${message }
<p/>

<div id='register_result'>
<%-- 		<input type='hidden' value='${param.nav }' name='nav'/> --%>
<%-- 		<input type='hidden' value='${param.sec }' name='sec'/> --%>
		<input type='hidden' value='${findStr }' name='findStr'/>
		<input type='button' value='목록' id='btnList' class='btn'/>
		<input type='hidden' name='nowPage' value='${nowPage }'/>
</div>
<script>
$(function(){
	$('#register_result #btnList').click(function(){
		var param = $('#frm_board').serialize();
		$('#content').load('./board/list.jsp', param);
	});	
});
</script>
</body>
</html>