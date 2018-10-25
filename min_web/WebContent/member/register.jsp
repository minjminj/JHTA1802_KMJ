<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <head>
<style>
#register {
	margin-top:35px;
	margin-left: 440px;
}
</style>
 <script>
 function chk(){
	 var ff = document.frm;
	 
	 ff.register.onclick = function(){
		 ff.pwdDismath.value = "";
		 if (ff.cud_pwd.equals(ff.cud_pwd_confirm.value)){
			 ff.action = "registerR.cud";
			 ff.submit();
		 } else {
			 ff.pwdDismath.value = "비밀번호와 비밀번호 확인이 일치하지 않습니다. ";
		 }
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
                <h6>REGISTER</h6>
                <form name="frm" method="post" action="registerR.cud">
                  <ul class="row">
                    
                    <li class="col-md-6">
                      <label> *아이디
                        <input type="text" name="cud_id" value="" placeholder="">
                      </label>
                    </li> 
                    
                    <li class="col-md-6">
                      <label> *성명
                        <input type="text" name="cud_name" value="" placeholder="">
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *비밀번호
                        <input type="password" name="cud_pwd" value="" placeholder="">
                      </label>
                    </li>
                   
                    <li class="col-md-6">
                      <label> *비밀번호 확인
                        <input type="password" name="cud_pwd_confirm" value="" placeholder="">
                     	<output name="pwdDismath"></output>
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *비밀번호 확인 질문
                        <input type="text" name="cud_pwdchk" value="" placeholder="비밀번호  찾기용 본인 확인 질문을 입력하세요.">
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <label> *비밀번호 확인 질문 답
                        <input type="text" name="cud_pwdans" value="" placeholder="">
                      </label>
                    </li>
                    
                    <li class="col-md-6"> 
                      <label>*연락처
                        <input type="text" name="cud_phone" value="" placeholder="">
                      </label>
                    </li>
                    
                    <li class="col-md-6">
                      <button type="button" class="btn" name="register" id="register">가입하기</button>
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
 