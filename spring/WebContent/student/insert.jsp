<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script>
$('#insert #btnRegister').click(function(){
	var data = new FormData(document.frm_insert);
	$.ajax({
		data : data,
		processData: false,
		contentType: false,
		type : 'post',
		url : 'insert.std',
		success : function(min){
			$('#content').html(min);
		}
	});
});

$('#insert #btnCancle').click(function(){
	var param = $('#f_list').serialize();
	$('#content').load('list.std', param);
});

//이미지 미리보기
$('#insert #file').change(function(){
	var fn = $(this).val();
	fn = fn.substr(fn.lastIndexOf("\\") + 1);
	$('#insert #output').val(fn);
	
	 var file = document.frm_insert.file;	// 이벤트가 발생한 태그
	 var url = file.files[0];		// 선택된 이미지의 경로
	 
	 var reader = new FileReader();
	 reader.onload = function(e){
		 document.frm_insert.photo.src = e.target.result;
		 $('#insert #photo').css({'width':'350px', 'height':'400px'});
	 }
	 reader.readAsDataURL(url);
});

// placehold를 클릭하면 이미지 선택하기.
$('#insert #photo').click(function(){
	$('#insert #file').click();
});
</script>

<script>
    function postcodeAPI() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
            }
        }).open();
    }
</script>


</head>
<body>
<div id='insert'>
	<h3>회원이 되어보자</h3>
		<form name='frm_insert' id='frm_insert' method='post' enctype='multipart-formdata'>
			<div id='insert_form'>
			<label class='label'>아이디 </label>
			<input type='text' name='id'/><br/>
			<output name='idError' class='error'></output>
			
			<label class='label'>이름 </label>
			<input type='text' name='name'/><br/>
			
			<label class='label'>연락처 </label>
			<input type='text' name='phone'/><br/>
			
			<label class='label'>비밀번호 </label>
			<input type='text' name='pwd'/><br/>
			
			<label class='label'>우편번호 </label>
			<input type="button" onclick="postcodeAPI()" class='btn' value="우편번호 찾기"><br>
			
			<input type='text' name='post' id='post'/><br/>
			
			<label class='label'>기본주소 </label><br/>
			<input type='text' name='address' id='address' size='50'/><br/>
			
			<label class='label'>이메일 </label>
			<input type='text' name='email'/><br/>

			<input type='button' id='btnRegister' class='btn' value='POST'/>
			<input type='button' id='btnCancle' class='btn' value='GoBack'/>
			</div>

			<div id='forphoto'>
				<label class='label'>사진</label><br/>
				<img src='http://placehold.it/100x130' name='photo' id='photo'/><br/>
				<input type='file' name='file' id='file' size='9' class='btn' style='display:none'/><br/>
				<output id='output'></output><br/><br/>
			</div>
			
			<input type='hidden' name='findStr' value='${param.findStr }'/>
			<input type='hidden' name='photoOri' value='${param.photoOri }'/>
			
		</form>
		
		<form name='f_list' id='f_list'method='post'>
			<input type='hidden' name='findStr' value='${param.findStr }'/>
			<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		</form>
</div>
</body>
</html>