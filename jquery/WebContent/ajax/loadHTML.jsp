<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$().ready(function(){
	$('#loadHTML #btnLoad').click(function(){
		var findStr = $('#loadHTML #findStr').val();
		$.ajax({
			type: 'post',
			url: './ajax/emp_data.jsp',
			data: {'findStr':findStr, 'type':'text'},
			dataType: 'html',
			success: function(data){
				data = data.trim();
				data = data.split('\n').join('<br/>');
				$('#loadHTML #result').html(data);
			}
		})
	})
});
</script>

</head>
<body>
<div id='loadHTML'>
	<h3>Load HTML</h3>
	<div id='info'>
		jQuery의 ajax를 통해 데이터를 HTML 타입으로 읽어들임.
	</div>
	
	<input type='text' value='m' id='findStr'/>
	<input type='button' value='LOAD HTML' id='btnLoad'/>
	<h3>Result</h3>
	<div id='result'></div> 
</div>
</body>
</html>