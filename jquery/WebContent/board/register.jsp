<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 register</title>
<script>
function check(){
var ff = document.frm_mem
	// 사진 미리보기
	ff.file.onchange = function(){
		 var file = event.srcElement;	// 이벤트가 발생한 태그
		 var url = file.files[0];		// 선택된 이미지의 경로
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 ff.attFile.src = e.target.result;
		 }
		 reader.readAsDataURL(url);
	}
}

$(function(){
	$('.mem #btnCancle').click(function(){
		var page = './board/list.jsp';
 		var param = $('#frm_mem').serialize();
 		$('#content').load(page, param);

// 		$.ajax({
// 			type: 'post',
// 			url: './board/list.jsp',
// 			data: param,
// 			success: function(resp){
// 				$('#content').html(resp);
// 			}
// 		});
	});
	
	$('.mem #btnRegister').click(function(){
		var ff= document.frm_mem;
				/* 전송하고자 하는 form이 enctype일 경우, serialize()로 multi형태의
					데이터를 넘길 수 없기 때문에 Formdata(formname)을 쓴다.
				   그리고 그 자체가 parameter의 역할도 한다!
				   **** load()자체가 ajax기능을 담고 있기때문에 ajax안에서 load()를 쓰면 두번실행임.
				*/
		var data = new FormData(ff);
		
		$.ajax({
			type: 'post',
			url: './board/register_result.jsp',
			contentType:  false,
			processData: false,
			data: data,
			success: function(resp){
				$('#content').html(resp);
			}
		});
	});
});
</script>
</head>
<body>
<h3 class='title animated slideInLeft'>Register Of Board</h3>

<div class='mem animated fadeInDown'>
<form name='frm_mem' id='frm_mem' method='post' enctype="multipart/form-data" >
	<label class='label'>아이디 </label>
	<input type='text' name='id'/><br/>
	<output name='idError' class='error'></output><br/><br/>
	
	<label class='label'>제목 </label>
	<input type='text' name='subject'/><br/>
	<output name='subjectError' class='error'></output><br/><br/>
	
	<label class='label'>내용 </label>
	<textarea  name='doc'></textarea>
	<output name='docError' class='error'></output><br/><br/>
	
	<label class='label'>비밀번호 </label>
	<input type='password' name='pwd'/><br/>
	<output name='pwdError' class='error'></output><br/><br/>
	
	<div id='forphoto'>
		<label class='label'>사진</label><br/>
		<img src='http://placehold.it/100x130' name='attFile' width='100px' height='130px'/><br/>
		<input type='file' name='file' size='9'/><br/>
		<output name='attFileError' class='error'></output><br/><br/>
	</div>
	<input type='button' id='btnRegister' class='btn' value='POST'/>
	<input type='button' id='btnCancle' class='btn' value='GoBack'/>
	
	<input type='hidden' name='findStr' value='${param.findStr }'/>
	<input type='hidden' name='nowPage' value='${param.nowPage }'/>
</form>
</div>
<script>check()</script>
</body>
</html>