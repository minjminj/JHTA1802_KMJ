<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BoardDao dao = new BoardDao();
	dao.update(request);
	request.setAttribute("dao", dao);
	
	request.setAttribute("nowPage", dao.getNowPage());
	request.setAttribute("findStr", dao.getFindStr());
	request.setAttribute("serial", dao.getSerial());
	request.setAttribute("msg", dao.getMsg());
	
%>
${msg }<br/>
<form name='frmMr' id='frmMr' method='post'>
	<input type='button' id='btnList' value='List'/>
	<input type='button' id='btnView' value='View'/>
	<input type='hidden' name='findStr'    value='${findStr }'/>
	<input type='hidden' name='np' id='np' value='${nowPage }'/>
	<input type='hidden' name='sl' id='sl' value='${serial}'/>
</form>
<p/>

<script>
$(function(){
	$('#frmMr #btnList').click(function(){
		var param = $('#frmMr').serialize();
		$('#content').load('./board/list.jsp', param);
	});
	
	$('#frmMr #btnView').click(function(){
		var param = $('#frmMr').serialize();
		$('#content').load('./board/view.jsp', param);
	});
});
</script>
</body>
</html>