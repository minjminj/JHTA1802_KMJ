<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>servlet Register</title>
<script>
function check(){ 
	 fm = document.frm_mem;
	 
	 // 파일 미리보기
	 fm.file.onchange = function(){
		 var file = event.srcElement;	// 이벤트가 발생한 태그
		 var url = file.files[0];		// 선택된 이미지의 경로
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 fm.photo.src = e.target.result;
		 }
		 reader.readAsDataURL(url);
	 }
	 
		
	fm.btnRegister.onclick = function() {
 		/*버튼을 누를때 바탕색의 기본값을 지정, 그렇지 않으면 버튼을 두세번 누를때 오류결과가 리셋되지 않음.*/
		fm.id.style.backgroundColor = '#ffffff';
		fm.name.style.backgroundColor = '#ffffff';
		fm.phone.style.backgroundColor = '#ffffff';
		fm.pwd.style.backgroundColor = '#ffffff';
		fm.post.style.backgroundColor = '#ffffff';
		fm.ar.style.backgroundColor = '#ffffff';
		fm.email.style.backgroundColor = '#ffffff';
		
		/*버튼을 누를때 에러메시지의 기본값을 지정, 그렇지 않으면 버튼을 두세번 누를때 오류결과가 리셋되지 않음.*/
		fm.idError.value = "";
		fm.nameError.value = "";
		fm.phoneError.value = "";
		fm.pwdError.value = "";
		fm.postError.value = "";
		fm.arError.value = "";
		fm.emailError.value = "";
		
		
	
		if (!val(/^[a-z0-9]{6,12}$/g, fm.id)){	/*6-12자의 영소문자만*/
			return;
		} else if (!val(/^[가-힝A-Za-z]{2,}$/g, fm.name)){	/*2자 이상의 영문자와 한글만*/
			return;	
		} else if (!val(/^[0-9]{4,20}$/, fm.pwd)){ /*영_숫자 특수문자 */
			return;	
		} else if (!val(/^[a-z\d]{4,}\@[a-z]{4,}\.[a-z]{3,}$/, fm.email)){   /*연락처 맞춰서 수정*/
			return;	
		} else {
			if (fm.id.value.trim() == ""){
				fm.id.focus();
				fm.id.style.backgroundColor = '#FC9D9A';
 				fm.idError.value = '아이디를 확인해주세요';
			} else if (fm.name.value.trim() == ""){
				fm.name.focus();
				fm.name.style.backgroundColor = '#FC9D9A';
				fm.nameError.value = '이름을 확인해주세요';
			}  else if (fm.phone.value.trim() == ""){
				fm.phone.focus();
				fm.phone.style.backgroundColor = '#FC9D9A';
				fm.phoneError.value = '연락처를 확인해주세요';
			} else if (fm.post.value.trim() == ""){
				fm.post.focus();
				fm.post.style.backgroundColor = '#FC9D9A';
				fm.postError.value = '우편번호를 확인해주세요';
			} else if (fm.ar.value.trim() == ""){
				fm.ar.focus();
				fm.ar.style.backgroundColor = '#FC9D9A';
				fm.arError.value = '주소를 확인해주세요';
			} else if (fm.email.value.trim() == ""){
				fm.email.focus();
				fm.email.style.backgroundColor = '#FC9D9A';
				fm.emailError.value = '이메일을 확인해주세요';
			} else {
			
			fm.action = 'registerR.hta';
			fm.submit();
			}
 		}
	}
}

function val(re, e){
	if (re.test(e.value)){
		return true;
	} else {	
		e.focus();
		e.value = "";
		e.style.backgroundColor = '#FFB6C1';
		if (e == fm.id){fm.idError.value = '잘못된 형식의 아이디 입니다.'}
		else if (e == fm.name){fm.nameError.value = '잘못된 형식의 이름 입니다.'}
		else if (e == fm.pwd){fm.pwdError.value = '잘못된 형식의 비밀번호 입니다.'}
		else if (e == fm.email){fm.emailError.value = '잘못된 형식의 이메일 입니다.'}
		return false;
	}
	
	
}
</script>
</head>
<body>
<div class='mem animated fadeInDown'>
<form name='frm_mem' method='post' enctype="multipart/form-data">
	<label class='label'>아이디 </label>
	<input type='text' name='id'/><br/>
	<outpuSt name='idError' class='error'></output><br/><br/>
	
	<label class='label'>이름 </label>
	<input type='text' name='name'/><br/>
	<output name='nameError' class='error'></output><br/><br/>
	
	<label class='label'>연락처 </label>
	<input type='text' name='phone'/><br/>
	<output name='phoneError' class='error'></output><br/><br/>
	
	<label class='label'>비밀번호 </label>
	<input type='password' name='pwd'/><br/>
	<output name='pwdError' class='error'></output><br/><br/>
	
	<label class='label'>우편번호 </label>
	<input type='text' name='post'/><br/>
	<output name='postError' class='error'></output><br/><br/>
	
	<label class='label'>주소 </label>
	<input type='text' name='ar'/><br/>
	<output name='arError' class='error'></output><br/><br/>
	
	<label class='label'>이메일 </label>
	<input type='email' name='email'/><br/>
	<output name='emailError' class='error'></output><br/><br/>
	
	<div id='forphoto'>
		<label calss='label'>사진</label><p/>
		<img src='http://placehold.it/100x130' name='photo' width='100px' height='130px'/><br/>
		<input type='file' name='file' size='9'/><br/>
		<output name='fileError' class='error'></output><br/><br/>
	</div>
	<input type='button' name='btnRegister' class='btn' value='가입하기'/>
</form>	
</div>
<script>check()</script>
</body>
</html>