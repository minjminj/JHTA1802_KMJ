<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#findZone {
	overflow: hidden;
}

#findZone div {
	display: inline-block;
	width: 250px;
	float: left;
}
</style>
<script>
$().ready(function(){
	// json type의 데이터를 db에서 가져와 자동완성 기능 실행
	$('#findJson').keypress(function(){
		var v = $(this).val();
		$('#findJson').autocomplete({
			source: './widget/emp_data.jsp?type=json&findStr=' + v,
			minLength: 1
		});
	});
	
	// text type의 데이터 유형
// 	$('#findText').keypress(function(){
// 		var v = $(this).val();
// 		$(this).autocomplete({
// 			source: function(req, resp){
// 				$.ajax({
// 					type: 'post',
// 					url:  './widget/emp_data.jsp',
// 					data: {'type':'text', 'findStr':v},
// 					dataType: 'html',
// 					success: function(data){
// 						$('#autocomplete #result').html(data);
// 					}
// 				});
// 			},
// 			minLength: 1
// 		});
// 	});
	
	// ajax를 사용해서 autocomplete에 적용
	$('#findText').keypress(function(){
		var v = $(this).val();
		$.ajax({
			type: 'post',
			url:  './widget/emp_data.jsp',
			data: {'type':'json', 'findStr':v},
			dataType: 'json',
			success: function(data){
				$('#findText').autocomplete({
					source: data,
					minLength: 1
				});
			}	
		});
	});
});
</script>
</head>
<body>
<div id='autocomplete'>
	<h3>Autocomplete</h3>
	<div id='info'>
		jQuery로 만든 자동 완성기능<br/>
		데이터 유형: json, text
	</div>
	<p/>
	<div id='findZone'>
		<div id='auto_json'>
			<label>JSON </label>
			<input type='text' value=''	id='findJson'/>
		</div>
		<div id='auto_text'>
			<label>Text</label>
			<input type='text' value=''	id='findText'/>	
		</div>
	</div>
	<p/>
	
	<b>result</b><br/>
	<div id='result'></div>
</div>
</body>
</html>