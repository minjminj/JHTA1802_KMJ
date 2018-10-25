<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reset</title>
<script>
function fun(ff)
{
 if(ff.irum.value =="") return true;
 else					 return false;
}
</script>

</head>
<body>
<h3>이름 항목에 값이 있으면 리셋버튼의 기능 중지</h3>
<form onreset='reset fun(this)'>
Name <input type='text' name='na' value=''><br/>
Address <input type='text' name='ar' value=''><br/>
<input type='reset' value='다시'>
</form>
</body>
</html>