<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fun_self</title>
<script>
function sum(a, b){
	if (a == null) a = 0;
	if (b == null) b = 0;
	
	var r = a + b;
	return r;
}

function main(){
	
	document.write('<li>sum()= ' + sum());
	document.write('<li>sum(10)= ' + sum(10));
	document.write('<li>sum(10,20)= ' + sum(10,20));
	document.write('<li>sum(30,40,50)= ' + sum(30,40,50));
}
</script>
</head>
<body onload='main()'>

</body>
</html>