<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>methodType_test</title>
</head>
<body>
<h3>doGet() / doPost() Test</h3>
<form name='frm' action='member.hta'>
	<label>METHOD TYPE</label><p/>
	
	<label>ID </label>
	<input type='text' name='id' value='kim'/><br/>
	
	<label>Password</label>
	<input type='password' name='pwd' value='1111'/><p/>
	
	<input type='button' name='btnGet' value='GET'/>
	<input type='button' name='btnPost' value='POST'/>
</form>

<h3>RESULT</h3>
<li>${id }</li>
<li>${pwd }</li>

<script>
var ff = document.frm;
ff.btnGet.onclick = function(){
	ff.method='get';
	ff.submit();
}

ff.btnPost.onclick = function(){
	ff.method='post';
	ff.submit();
}
</script>
</body>
</html>