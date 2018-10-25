<%@page import="bean.BoardVo"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#btnList').click(function(){
		$('#content').load('./board/list.jsp')
	});
	
	$('#btnReply').click(function(){
		var param = $('#frm2').serialize();
		$('#content').load('./board/reply.jsp', param);
	});
	
	$('#btnModify').click(function(){
		var data = new FormData(document.frm);
		$.ajax({
			type: 'post',
			url: './board/modify_result.jsp',
			contentType: false,
			processData: false,
			data: data,
			success: function(resp){
				$('#content').html(resp);
			}
		});
	});
	
	$('#btnDelete').click(function(){
		var param = $('#frm2').serialize();
		$('#content').load('./board/delete_result.jsp', param);
	});
	
});
</script>
</head>
<body>
<div id='view'>
<%
	String findStr = "";
	int np = 1 ;
	BoardDao dao = new BoardDao();
	request.setAttribute("d", dao);
	
	if (request.getParameter("findStr") != null){
		findStr = request.getParameter("findStr");
	}
	System.out.println("findStr: " + findStr);
	if (request.getParameter("np") != null){
		np = Integer.parseInt(request.getParameter("np"));
	}
	System.out.println("np: " + np);
	
	int serial = Integer.parseInt(request.getParameter("sl"));
	System.out.println("serial: " + serial);
	BoardVo vo = dao.view(serial);
	request.setAttribute("vo", vo);
%>
	<h3>게 시글 보기</h3>
	<form name='frm' id='frm' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='id' value='${vo.id}' readonly='readonly'/><br/>
		<label>제목</label>
		<input type='text' name='subject' value='${vo.subject}' size='50'/><br/>
		<label>내용</label>
		<textarea name='doc' rows='10' cols='40'>${vo.doc}</textarea><br/>
		<label>첨부파일</label>
		<div id='attfileZone'>
			<img src='./upload/${vo.attfile}' id='img' name='img'/><br/>
			<output id='output'></output>
			<input type='file' name='attfile' id='attfile'/>
			
		</div>
		<label>암호</label>
		<input type='password' name='pwd' value='${vo.password}'/>
		<p/>
		<input type='button' id='btnModify' value='수정'/>
		<input type='button' id='btnDelete' value='삭제'/>
		<input type='button' id='btnReply'  value='답글'/>
		<input type='button' id='btnList'   value='목록'/>
		
		<input type='hidden' name='findStr'    value='${param.findStr}'/>
		<input type='hidden' name='np' id='np' value='${param.np }'/>
	</form>

	<form name='frm2' id='frm2' method='post'>
		<input type='hidden' name='findStr'    value='${param.findStr}'/>
		<input type='hidden' name='np' value='${param.np }'/>
		<input type='hidden' name='sl' value='${param.sl}'/>
		<input type='hidden' name='realfile' value='${vo.attfile }'/>
	</form>
</div>
</body>
</html>