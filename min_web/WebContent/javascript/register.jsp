<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>

<style>

</style>

<script>
window.onload = function(){
	var fre = document.fre;
	var win ='';
	fre.btn.onclick = function(){
		/*if (fre.z1.value == "" || fre.z2.value == ""){
			alert("우편번호를 똑바로 입력하거라");
		} else{
			fre.submit();
		} */
		//fre.submit();
		win = window.open('zip_find.jsp')
	}
}
</script>
</head>
<body>
<!-- 1) [우편번호]버튼을 클릭하면 zip_find.jsp 페이지를 사용한 새로운 창을 연다
	 2) zip_find.jsp에서는 select box를 사용하여 우편번호 / 주소를 나열한다.(우편번호와 주소는 임의로 나열)
	 3) zip_find.jsp에서 주소를 선택한 후 확인 버튼을 클릭하면
	 	-선택된 주소와 우편번호를 register.jsp에 전달하여 표시한 후 자기 자신은 닫는다.-->
<h3>Z I P C O D E</h3>
<form name='fre' method='post' action='zip_find.jsp'>
<wrap id='wp'>	 	
	<input type='text' id ='z1' name='z1' size='3' '/>
	-
	<input type='text' id ='z2' name='z2' size='3'/>
	<input type='button' id='btn' name='btn' value='ZIPCODE'/>
</wrap>
<br/>

<textarea id='te' name='te' rows='10' cols='30'></textarea>
</form>

</body>
</html>