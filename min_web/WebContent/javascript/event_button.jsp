<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event_button</title>
<script>
window.onload = function(mm){
	chkData();
	
	var btnSubmit = document.frm.btnSubmit;
	btnSubmit.onclick = function(){
		if(document.frm.mid.value == ""){
			alert("아이디를 입력하십숑");
		} else{
			document.frm.submit();
		}
	
		/*
		if (chkData(document.frm)){
			document.frm.sumbit();
		} else{
			alert("아이디를 입력하십숑")
		} 
		*/
	}
}

function chkData(){
	var mm = document.frm;	
	var mid = mm.mid.value;
 	if (mid == ""){
		alert("아이디를 입력하십숑");
		return false;
	} else{
		return true;
	}
}
</script>
</head>
<body>
<h3>event_button</h3>
<form name='frm' method='post' action='event_button_result.jsp'>
	<label>아이디	</label>
	<input type='text' name='mid' size='20' value='kim'/>
	<br/>
	<input type='submit' name='btn' value='Submit>_<'/>
	<input type='button' name='btnSubmit' value='Submitttt'/>
</form>

</body>
</html>