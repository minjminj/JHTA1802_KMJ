<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>for1</title>
</head>
<body>

<h3>1) dan 변수에 임의의 값을 대입한 후 dan에 해당되는 구구단을 출력</h3>
<script>
var dan = 3;
var value = 0;

for (i=1 ; i<=9 ; i++){
	value = dan * i;
	document.writeln(dan + '*' + i + '=' + value)
}
</script>

<h3>2) start, end에 임의의 정수를 대입한 후 start~end까지의 합계를 출력</h3>
<script>
var start = 9;
var end = 78;
var sum = 0;

for (i=start ; i<=end ; i++){
	sum += i;
}
document.write(start + '~' + end + '까지의 합계: ' + sum);
</script>

<h3>3) start~end의 사이의 수 중 3,7의 공배수를 출력</h3>
<script>
var start = 9;
var end = 78;

for (i=start ; i<=end ; i++){
	if (i%3 == 0){
		if (i%7 == 0){
			document.writeln('3과 7의 공배수: ' + i + '<br>')
		}
	}
}
</script>

<h3>4) 1~100사이의 수 중 소수만을 출력</h3>
<script>
var count = 0;
for (var i=2 ; i<=100 ; i++){	// i는 피제수
	for (var a=2; a<=i-1 ; a++){	//a는 제수
		if(i%a == 0){
			count++;
		}
	}
	if (count == 0){
	document.writeln('소수: ' + i + '<br>')
	}
	count = 0;
}

</script>
</body>
</html>









