<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>switch</title>
</head>
<body>

<h3>kor, eng, mat에 성적을 대입한 후 학점을 A~F까지 구하여 성적, 총점, 평균, 학점 출력</h3>
<script>
var kor = 95;
var eng = 89;
var mat = 93;

var tot = kor + eng + mat;
var avg = tot / 3;
var grade = 'F';

var sw =  math.floor(avg);

switch(sw){
case 10:
case 9:
	grade = 'A';
	break;
case 8: grade = 'B';
 	break;
case 7: grade = 'C';
	break;
case 6: grade = 'D';
	break;
}

documtet.write(sw);
document.write('<li>kor: '+ kor);
document.write('<li>eng: '+ eng);
document.write('<li>mat: '+ mat);
document.write('<li>tot: '+ tot);
document.write('<li>avg: '+ avg);
document.write('<li>grade: '+ grade);



</script>

</body>
</html>