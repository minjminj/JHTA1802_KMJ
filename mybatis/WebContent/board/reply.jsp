<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
#reply #attfile {
 	display: none; 
}

</style>
<script>
function check(){
var ff = document.frm
	// 사진 미리보기
	ff.attfile.onchange = function(){
		 var file = event.srcElement;	// 이벤트가 발생한 태그
		 var url = file.files[0];		// 선택된 이미지의 경로
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 ff.img.src = e.target.result;
		 }
		 reader.readAsDataURL(url);
	}
}

	// 리플 작성 취소 시 다시 게시판 리스트로~
$(function(){
	$('#reply #btnCancle').click(function(){
		var page = './board/list.jsp';
 		var param = $('#frm_mem').serialize();
 		$('#content').load(page, param);
	});
	
	$('#reply #btnRegister').click(function(){
		var ff= document.frm_mem;
				/* 전송하고자 하는 form이 enctype일 경우, serialize()로 multi형태의
					데이터를 넘길 수 없기 때문에 Formdata(formname)을 쓴다.
				   그리고 그 자체가 parameter의 역할도 한다!
				   **** load()자체가 ajax기능을 담고 있기때문에 ajax안에서 load()를 쓰면 두번실행임.
				*/
		var data = new FormData(ff);
		
		$.ajax({
			type: 'post',
			url: './board/reply_result.jsp',
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
<div id='reply'>
	<h3>게시판입력</h3>
	<form name='frm' id='frm' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='id'/><br/>
		<label>제목</label>
		<input type='text' name='subject' size='50'/><br/>
		<label>내용</label>
		<textarea name='doc' rows='10' cols='40'></textarea><br/>
		<label>첨부파일</label>
		<div id='attfileZone'>
			<img src='http://placehold.it/160x120' id='img' name='img'/><br/>
			<output id='output'></output>
			<input type='file' name='attfile' id='attfile'/>
		</div>
		<label>암호</label>
		<input type='password' name='pwd'/>
		<p/>
		<input type='button' id='btnRegister' class='btn' value='POST'/>
		<input type='button' id='btnCancle'   class='btn' value='GoBack'/>
		<input type='text'   name='grp'       value='${param.sl }'/>
	</form>
</div>
<script>check()</script>
</body>
</html>