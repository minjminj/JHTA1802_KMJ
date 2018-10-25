<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_check2</title>

<script>
window.onload = function(){
	mm = document.frm;
		var getsubject = '' ;		// getsubject를 배열로 생성해서 저장해도 됨.
		mm.choose.onclick = function(){
			var sub = document.getElementById('sel');
			for (var k in sub.options){
				if (sub.options[k].selected){
					alert(sub.options[k].value + '를 저장')
					getsubject += sub.options[k].value + '  ';
					alert(getsubject + '가 선택되어 저장된 상태');
				}
			}
		}
		
	mm.btn.onclick = function(){
		
		var gethobby = '';
		for (var k in mm.chk){
			if (mm.chk[k].checked){
				gethobby += mm.chk[k].value + '  ';
			}
		}
		
		
		mm.te.value = '아이디: ' + mm.mid.value + '\n'
					+ '취미: ' + gethobby + '\n'
					+ '과목: ' + getsubject; 
	}
}
// function multisel(){
// 	var sub = document.getElementById('sel');
// 	for (var k in sub.options){
// 		if (sub.options[k].selected){
// 			getsubject += sub.options[k].value + '  ';
// 		}
// 	}
// }

</script>

</head>
<body>
<!-- 
text: 아이디

	/* white-sapce: pre-wrap; -> 2칸 이상의 공백이 있을때 공백으로 인정하고, 공간의 크기에 따라 내용물 wrap해주기.

checkbox: 취미(7개)
select: 과목(java, jsp, html, css, js, ajax, mybatis, jquery, spring, android)중 다중 선택
을 화면으로 입력받아 그 결과를 textarea에 출력 -->

<form name='frm' method='post'>
	<div>
		<label>아이디:</label>
		<input type='text' name='mid'>
	</div>
	<br/>
	<div>
		<label>취미: </label>					<!--  css에 vertical-align: top -->
		<label><input type='checkbox' name='chk' value='음감'>음감</label>
		<label><input type='checkbox' name='chk' value='자기'>자기</label>
		<label><input type='checkbox' name='chk' value='먹기'>먹기</label>
		<label><input type='checkbox' name='chk' value='TV시청'>TV시청</label><br/><br/>
		<label><input type='checkbox' name='chk' value='드라이브'>드라이브</label>
		<label><input type='checkbox' name='chk' value='야구경기시청'>야구경기시청</label>
		<label><input type='checkbox' name='chk' value='야구경기관람'>야구경기관람</label>
	</div>
	<br/>
	<div>
		<label>과목: </label>
		<select multiple='multiple' id='sel'size='8'>
			<option value='java'>java</option>
			<option value='jsp'>jsp</option>
			<option value='html'>html</option>
			<option value='css'>css</option>
			<option value='js'>js</option>
			<option value='ajax'>ajax</option>
			<option value='mybatis'>mybatis</option>
			<option value='jquery'>jquery</option>
			<option value='spring'>spring</option>
			<option value='android'>android</option>
		</select>
	</div>
	<br/>
	<div>
		<input type='button' name='choose' value='choose'>
		<input type='button' name='btn' value='입 to the 력'>
	</div>
	<br/>
	<div>
		<textarea name='te' rows='10' cols='40'></textarea>
	</div>
</form>
</body>
</html>