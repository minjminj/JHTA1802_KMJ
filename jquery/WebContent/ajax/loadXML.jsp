<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
<script>
$().ready(function(){
	$('#loadXML #btnLoad').click(function(){
		var findStr = $('#loadXML #findStr').val();
		$.ajax({
			type: 'post',
			url: './ajax/emp_data_xml.jsp',
			data: {'findStr':findStr},
			dataType: 'xml',
			success: function(data){
				var nodeList = $(data).find("employee");
				var str = "<table border='1' width='500px' cellspacing='0'>";
				$(nodeList).each(function() {
					var id = $(this).find("id").text();
					var fn = $(this).find("fn").text();
					var ph = $(this).find("ph").text();
					var sal = $(this).find("sal").text();
						str += "<tr>"
						+ "<td>" + id + "</td>"
						+ "<td>" + fn + "</td>"
						+ "<td>" + ph + "</td>"
						+ "<td>" + sal + "</td>"
						+ "</tr>"
				})
				str += '</table>',
				$('#loadXML #result').html(str);
			}
		});
	});
});
</script>

</head>
<body>
<div id='loadXML'>
	<h3>Load XML</h3>
	<div id='info'>
		jQuery의 ajax를 통해 데이터를 JSON 타입으로 읽어들임.
	</div>
	
	<input type='text' value='m' id='findStr'/>
	<input type='button' value='LOAD XML' id='btnLoad'/>
	<h3>Result</h3>
	<div id='result'></div> 
</div>
</body>
</html>