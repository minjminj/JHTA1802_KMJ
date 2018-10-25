<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zip_find</title>

<style>
</style>

<script>
	window.onload = function() {
		var fzi = document.fzi;
		fzi.ok.onclick = op;
		fzi.ok.ondobleclick = op;
			
			
	}
	
	function op() {
		var zna = document.getElementById('zna');
		var aaa = '';
		
		for (var k = 0; k < zna.options.length; k++) {
			if (zna.options[k].selected) {
				aaa = zna.options[k].value;
				break;
			}
		}
		
				alert(aaa);
		window.opener.document.fre.te.value = aaa;
		self.close();

	}	
</script>
</head>
<body>
	<h3>L I S T O F A D D R E S S</h3>
	<form name='fzi' method='post' action='register.jsp'>
		<div>
			<select id='zna' name='zna' size='5'>
				<option value='123-456 / 서울시 영등포구 양평동'>123-456 / 서울시 영등포구
					양평동</option>
				<option value='123-123 / 서울시 양천구 목동'>123-123 / 서울시 양천구 목동</option>
				<option value='123-777 / 서울시 민정구 민정동'>123-777 / 서울시 "민정"구
					"민정"동</option>
				<option value='965-456 / 서울시 락권구 민수동'>965-456 / 서울시 락권구 민수동</option>
				<option value='457-649 / 서울시 기성구 동기동'>457-649 / 서울시 기성구 동기동</option>
				<option value='597-518 / 서울시 광주구 민주화동'>597-518 / 서울시 광주구
					민주화동</option>
				<option value='841-544 / 서울시 봉기구 형민동'>841-544 / 서울시 봉기구 형민동</option>
				<option value='791-026 / 서울시 박정희구 규하동'>791-026 / 서울시 박정희구
					규하동</option>
				<option value='789-458 / 서울시 학원구 야자동'>789-458 / 서울시 학원구 야자동</option>
				<option value='333-777 / 서울시 낙원구 행복동'>333-777 / 서울시 낙원구 행복동</option>
			</select><br /> <input type='button' id='ok' name='ok'
				value='THAT IS MY ZIPCODE' />
		</div>
	</form>

</body>
</html>