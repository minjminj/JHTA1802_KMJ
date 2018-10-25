<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>if</title>
</head>
<body>

<h3>1) 변수 a에 임의의 값을 대입한 후 a>60이면 "pass"를 그렇지 않으면 "fail"을 출력</h3>
<script type="text/javascript">
a = 80;
if (a>60){
	document.write("pass")
} else {
	document.write("fail")
}
</script>

<h3>2) 변수 kor, eng, mat에 성적을 대입한 후 학점을 A~F까지 구하여 성적, 총점, 평균, 학점을 출력</h3>
<script>
var kor = 95;
var eng = 89;
var mat = 93;

var tot = kor + eng + mat;
var avg = tot / 3;
var grade = "F";

if (avg>=90){
	grade = "A"
} else if (avg >= 80){
	grade = "B"
} else if (avg >= 70){
	grade = "C"
} else if (avg >= 60){
	grade =  "D"
} else {
	grade = "F"
}

document.write("<li>kor: " + kor);
document.write("<li>eng: " + eng);
document.write("<li>mat: " + mat);
document.write("<li>tot: " + tot);
document.write("<li>avg: " + avg);
document.write("<li>grade: " + grade);
</script>

<h3>3) 키, 몸무게를 임의의 변수에 입력하고 키가 120 미만이거나, 몸무게가 40kg이하이면 "탑승불가" 아니면 "탑승가능"을 출력</h3>
<script>
height = 193;
weight = 30;

if (height < 120 || weight <= 40){
	document.write("탑승불가")
} else{
	document.write("탑승가능")
}
</script>

</body>
</html>