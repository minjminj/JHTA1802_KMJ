<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#insert #attfile {
 	display: none; 
}


</style>

<script>
$(function(){
	var ff = document.frm
	$('#insert #img').click(function(){
		$('#insert #attfile').click();
	});
	
	// 파일 선택되면 output영역에 파일명 보여주기
// 	$('#insert #attfile').change(function(){
// 		$('#insert #output').val($(this).val());
// 	});
	
	// 이미지 미리보기
	$('#insert #attfile').change(function(){
		var fn = $(this).val();
		fn = fn.substr(fn.lastIndexOf("\\") + 1);
		$('#insert #output').val(fn);
		
		 var file = ff.attfile;	// 이벤트가 발생한 태그
		 var url = file.files[0];		// 선택된 이미지의 경로
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 ff.img.src = e.target.result;
		 }
		 reader.readAsDataURL(url);
	});
	
 	// 저장 버튼이 클릭되면
	$('#insert #btnSend').click(function(){
		var data = new FormData(ff);
		$.ajax({
			url: './board/insert_result.jsp',
			data: data,             
			type: 'post',
			contentType: false,
			processData: false,
			success: function(resp){
				$('#content').html(resp);
			}
		});
	});
 	
 	// 취소 버튼이 클릭되면
	$('#insert #btnCancle').click(function(){
		var page = './board/list.jsp';
 		var param = $('#frm').serialize();
 		$('#content').load(page, param);
	});
	
});
</script>
</head>
<body>
<div id='insert'>
	<h3>게시판입력</h3>
	<form name='frm' id='frm' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='id' value='park'/><br/>
		<label>제목</label>
		<input type='text' name='subject' size='50' value='할로'/><br/>
		<label>내용</label>
		<textarea name='doc' rows='10' cols='40'>목욜이다~~~~말복이쥐롱</textarea><br/>
		<label>첨부파일</label>
		<div id='attfileZone'>
			<img src='http://placehold.it/160x120' id='img' name='img'/><br/>
			<output id='output'></output>
			<input type='file' name='attfile' id='attfile'/>
		</div>
		<label>암호</label>
		<input type='password' name='pwd' value='1111'/>
		<p/>
		<input type='button' id='btnSend'   value='저장'/>
		<input type='button' id='btnCancle' value='취소'/>
	</form>
</div>
</body>
</html>