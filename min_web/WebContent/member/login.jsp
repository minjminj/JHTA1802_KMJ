<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>


$(function(){
	

	$("#cud_btn").click(function(){
		
		//무결성테스트를 위한 변수 id, pwd 체크
		var idChk = /[^a-z0-9 ]/g,
			pwdChk = /[^a-z0-9A-Z ]/g;
		
		//무결성 테스트 아이디 값이 통과하지 못하거나 공백이면 alert 띄움
		if (idChk.test($("#cud_id").val()) || $("#cud_id").val() === "") {
			
			/* $("#cud_id_output").val("아이디를 확인해주세요(영문, 숫자 15자이하)"); */
			alert("아이디를 확인해주세요(영문, 숫자 15자이하)");
			$("#cud_id").focus();
	
		//무결성 테스트 비밀번호 값이 통과하지 못하거나 공백이면 alert 띄움
		} else if (pwdChk.test($("#cud_pwd").val()) || $("#cud_pwd").val() === "") {
			
				/* $("#cud_pwd_output").val("비밀번호를 확인해주세요(영문, 숫자 15자이하)"); */
				alert("비밀번호를 확인해주세요(영문, 숫자 15자이하)");
				$("#cud_pwd").focus();				
			
		} else {
			
			//무결성 테스트 통과하면 아이디, 비밀번호 값을 넘김
			$("#cud_frm").attr("action", "");
			$("#cud_frm").submit();
		}
		
		
	})
	
})
</script>
  
  
  <!-- Content -->
  <div id="content"> 
    
    <!--======= PAGES INNER =========-->
    <section class="chart-page padding-top-100 padding-bottom-100">
      <div class="container"> 
        
        <!-- Payments Steps -->
        <div class="shopping-cart"> 
          
          <!-- SHOPPING INFORMATION -->
          <div class="cart-ship-info">
            <div class="row"> 
              
              <!-- ESTIMATE SHIPPING & TAX -->
              <div class="col-sm-7">
                <h6>LOGIN YOUR ACCOUNT</h6>
                <form id="cud_frm">
                  <ul class="row">
                    
                    <!-- Name -->
                    <li class="col-md-12">
                      <label> USERNAME
                        <input type="text" id="cud_id" name="cud_id" placeholder="아이디를 입력해주세요">
                      	<output id="cud_id_output"></output>
                      </label>
                    </li>
                    <!-- LAST NAME -->
                    <li class="col-md-12">
                      <label> PASSWORD
                        <input type="password" id="cud_pwd" name="cud_pwd" placeholder="비밀번호를 입력해주세요">
                      	<output id="cud_pwd_output"></output>
                      </label>
                    </li>
                    
                    <!-- LOGIN -->
                    <li class="col-md-4">
                      <button type="button" id="cud_btn" class="btn">LOGIN</button>
                    </li>
                    
                    <!-- CREATE AN ACCOUNT -->
                    <li class="col-md-4">
                      <div class="checkbox margin-0 margin-top-20">
                        <input id="checkbox1" class="styled" type="checkbox">
                        <label for="checkbox1"> Stay me Login</label>
                      </div>
                    </li>
                    
                    <!-- FORGET PASS -->
                    <li class="col-md-4">
                      <div class="checkbox margin-0 margin-top-20 text-right">
                        <a href="#.">Forget Password</a>
                      </div>
                    </li>
                  </ul>
                </form>
                
              </div>
              
              <!-- SUB TOTAL -->
              <div class="col-sm-5">
                <h6>LOGIN WITH</h6>
                
                <ul class="login-with">
                	<li>
                    	<a href="#."><i class="fa fa-facebook"></i>FACEBOOK</a>
                    
                    </li>
                    
                    <li>
                    	<a href="#."><i class="fa fa-google"></i>GOOGLE</a>
                    
                    </li>
                    
                    <li>
                    	<a href="#."><i class="fa fa-twitter"></i>TWITTER</a>
                    
                    </li>
                
                </ul>
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
   
    
   
  </div>
  

