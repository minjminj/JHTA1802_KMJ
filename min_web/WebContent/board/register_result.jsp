<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 register_result</title>
</head>
<body>
${msg }


<div  class='animated fadeIn'>
	<form name='frmStore' method='post' action='list.do' >
		<input type='hidden' value='${param.nav }' name='nav'/>
		<input type='hidden' value='${param.sec }' name='sec'/>
		<input type='hidden' value='${findStr }' name='findStr'/>
		<input type='submit' value='목록' name='btnList' class='btn'/>
		<input type='hidden' name='nowPage' value='${nowPage }'/>
	</form>
</div>
</body>
</html>