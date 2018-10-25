<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2222222</title>

<script>
window.onload=function(){
	mm = document.frm;
	mm.btn.onclick = cal; // cal()로 쓰면 함수의 실행 결과를 가져와라. 는 의미가 됨. 그냥 cal만 써야 함수 내용이 실행됨.
	}
	
function cal(){
	mm.gr.style.backgroundColor = '#ffffff';
	mm.gg.value = '입력 값을 확인하세요';
	
	if(isNaN(mm.gr.kor.value) || mm.gr.kor.value == '' || mm.gr.kor.value >100 || mm.gr.kor.value <0){
		mm.kor.focus();
		mm.kor.style.backgroundColor = '#ffdddd';
		return;
	}
	
	if(isNaN(mm.gr.eng.value) || mm.gr.eng.value == '' || mm.gr.eng.value >100 || mm.gr.eng.value <0){
		mm.eng.focus();
		mm.eng.style.backgroundColor = '#ffdddd';
		return;
	}
	
	if(isNaN(mm.gr.mat.value) || mm.gr.mat.value == '' || mm.gr.mat.value >100 || mm.gr.mat.value <0){
		mm.mat.focus();
		mm.mat.style.backgroundColor = '#ffdddd';
		return;
	}

	var kor = Number(mm.gr.kor.value);
	var eng = Number(mm.gr.eng.value);
	var mat = Number(mm.gr.mat.value);
	
	mm.gg.sum.value = kor+eng+mat;
	mm.gg.avg.value = (Number(mm.gg.sum.value)/3).toFixed();

}

</script>

</head>
<body>
<h3>국어, 영어, 수학 점수를 text 상자로 입력받아 총점, 평균을 계산하여 각각 text 상자에 표시</h3>
<form name='frm' method='post'>
	<label>국어  </label>
	<input calss='gr' type='text' name='kor' value='90'><br/>
	<label>영어  </label>
	<input calss='gr' type='text' name='eng' value='90'><br/>
	<label>수학  </label>
	<input calss='gr' type='text' name='mat' value='90'><br/>
	<hr/>
	<label>총점  </label>
	<input class='gg' type='text' name='sum'><br/>
	<label>평균  </label>
	<input class='gg' type='text' name='avg'><br/>
	
	<br/>
	<input type='button' name='btn' value='Calculate'>
</form>
</body>
</html>