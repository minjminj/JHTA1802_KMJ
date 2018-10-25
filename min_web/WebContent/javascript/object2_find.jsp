<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>object2_find</title>
<link rel='stylesheet' type='text/css' href='object2_find_css.css'>
<link href="https://fonts.googleapis.com/css?family=Eater|Gaegu" rel="stylesheet">

<script>
function $(id){
	return document.getElementById(id);
}

var data;
var ff;
window.onload = function(){
	ff = document.frm;
	ff.btnFind.onclick = funcFind;
 	ff.btnModify.onclick = funcModify;
	ff.btnDelete.onclick = funcDelete; 
	ff.btnClose.onclick = function(){
		self.close();
	};
	
}

function funcFind(){
	data = opener.data;
	var no = ff.no.value;
	for (var i=0 ; i<ff.hobby.length ; i++)  ff.hobby[i].checked = false;
	for (var i=0 ; i<ff.subject.length ; i++)  ff.subject[i].selected = false;
	for (var i=0 ; i<data.length ; i++){
		if (data[i].no == no){
			// color 값 가져오기
			ff.color.value = data[i].color;
			
			// skill(radio) 값 가져오기
 			for (var k=0 ; k<ff.jskill.length ; k++){
				for (var j=0 ; j<data[i].jskill.length ; j++){
					if (ff.jskill[k].value == data[i].jskill){
						 ff.jskill[k].checked = true;
					}
				}
			}
			// hobby (checkbox) 값 가져오기
			for (var k=0 ; k<ff.hobby.length ; k++) {
	               for (var j = 0; j<data[i].hobby.length; j++) {
	                  if (ff.hobby[k].value == data[i].hobby[j]) {
	                     ff.hobby[k].checked = true;
	                  }
	               }
	            }
// 			// subject (select) 값 가져오기
			for (var k=0 ; k<ff.subject.length ; k++) {
	               for (var j = 0; j<data[i].subject.length; j++) {
	                  if (ff.subject.options[k].value == data[i].subject[j]) {
	                     ff.subject[k].selected = true;
	                  }
	               }
	            }
	 /*향포버전
            for(var j in ff.subject.options){
                for(var k in data[i].subject){
                   if(ff.subject.options[j].value == data[i].subject[k]){
                      ff.subject[j].selected = true;
                      // value를 가져오는 것이 아닐때는 options가 생략되어도 괜찮다.
                   }
                }
             }
			*/

		}
	}
}

function funcModify(){
	var ff = document.frm;
	var dd = opener.setData(ff);
	var no = ff.no.value;
	 //변경하려면.....
	for (var i=0 ; i<data.length ; i++){
		if (data[i].no == no){
			data[i] = dd;
			
			alert(data[i].hobby);
			alert("무사히 변경되었단다");
		}
	}
}
function funcDelete(){
	
	var yn = confirm('Do you want to exactly delete?')
	if (yn){
		var ff = document.frm;
		var no = ff.no.value;
		 //변경하려면.....
		for (var i=0 ; i<data.length ; i++){
			if (data[i].no == no){
				data.splice(i, 1);
				no = '';
				alert("실행됨...........ㅠㅠ");
			}
		}
	}
}  

function skill(){
	var a = [];
	for (var k=0 ; k<ff.jskill.length ; k++){
		if (ff.jskill[k].checked){
			a.push(ff.jskill[k].value);
			break;
		}
	}
	return a;
}
function hob(){
	var a = [];
	for (var k=0 ; k<ff.hobby.length ; k++){
		if (ff.hobby[k].checked){
			a.push(ff.hobby[k].value);
		}
	}
	return a;
}

function sub(){
	var a = [];
	var subject = $('subject');
	for (var k=0 ; k<ff.subject.options.length ; k++){
		if (ff.subject.options[k].selected){
			a.push(ff.subject.options[k].value);
		}
	}
	return a;
}

</script>
</head>
<body>
<h3 id='title'>
	Object객체를 사용하거나 function을 객체로 사용하는 경우
</h3>
<form name='frm' method="post">
	<label class='la'>NO </label>
	<input type='number' name='no' min='1' max='1000'/>
	<input type='button' name='btnFind' value='검색'/><br/>
	<label class='la'>좋아하는 색상</label>
	<input type='color' name='color'/><br/>
	<label class='la'>자바스킬</label>
	<label><input type='radio' name='jskill' value='상'/>상</label>
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
		<select multiple='multiple' name='subject'>
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
				<option value='mabatis'>mybatis</option>
				<option value='spring'>spring</option>
			</optgroup>
		</select>
	</div><br/>
	<div id='btn'>
		<input type='button' value='수정' name='btnModify'/>
		<input type='button' value='삭제' name='btnDelete'/>
		<input type='button' value='닫기' name='btnClose'/>
	</div>
</form>
<p/>
<div id='result'></div>
</body>
</html>