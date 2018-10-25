<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board의 view</title>

<script>
function match(){
	var ff = document.frmView;

	// 파일 미리보기
	 ff.file.onchange = function(){
		 var file = event.srcElement;	// 이벤트가 발생한 태그
		 var url = file.files[0];		// 선택된 이미지의 경로
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 ff.photo.src = e.target.result;
		 }
		 reader.readAsDataURL(url);
	 }
	/*목록 버튼 실행*/
	ff.btnList.onclick = function(){
		var ff2 = document.frmStore;
		/*hidden에 저장되어 있는 url값을 submit으로 정보를 이동하는 페이지에 전송*/
		ff2.method='post';
		ff2.sec.value= 'list.jsp';
		ff2.action = 'list.do';		// action을 새로 정의하지 않으면 현재페이지가 기본값.
		ff2.submit();
	}
	
	/*답글 버튼 실행*/
	ff.btnRep.onclick = function(){
		ff.action = 'rep.do';
		ff.submit();
	}

	/*수정 버튼 실행*/
	ff.btnModify.onclick = function(){
		var pwd = prompt('수정하시려면 암호를 입력하세요.');
		ff.pwd.value = pwd;
		ff.action = 'modifyR.do';
		ff.submit();
	}

	/*삭제 버튼 실행*/
	ff.btnDelete.onclick = function(){
		var pwd = prompt('삭제하시려면 암호를 입력하세요.');
		ff.pwd.value = pwd;
		ff.action = 'deleteR.do';
		ff.submit();
	}
	

}
</script>
</head>
<body>
<h3 class='title animated slideInLeft'>View Of Board</h3>
<div class='view animated fadeIn'>
	<form name='frmView' method='post' enctype="multipart/form-data">

		<label class='label'>NO </label>
		<input type='text' name='serial' size='5' readonly='readonly' value='${vo.serial}'/>
		
		<label class='label'>ID </label>
		<input type='text' name='id' size='10' readonly='readonly' value='${vo.id}'/><br/>
		
		<label class='label'>제목 </label>
		<input type='text' name='subject' value='${vo.subject}'/><br/>
		
		<label class='label'>내용 </label>
		<textarea name='doc' rows='10' cols='60'>${vo.doc}</textarea><br/>
		
		<label class='label'>비밀번호</label>
		<input type='text' name='pwd' value='비밀번호' onfocus='match()'/><br/>
		
		<div id='wpqkf'>
			<img src='../upload/${vo.fileOri}' name='photo'/><br/>
			<input type='file' name='file' id='file' size='9'/>
			<input type='hidden' name='aa' value='${vo.fileOri}'/>
			<input type='hidden' name='a1' value='${vo.attFile}'/>
		</div>
		
		<input type='hidden' value='${param.nav }' name='nav'/>
		<input type='hidden' value='${param.sec }' name='sec'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='serial' value='${param.serial }'/>
		
		<br/>
	
		<input type='button' value='목록' name='btnList' class='btn'/>
		<input type='button' value='답글' name='btnRep' class='btn'/>
		<c:if test="${vo.id eq MEMBERID }">
			<input type='button' value='수정' name='btnModify' class='btn'/>
			<input type='button' value='삭제' name='btnDelete' class='btn'/>
		</c:if>
	</form>
</div>

<form name='frmStore' method='post'>
<!-- 현재 페이지에서 저장되어야 하는 부분에 대하여, 페이지가 변경되도 값을 그대로 가져갈 수 있도록 hidden속에 값을 저장하는 보이지 않는 form -->
	<input type='hidden' value='${param.nav }' name='nav'/>
	<input type='hidden' value='${param.sec }' name='sec'/>
	<input type='hidden' value='${param.findStr }' name='findStr'/>
	<input type='hidden' name='nowPage' value='${param.nowPage }'/>
</form>
<script>match()</script>
</body>
</html>