<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>array</title>
</head>
<body>
<script>
//JSON type
var mnt = ["백두산", "한라산", "금강산", "설악산", "치악산", "내장산"];
var river = ["한강", "금강", "낙동강", "두만강", "섬진강", "동강"];
var score = [90,30,70,50,130,10];
</script>

<h3>1) 배열 mnt를 "-"로 요소를 구분하여 출력</h3>
<script> document.write('산: ' +mnt.join('-')); </script>

<h3>2) 배열 mnt와 river를 붙여 새로운 배열을 만들고 내림차 정렬하여 출력</h3>
<script>
var mr = mnt.concat(river);
mr.sort();
document.write('산과 강: ' + mr.reverse());
</script>

<h3>3) findStr="금강산"이 저장되어 있다. mnt배열에서 몇번째인지를 찾아 출력</h3>
<script>
var findStr="금강산";
document.write(mnt.indexOf(findStr));
</script>

<h3>4) score에 있는 모든 성적을 사용하여 총점과 평균을 계산</h3>
<script>
var s = 0;
var a;
for (i=0 ; i<=score.length-1 ; i++){
	s += score[i];
}
a = s / score.length;
document.write('총점: ' + s + '<br/>');
document.write('평균: ' + a);	
</script>

<h3>5) score 배열의 값들 중 60점 이상인 점수의 갯수와 미만인 점수의 갯수를 각각 값들과 함께 출력</h3>
<script>
var cnt = 0;// 이상
var cou = 0;// 이하
var up = new Array();
var down = new Array();

for (i=0 ; i<=score.length-1 ; i++){
	if (score[i] >= 60){
		up[cnt] = score[i];
		cnt++;
	} else{
		down[cou] = score[i];
		cou++;
	}
}
document.write('60점 이상인 점수: ' + cnt + '개,   ' + up + '<br/>');
document.write('60점 미만인 점수: ' + cou + '개,   ' + down);
</script>

<h3>6) score를 내림차 정렬하여 출력</h3>
<script>
function num(a, b){
	return b - a;
}
document.write(score.sort(num));
</script>

<h3>7) 백두산-한강-90과 같이 같은 위치의 값이 서로 연관성이 있는 배열이라고 가정한다면 score가 60이상인 산이름과 강이름을 출력</h3>
<script>
for (var i=0 ; i<=score.length-1 ; i++){
	if (score[i] >= 60){
		document.writeln('산: ' + mnt[i]);
		document.write('강: ' + river[i] + '<br/>');
	}
}
</script>
</body>
</html>