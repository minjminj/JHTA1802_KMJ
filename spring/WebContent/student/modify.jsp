<%@page import="bean.StudentVo"%>
<%@page import="bean.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify</title>
<script>
$('#modify #btnModify').click(function(){
	var data = new FormData(document.frm);
	$.ajax({
		type: 'post',
		url: 'update.std',
		contentType: false,
		processData: false,
		data: data,
		success: function(resp){
			$('#content').html(resp);
		}
	});
});

$('#btnList').click(function(){
	var param = $('#frm2').serialize();
	$('#content').load('list.std', param);
});

//이미지 미리보기
$('#modify #photo').change(function(){
	var fn = $(this).val();
	fn = fn.substr(fn.lastIndexOf("\\") + 1);
	$('#modify #output').val(fn);
	
	 var file = document.frm.photo;	// 이벤트가 발생한 태그
	 var url = file.files[0];		// 선택된 이미지의 경로
	 
	 var reader = new FileReader();
	 reader.onload = function(e){
		 document.frm.img.src = e.target.result;
	 }
	 reader.readAsDataURL(url);
});
</script>
</head>
<body>
<div id='modify'>
	<h3>회원정보수정할거</h3>
	<form name='frm' id='frm' method='post' enctype='multipart/form-data'>
			<label class='label'>아이디 </label>
			<input type='text' name='id' value='${vo.id }' readonly='readonly'/><br/>
			<output name='idError' class='error'></output>
			
			<label class='label'>이름 </label>
			<input type='text' name='name' value='${vo.name }'/><br/>
			
			<label class='label'>연락처 </label>
			<input type='text' name='phone' value='${vo.phone }'/><br/>
			
			<label class='label'>비밀번호 </label>
			<input type='text' name='pwd' value='${vo.pwd }'/><br/>
			
			<label class='label'>우편번호 </label>
			<input type='text' name='post' value='${vo.post }'/><br/>
			
			<label class='label'>주소 </label>
			<input type='text' name='address' value='${vo.address }'/><br/>
			
			<label class='label'>이메일 </label>
			<input type='text' name='email' value='${vo.email }'/><br/>
		
		<label class='label'>첨부파일</label>
		<div id='photoZone'>
			<img src='./upload/${vo.photo}' id='img' name='img' width='350px' height='450px'/><br/>
			<output id='output'></output>
			<input type='file' name='photo' id='photo' class='btn'/>
			
		</div>
		<p/>
		<input type='button' id='btnModify' value='수정' class='btn'/>
		<input type='button' id='btnDelete' value='삭제' class='btn'/>
		<input type='button' id='btnList'   value='목록' class='btn'/>
		
		<input type='hidden' name='findStr'    value='${param.findStr}'/>
		<input type='hidden' name='np' id='np' value='${param.np }'/>
	</form>

	<form name='frm2' id='frm2' method='post'>
		<input type='hidden' name='findStr'    value='${param.findStr}'/>
		<input type='hidden' name='np' value='${param.np }'/>
		<input type='hidden' name='realfile' value='${vo.photo }'/>
	</form>
</div>
</body>
</html>