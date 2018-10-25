<%@page import="bean.StudentVo"%>
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
		var param = $('#frm2').serialize();
		$('#content').load('list.std', param);
	});
	
	$('#btnModify').click(function(){
		var param = $('#frm2').serialize();
		$('#content').load('modify.std', param);
	});
		
	$('#btnDelete').click(function(){
		var param = $('#frm2').serialize();
		$('#content').load('delete.std', param);
	});
	
});
</script>
</head>
<body>
<div id='view'>
<%
%>
	<h3>회원정보얍얍얍</h3>
	<form name='frm' id='frm' method='post' enctype='multipart/form-data'>
		<div id='form'>
			<label class='label'>아이디 </label>
			<input type='text' name='id' value='${vo.id}' readonly="readonly"/><br/>
			<output name='idError' class='error'></output>
			
			<label class='label'>이름 </label>
			<input type='text' name='name' value='${vo.name}' readonly="readonly"/><br/>
			
			<label class='label'>연락처 </label>
			<input type='text' name='phone' value='${vo.phone}' readonly="readonly"/><br/>
			
			<label class='label'>비밀번호 </label>
			<input type='text' name='pwd' value='${vo.pwd}' readonly="readonly"/><br/>
			
			<label class='label'>우편번호 </label>
			<input type='text' name='post' value='${vo.post}' readonly="readonly"/><br/>
			
			<label class='label'>주소 </label>
			<input type='text' name='address' value='${vo.address}' readonly="readonly"/><br/>
			
			<label class='label'>이메일 </label>
			<input type='text' name='email' value='${vo.email}' readonly="readonly"/><br/>

			<input type='button' id='btnModify' value='수정' class='btn'/>
			<input type='button' id='btnDelete' value='삭제' class='btn'/>
			<input type='button' id='btnList'   value='목록' class='btn'/>
		</div>
		<div id='photoZone'>
			<label class='label'>첨부파일</label>
			<img src='./upload/${vo.photo}' id='img' name='img' width='350px' height='450px'/><br/>
			<output id='output' value='${vo.photo}'></output>
			
		</div>
		<p/>
		
		<input type='hidden' name='findStr'    value='${param.findStr}'/>
		<input type='hidden' name='np' id='np' value='${param.np }'/>
	</form>

	<form name='frm2' id='frm2' method='post'>
		<input type='hidden' name='findStr'    value='${param.findStr}'/>
		<input type='hidden' name='np' value='${param.np }'/>
		<input type='hidden' name='photo' value='${vo.photo }'/>
		<input type='hidden' name='id'    value='${vo.id }'/>
	</form>
</div>
</body>
</html>