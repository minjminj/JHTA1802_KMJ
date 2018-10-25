<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fun_numberic</title>
</head>
<body>

<h1>숫자형 함수</h1>
<h3>1) str = '1010'의 값을 2진수, 8진수, 16진수일때 그 값을 10진수로 표시</h3>
<script>
var str = '1010';
document.write('str이 2진수 일때: ' + parseInt(str,2) + '<br/>');
document.write('str이 8진수 일때: ' + parseInt(str ,8) + '<br/>');
document.write('str이 16진수 일때: ' + parseInt(str,16));
</script>

<h3>2) su1 = '10', su2 = '20'이 지정되어 있다. su1, su2를 산술적으로 더한 값을 출력</h3>
<script> 
var su1 = '10';
var su2 = '20';
var s1 = parseInt(su1);
var s2 = parseInt(su2);
document.write(s1 + s2);
</script>

<h3>3) str에 임의의 값을 대입한 후 숫자형의 값이 아니라면 '계산불가'를 출력</h3>
<script>
var str = '안녕';
if (isNaN(str)){
	document.write('계산불가')
}
</script>

<h3>4) 방정식이 y='x*2 + 1'과 같이 문자열로 지정되어 있다. x값이 1~10일 때 모든 해(eval사용)</h3>
<script>
var y = 0;
for (x=1 ; x<=10 ; x++){
	y = eval('x*2 + 1');
	document.write('x가 ' + x + '일때의 해: ' + y + '<br/>');
}
</script>

<h3>5) jumi = '910223-1234567'일 때 생년, 생월, 생일 성별을 분리하여 출력(단, 성별은 여자 또는 남자로 표시)</h3>
<script>
var jumi = '910223-1234567';
var yy = jumi.substr(0, 2);
var mm = jumi.substr(2, 2);
var dd = jumi.substr(4, 2);
var gg = jumi.charAt(7);
var se = '';

if (gg == 2){se = '여자';} else{se = '남자';}

document.write('생년: ' + yy + '<br/>');
document.write('생월: ' + mm + '<br/>');
document.write('생일: ' + dd + '<br/>');
document.write('성별: ' + se);

</script>

<h3>6) su = '10,20,30,40,50'가 대입되어 있다. 정수로 바꾸어 합계와 평균을 출력</h3>
<script>
var su ='10,20,30,40,50'
var a = 0;
var sum = 0;
var avg = 0;

var re = su.split(',');
for (var i=0 ; i<=re.length-1 ; i++){
	a = re[i];
	sum += parseInt(a); // or parseInt(a, 10) or Number(a)
	a = 0;
}
avg = sum / re.length;
document.writeln('sum= ' + sum);
document.write('avg= ' + avg);
</script>



<h3>7) data = 'hipwg@naver.com' 이메일 주소를 사용하여 아이디와 사이트 주소를 분리하여 출력</h3>
<script>
var data = 'hipwg@naver.com';
var a = data.substr(0, data.indexOf('@'));
var b = data.substr(data.indexOf('@')+1);

document.write('아이디: ' + a + '<br/>');
document.write('사이트 주소: ' + b);
</script>

</body>
</html>