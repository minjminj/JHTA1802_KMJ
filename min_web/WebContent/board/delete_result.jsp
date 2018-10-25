<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 delete_result</title>
</head>
<body>
<h3 class='deletemem animated slideInLeft'>회원 정보 삭제 결과</h3>

<p/>
${msg }
<p/>



<div class='dele animated fadeIn' >
	<form name='frmStore' method='post' action='list.do'>
		<input type='hidden' value='${param.nav }' name='nav'/>
		<input type='hidden' value='${param.sec }' name='sec'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='submit' value='목록' name='btnList' class='btn'/>
		<input type='hidden' name='nowPage' value='${nowPage }'/>
	</form>
</div>

</body>
</html>