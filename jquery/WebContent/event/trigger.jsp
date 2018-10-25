<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='trigger'>
	<input type='button' value='  i  ' id='btnInfo'class='btn'/>
	<div id='info'>
		trigger -> 오라클의 trigger와 같은 기능! 
	</div>
	<hr/>
	<input type='button' value='Trigger Test' id='btn'/>
	<p/>
	<div id='result'></div>
</div>
<script>
$(function(){
	var cnt = 0;
	/* 단순히 trigger만 적용해서는 실행되지 않는다.
	    반드시 이벤트에 대한 처리 내용이 있어야 한다. */
	$('#btn').click(function(){
		$('#trigger #result').html('버튼이 클릭되었습니다. ==> ' + (++cnt));

	});
	
	// info영역에 대해서 버튼이 클릭되면 보였다 안보였다 하게 만듦 ㅎㅎ
	$('#info').hide();
	$('#btnInfo').click(function(){
		$('#info').slideToggle();
	});
});
</script>
</body>
</html>