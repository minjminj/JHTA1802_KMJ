<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력</title>
<script>
function yap(){
	
	var fs = document.frm_sin;
	// 날짜 초기값 오늘 날짜로 지정
	fs.date.value = new Date().toISOString().substring(0, 10); 
	
	
	fs.btnInput.onclick = function(){
		fs.idError.value = '';
		fs.subjectError.value = '';
		fs.dateError.value = '';
		fs.scoreError.value = '';

		fs.id.style.backgroundColor = '#ffffff';
		fs.subject.style.backgroundColor = '#ffffff';
		fs.date.style.backgroundColor = '#ffffff';
		fs.score.style.backgroundColor = '#ffffff';

		if (fs.id.value.trim() == ""){
				fs.id.focus();
				fs.id.style.backgroundColor = '#FC9D9A';
				fs.idError.value = '아이디를 확인해주세요';
			} else if (fs.subject.value.trim() == ""){
				fs.subject.focus();
				fs.subject.style.backgroundColor = '#FC9D9A';
				fs.subjectError.value = '과목명을 확인해주세요';
			} else if (fs.date.value.trim() == ""){
				fs.date.focus();
				fs.date.style.backgroundColor = '#FC9D9A';
				fs.dateError.value = '날짜을 확인해주세요';
			} else if (fs.score.value.trim() == "" || fs.score.value<0 || fs.score.value>100 || !isNaN()){
				fs.score.focus();
				fs.score.style.backgroundColor = '#FC9D9A';
				fs.scoreError.value = '점수를 확인해주세요';
			} else {
				fs.action = 'index.jsp?nav=score_control.jsp&sec=score_input_result.jsp';
				fs.submit();
			}
	}
}
</script>
</head>
<body>
<div id='sin'>
<form name='frm_sin' method='post'>
	<label class='label'>아이디 </label>
	<input type='text' name='id'/><br/>
	<output name='idError' class='error'></output><br/><br/>
	
	<label class='label'>과목 </label>
	<input type='text' name='subject'/><br/>
	<output name='subjectError' class='error'></output><br/><br/>
	
	<label class='label'>날짜 </label>
	<input type='date' name='date'/><br/>
	<output name='dateError' class='error'></output><br/><br/>
	
	<label class='label'>성적 </label>
	<input type='number' name='score'/><br/>
	<output name='scoreError' class='error'></output><br/><br/>
	
	<input type='button' name='btnInput' value='성적입력' style="font-family: 'Do Hyeon', sans-serif;"/>
</form>
</div>
<script>yap()</script>
</body>
</html>