<%@page import="bean.BoardVo"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 modify_result</title>
</head>
<body>
<h3 class='modifymem animated slideInLeft'>게시물 수정 결과</h3>
<%


	MultipartRequest req = new MultipartRequest(request, ".", "utf-8");
	request.setAttribute("nowPage", req.getParameter("nowPage"));
	request.setAttribute("findStr", req.getParameter("findStr"));
	
	BoardDao dao = new BoardDao();
	String msg = "";
	int serial = Integer.parseInt(req.getParameter("serial"));
	BoardVo vo = dao.selectOne(serial);
	vo.setSubject(req.getParameter("subject"));
	vo.setDoc(req.getParameter("doc"));
	vo.setFileOri(req.getParameter("fileOri"));
	vo.setAttFile(req.getParameter("attFile"));
	
	if (dao.modify(vo)){
		msg = "게시글 수정 성~~~~~공~~~~~~~~!";
	} else {
		msg = "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ숰ㅋㅋㅋ정ㅋㅋㅋㅋㅋㅋㅋㅋㅋ싴ㅋㅋㅋㅋㄹㅋㅋㅋ퍀ㅋㅋㅋ큐ㅠ";
	}
	
	request.setAttribute("msg", msg);
	
%>
<p/>
${msg }
<p/>

<div id='modi' class='animated fadeIn'>
	<form name='frmStore' id='frmStore' method='post'\>
		<input type='hidden' value='${findStr }' name='findStr'/>
		<input type='submit' value='목록' name='btnList' class='btn'/>
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