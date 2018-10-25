<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_check3</title>

<script>
window.onload = function(){
	mm = document.frm;
	mm.btn.onclick = function(){
		
		var member = '';
		for (var k in mm.mem){
			if (mm.mem[k].checked){
				member = mm.mem[k].value;
				break;
			}
		}
		
		var gethobby = '';
		for (var k in mm.chk){
			if (mm.chk[k].checked){
				gethobby += mm.chk[k].value + '  ';
			}
		}
		
		var getgrade = '';
		for (var k in mm.grade){
			if (mm.grade[k].checked){
				getgrade = mm.grade[k].value + '  ';
				break;
			}
		}
		
	
		mm.te.value = '아이디: ' + mm.mid.value + '\n'
					+ '회원구분: ' + member + '\n'
					+ '취미: ' + gethobby + '\n'
					+ '매출액: ' + mm.income.value + '\n'
					+ '등급: ' + getgrade; 
	}
}

function come(){
	
	if (mm.income.value >= 10000){
		mm.grade[0].checked = true;
	} else if (mm.income.value >= 5000){
		mm.grade[1].checked = true;
	} else if (mm.income.value >= 1000){
		mm.grade[2].checked = true;
	} else {
		mm.grade[3].checked = true;
	}
}
</script>

</head>
<body>
<!-- 
text: 아이디
radio: 구분(회원,비회원)
checkbox: 취미(7개)
radio: 등급(a b c d)를 화면에서 입력받아 그 결과를 textarea에 출력
단, 등급은 매출액이 10000이상이면 a, 5000이상이면 b, 1000이상이면 c, 그 이하는 d로 자동표시 -->

<form name='frm' method='post'>
	<label>아이디: </label>
	<input type='text' name='mid'><br/><br/>
	
	<label>회원구분: </label>
	<label><input type='radio' name='mem' value='회원'>회원</label>
	<label><input type='radio' name='mem' value='비회원'>비회원</label><br/><br/>
	
	<label>취미: </label>
	<label><input type='checkbox' name='chk' value='음감'>음감</label>
	<label><input type='checkbox' name='chk' value='자기'>자기</label>
	<label><input type='checkbox' name='chk' value='먹기'>먹기</label>
	<label><input type='checkbox' name='chk' value='TV시청'>TV시청</label><br/><br/>
	<label><input type='checkbox' name='chk' value='드라이브'>드라이브</label>
	<label><input type='checkbox' name='chk' value='야구경기시청'>야구경기시청</label>
	<label><input type='checkbox' name='chk' value='야구경기관람'>야구경기관람</label><br/><br/>
	
	<label>매출액: </label>
	<input type='text' name='income' onkeyup='come()'>
	<input type='button' name='come_btn' value='매출액 입력' onClick='come()'><br/><br/>
	
	<label>등급: </label>
	<label><input type='radio' name='grade' value='A' disabled>A</label>
	<label><input type='radio' name='grade' value='B' disabled>B</label>
	<label><input type='radio' name='grade' value='C' disabled>C</label>
	<label><input type='radio' name='grade' value='D' disabled>D</label><br/><br/>
	
	<input type='button' name='btn' value='최종 입력'><br/><br/>
	
	<textarea name='te' rows="10" cols="40"></textarea>

</form>
</body>
</html>