<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>object2</title>
<link rel='stylesheet' type='text/css' href='object2_css.css'>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">

<script>
/*
 * [공통] 1. 입력받은 내용을 사용하여 하나의 객체에 저장한 후 저장된 객체는 배열을 사용하여 관리.
 	[추가] 1. 취미나 수강과목은 반드시 하나 이상을 선택
 		2. no는 반드시 1~1000사이의 번호이여야 함.
 		3. 입력 내용을 하나의 객체에 저장 한 후 배열에 저장
 	[검색] 1. 검생에 필요한 화면을 갖는 새로운 창을 open
 		2. 검색창에는 검색,수정,삭제 버튼을 추가하여 관련 내용을 처리 (배열에 저장된 값을 수정, 삭제)
 	[출력] 1. 배열에 저장된 값을 result영역에 출력
 */
 
function $(id){
	return document.getElementById(id);
}

	var data = new Array(); // var data = [];와 같음.

// 클래스 생성
function Data(no, color, jskill, hobby, subject){	// 객체에 여러개 값을 저장해야하므로, 리터럴 타입이 아닌 객체 생성.
	this.no = no;
	this.color = color;
	this.jskill = jskill;
	this.hobby = hobby;
	this.subject = subject;
	this.toString = function(){
		var str = '<tr>' /* 행 생성 */
				+ '<td>' + this.no + '</td>'
				+ '<td>' + this.color + '</td>'
				+ '<td>' + this.jskill + '</td>'
				+ '<td>' + this.hobby + '</td>'
				+ '<td>' + this.subject + '</td>'
				+ '</tr>';
		return str;
	}
 }
function setData(ff){
	var no = ff.no.value;
	var color = ff.color.value;
	
	var jskill = skill(ff);
	
	var hobby = hob(ff);
	var subject = sub(ff);
		
	var d = new Data(no, color, jskill, hobby, subject);
	return d;
}

window.onload = function(){	
	ff = document.frm;
	
	ff.btnInput.onclick = funcInput;
	
	ff.btnFind.onclick = function(ev){
		win = window.open('object2_find.jsp', 'win', 'width=800,height=800');		
		ev.moveTo('screenX+50,screenY+20');
	};
	
	ff.btnOutput.onclick = funcOutput;
}

function funcInput(){
	var ff = document.frm;
	var d = setData(ff);
	
// 	if (no == '' || no<1 || no>1000){
// 		alert('no를 확인해주세요');
// 	} else if(hobby == ''){
// 		alert('취미 선택을 확인해주세요');
// 	} else if(subject == ''){
// 		alert('과목 선택을 확인해주세요');
// 	} else {	
		//var d = new Data(no, color, jskill, hobby, subject);
		data.push(d);	// 배열 끝에 데이터를 추가	
		$('result').innerHTML = data.length + '개가 저장됨';
// 	}
}

function funcOutput(){
	var str = '<table border=1>'
			+ '<tr>'
			+ '<th>No</th><th>Color</th><th>Skill</th>'
			+ '<th>Hobby</th><th>Subject</th>'
			+ '</tr>';
	for (i=0 ; i<data.length ; i++){
		str += data[i].toString();
	}
	str += '</table>';
	
	$('result').innerHTML = str;
}

function skill(ff){
	var a = [];
	for (var k=0 ; k<ff.jskill.length ; k++){
		if (ff.jskill[k].checked){
			a.push(ff.jskill[k].value);
			break;
		}
	}
	return a;
}
function hob(ff){
	var a = [];
	for (var k=0 ; k<ff.hobby.length ; k++){
		if (ff.hobby[k].checked){
			a.push(ff.hobby[k].value);
		}
	}
	return a;
}

function sub(ff){
	var a = [];
	var subject = $('subject');
	for (var k=0 ; k<ff.subject.options.length ; k++){
		if (ff.subject.options[k].selected){
			a.push(ff.subject.options[k].value);
		}
	}
	return a;
}




// 리터럴로 input
// function(){
// 		var r = $('result');
// 		var o = {};
// 		o.no = ff.no.value;
// 		alert(o.no);
// 		o.color = ff.color.value;
// 		alert(o.color);
// 		o.jskill = skill();
// 		alert(o.jskill);
// 		o.hobby = hob();
// 		alert(o.hobby);
// 		o.subject = sub();
// 		alert(o.subject);
		
// 		//
		
// 		r.innerHTML = o.no  +' ' + o.color +' ' + o.jskill +' ' + o.hobby + ' ' + o.subject; ;
		
// 	};
 
</script>
</head>
<body>
<h3 id='title'>
	Object객체를 사용하거나 function을 객체로 사용하는 경우
</h3>
<form name='frm' method="post">
	<label class='la'>NO </label>
	<input type='number' name='no' min='1' max='1000'/><br/>
	<label class='la'>좋아하는 색상</label>
	<input type='color' name='color'/><br/>
	<label class='la'>자바스킬</label>
	<label><input type='radio' name='jskill' checked value='상'/>상</label>
	<label><input type='radio' name='jskill' value='중'/>중</label>
	<label><input type='radio' name='jskill' value='하'/>하</label>
	<br/>
	<label class='la'>취미</label>
	<label><input type='checkbox' name='hobby' value='농구관람'>농구관람</label>
	<label><input type='checkbox' name='hobby' value='야구관람'>야구관람</label>
	<label><input type='checkbox' name='hobby' value='먹고자기'>먹고자기</label>
	<label><input type='checkbox' name='hobby' value='자고먹기'>자고먹기</label>
	<label><input type='checkbox' name='hobby' value='고기먹기'>고기먹기</label>
	<br/>
	<div id='subject'>
		<label class='la'>수강과목</label>
		<select multiple='multiple' name='subject' id='subject'>
			<optgroup label='Application'>
				<option value='JAVA'>JAVA</option>
				<option vlaue='Android'>Android</option>
				<option vlaue='C++'>C++</option>
			</optgroup>
			
			<optgroup label='Web'>
				<option value='html'>html</option>
				<option value='css'>css</option>
				<option value='javascript'>javascript</option>
				<option value='jsp'>jsp</option>
				<option value='php'>php</option>
				<option value='asp'>asp</option>
			</optgroup>
			
			<optgroup label='Framework'>
				<option value='jQuery'>jQuery</option>
				<option value='ajax'>ajax</option>
				<option value='mabatis'>mabatis</option>
				<option value='spring'>spring</option>
			</optgroup>
		</select>
	</div><br/>
	<div id='btn'>
		<input type='button' value='추가' name='btnInput'/>
		<input type='button' value='검색' name='btnFind'/>
		<input type='button' value='출력' name='btnOutput'/>
	</div>
</form>
<p/>
<div id='result'></div>
</body>
</html>