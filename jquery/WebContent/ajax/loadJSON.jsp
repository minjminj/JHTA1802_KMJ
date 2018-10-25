<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#loadJSON .item {
	display: inline-block;
	width: 200px;
}
</style>
<script>
$().ready(function(){
	$('#loadJSON #btnLoad').click(function(){
		var findStr = $('#loadJSON #findStr').val();
		$.ajax({
			type: 'post',
			url: './ajax/emp_data.jsp',
			data: {'findStr':findStr, 'type':'json'},
			dataType: 'json',
			success: function(data){
				var str = '';
				var pos = 0;
				for (d=0 ; d<data.length ; d++){
					str += '<span class="item">' + data[d] + '</span>';
					pos++;
					if (pos % 3 == 0){
						console.log(pos + '!');
						str += '<br\/>';
					}
				}
				$('#loadJSON #result').html(str);
			}
		})
	})
});
</script>

</head>
<body>
<div id='loadJSON'>
	<h3>Load JSON</h3>
	<div id='info'>
		jQuery의 ajax를 통해 데이터를 JSON 타입으로 읽어들임.
	</div>
	
	<input type='text' value='m' id='findStr'/>
	<input type='button' value='LOAD JSON' id='btnLoad'/>
	<h3>Result</h3>
	<div id='result'></div> 
</div>
</body>
</html>