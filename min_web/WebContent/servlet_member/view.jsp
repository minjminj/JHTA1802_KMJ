<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet view한건의 데이터 상세보기</title>

<script>
function list(){
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
	
	/*수정 버튼 실행*/
	ff.btnModify.onclick = function(){
		 
		
		ff.sec.value = './modify.jsp';
		ff.action = 'modify.hta';
		ff.submit();
	}

	/*삭제 버튼 실행*/
	ff.btnDelete.onclick = function(){
		var pwd = prompt('삭제하시려면 암호를 입력하세요.');
		ff.pwd.value = pwd;
		ff.sec.value = 'delete.jsp';
		ff.action = 'delete.hta';
		ff.submit();
	}
	
	/*목록 버튼 실행*/
	ff.btnList.onclick = function(){
		var ff2 = document.frmStore;
		/*hidden에 저장되어 있는 url값을 submit으로 정보를 이동하는 페이지에 전송*/
		ff2.method='post';
		ff2.sec.value='list.jsp';
		ff2.action = 'list.hta';		// action을 새로 정의하지 않으면 현재페이지가 기본값.
		ff2.submit();
	}
}

</script>

<style>
.vla{
		display: inline-block;
		width: 80px;
	}
	
#wpqkf {
    position: absolute;
    top: 4px;
    left: 305px;

}
</style>
</head>
<body>
<h3 id='viewmem' class='animated slideInLeft'>상세보기</h3>

<div id='view' class='animated fadeIn'>
	<form name='frmView' method='post' enctype="multipart/form-data">

		<label class='vla'>ID </label>
		<input type='text' name='id' readonly='readonly' value='${vo.id}'/><br/>
		
		<label class='vla'>NAME	 </label>
		<input type='text' name='name' value='${vo.name}'/><br/>
		
		<label class='vla'>PASSWORD </label>
		<input type='text' name='pwd' value='비밀번호'/><br/>
		
		<label class='vla'>EMAIL </label>
		<input type='text' name='email' value='${vo.email}'/><br/>
		
		<label class='vla'>PHONE </label>
		<input type='text' name='phone' value='${vo.phone}'/><br/>
		
		<label class='vla'>POST </label>
		<input type='text' name='post' value='${vo.post}'/><br/>
		
		<label class='vla'>ADDRESS </label>
		<input type='text' name='ar' value='${vo.ar}'/><br/>
		
		<label class='vla'>RDATE </label>
		<input type='date' name='rdate' value='${vo.rdate}'/><br/>
		
		<div id='wpqkf'>
			<img src='../upload/${vo.photO}' name='photo'/><br/>
			<input type='file' name='file' id='file' size='9'/>
			<input type='hidden' name='aa' value='${vo.photO}'/>
			<input type='hidden' name='a1' value='${vo.photo}'/>
		</div>
		
		<input type='hidden' value='${param.nav }' name='nav'/>
		<input type='hidden' value='${param.sec }' name='sec'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		
		<br/>
		<input type='button' value='수정' name='btnModify' class='btn'/>
		<input type='button' value='삭제' name='btnDelete' class='btn'/>
		<input type='button' value='목록' name='btnList' class='btn'/>
	</form>
</div>

<form name='frmStore' method='post'>
<!-- 현재 페이지에서 저장되어야 하는 부분에 대하여, 페이지가 변경되도 값을 그대로 가져갈 수 있도록 hidden속에 값을 저장하는 보이지 않는 form -->
	<input type='hidden' value='${param.nav }' name='nav'/>
	<input type='hidden' value='${param.sec }' name='sec'/>
	<input type='hidden' value='${param.findStr }' name='findStr'/>
	<input type='hidden' name='nowPage' value='${param.nowPage }'/>
</form>
<script>list();</script>
</body>
</html>