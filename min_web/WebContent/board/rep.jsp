<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 repl</title>
<script>
function check(){
var ff = document.frm_mem
	// 사진 미리보기
	ff.file.onchange = function(){
		 var file = event.srcElement;	// 이벤트가 발생한 태그
		 var url = file.files[0];		// 선택된 이미지의 경로
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 ff.attFile.src = e.target.result;
		 }
		 reader.readAsDataURL(url);
	}
}

function goBack(){
	var ff = document.frm_mem
	ff.action = 'list.do';
	ff.submit();
}
</script>
</head>
<body>
<h3 class='title animated slideInLeft'>Register Of Board</h3>

<div class='mem animated fadeInDown'>
<form name='frm_mem' method='post' enctype="multipart/form-data" action='registerR.do'>
	<label class='label'>아이디 </label>
	<c:choose>
	<c:when test="${MEMBERID != null}">
		<input type='text' name='id' value='${MEMBERID}' readonly='readonly'/><br/>
	</c:when>
	<c:otherwise>
		<input type='text' name='id'/><br/>
	</c:otherwise>
	</c:choose>
	<output name='idError' class='error'></output><br/><br/>
	
	<label class='label'>제목 </label>
	<input type='text' name='subject'/><br/>
	<output name='subjectError' class='error'></output><br/><br/>
	
	<label class='label'>내용 </label>
	<textarea  name='doc'></textarea>
	<output name='docError' class='error'></output><br/><br/>
	
	<label class='label'>비밀번호 </label>
	<input type='password' name='pwd'/><br/>
	<output name='pwdError' class='error'></output><br/><br/>
	
	<div id='forphoto'>
		<label calss='label'>사진</label><p/>
		<img src='http://placehold.it/100x130' name='attFile' width='100px' height='130px'/><br/>
		<input type='file' name='file' size='9'/><br/>
		<output name='attFileError' class='error'></output><br/><br/>
	</div>
	<input type='submit' name='btnRegister' class='btn' value='POST'/>
	<input type='button' name='btnCancle' class='btn' value='GoBack' onclick='goBack()'/>
	
	<input type='hidden' name='findStr' value='${param.findStr }'/>
	<input type='hidden' name='nav' value="${param.nav }" />
	<input type='hidden' name='sec' value="${param.sec }" />
	<input type='text' name='nowPage' value='${param.nowPage }'/>
</form>	
</div>
<script>check()</script>
</body>
</html>