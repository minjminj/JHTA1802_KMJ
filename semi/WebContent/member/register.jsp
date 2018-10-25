<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/sectionMove.js"></script> 
 <head>
<style>
/* output{display:block;padding-top:7px;font-size:14px;line-height:1.42857143;color:#555} */

#register {
	margin-top:35px;
	margin-left: 440px;
}

.error {
		font-size: 10px;
    	color: darkred;
    	text-decoration: underline;
    	margin-left: 45%;
	}
	

</style>
 <script>
 
	
 function chk(){
	 ff = document.frm;
	 
	 ff.btn_register.onclick = function(){
		ff.cud_id_error.value = "";
		ff.cud_name_error.value = "";
		ff.cud_pwd_error.value = "";
		ff.pwdDismatch.value = "";
		ff.cud_pwdchk_error.value = "";
		ff.cud_pwdans_error.value = "";
		ff.cud_phone_error.value = "";
		var pwd = ff.cud_pwd.value;
		var con = ff.cud_pwd_confirm.value;
		 
		if (!val(/^[a-z0-9]{6,12}$/, ff.cud_id)){	/*6-12자의 영소문자만*/
			return;
		} else if (!val(/^[가-힣A-Za-z]{2,}$/, ff.cud_name)){	/*2자 이상의 영문자와 한글만*/
			return;	
		} else if (!val(/^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/, ff.cud_pwd)){ /*영_숫자 특수문자 */
			return;
		} else if (pwd != con) {
			con = "";
			ff.pwdDismatch.value = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
			ff.cud_pwd_confirm.focus(); 
		} else if (!val(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/, ff.cud_phone)){
			return;	
		} else {
			 ff.action = "registerR.cud";
			 ff.submit();
		}
	 }
 }
 function val(re, e){
	if (re.test(e.value)){
		return true;
	} else {	
		e.focus();
		e.value = "";
		if (e == ff.cud_id) {ff.cud_id_error.value = "6-12자의 영소문자와 숫자만 입력해주세요.";}
		else if (e == ff.cud_name){ff.cud_name_error.value = "2자 이상의 한글과 영문자만 입력해주세요.";}
		else if (e == ff.cud_pwd){ff.cud_pwd_error.value = "8-24자의 영숫자, 특수문자를 혼합하여 입력해주세요.";}
		else if (e == ff.cud_phone){ff.cud_phone_error.value = "전화번호 양식에 맞게 입력해주세요(- 포함)";}
		return false;
	}
 }
 
 </script>
 </head>
 <body> 
  <!-- Content -->
  <div id="content"> 
    
    <!--======= PAGES INNER =========-->
    <section class="chart-page padding-top-100 padding-bottom-100">
      <div class="container"> 
        
        <!-- Payments Steps -->
        <div class="shopping-cart"> 
          
          <!-- SHOPPING INFORMATION -->
          <div class="cart-ship-info register">
            <div class="row"> 
              
              <!-- ESTIMATE SHIPPING & TAX -->
              <div class="col-sm-12">
                <h6>회원가입</h6>
                <form name="frm" method="post">
                  <ul class="row">
                    
                    <li class="col-md-6">
                      <label> *아이디
                        <input type="text" name="cud_id" value="" placeholder="">
                        <output name="cud_id_error" class="error"></output>
                      </label>
                    </li> 
                    
                    <li class="col-md-6">
                      <label> *성명
                        <input type="text" name="cud_name" value="" placeholder="">
                        <output name="cud_name_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *비밀번호
                        <input type="password" name="cud_pwd" value="" placeholder="">
                        <output name="cud_pwd_error" class="error"></output>
                      </label>
                    </li>
                   
                    <li class="col-md-6">
                      <label> *비밀번호 확인
                        <input type="password" name="cud_pwd_confirm" value="" placeholder="">
                        <output name="pwdDismatch" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *비밀번호 확인 질문
                        <input type="text" name="cud_pwdchk" value="" placeholder="비밀번호  찾기용 본인 확인 질문을 입력하세요.">
                     	<output name="cud_pwdchk_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *비밀번호 확인 질문 답
                        <input type="text" name="cud_pwdans" value="" placeholder="">
                       	<output name="cud_pwdans_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6"> 
                      <label>*연락처
                        <input type="text" name="cud_phone" value="" placeholder="">
                     	<output name="cud_phone_error" class="error"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <button type="button" class="btn" name="btn_register" id="register" onclick=''>가입하기</button>
                    </li>
                  </ul>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<script>chk();</script>
</body>
 