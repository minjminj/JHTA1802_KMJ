<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/sectionMove.js"></script> 


<script>

window.onload=function(){
	
	var ff = document.cud_frm;
	var referrer = document.referrer;
	
	ff.referrer.value = referrer;
	alert(referrer);
}

var forgit = {
	
	// 아이디 찾기
	idForgit : function() {
		/* alert("idforgit"); */
		var url = "indexHead.jsp?content=member/idForgit.jsp",
			opt = "width=600, height=500";
		
		window.open(url, "win", opt);
		
	},
	
	// 비밀번호 찾기
	pwdForgit : function() {
		/* alert("pwdforgit"); */
		
		var url = "indexHead.jsp?content=member/pwdForgit.jsp",
		opt = "width=700, height=550";
		
		window.open(url, "win", opt);
	}
	
}

$(function(){
	
	if ("${msg}" !== '') {
		alert("${msg}");
	}
	
	$("#cud_btn").click(function(){
			
		//아이디가 공백 이면 얼럿 띄움
		if ($("#cud_id").val() === "") {
			
			alert("아이디가 비었습니다.");
			$("#cud_id").focus();
	
		//비밀번호가 공백이면 얼럿띄움
		} else if ($("#cud_pwd").val() === "") {
			
				alert("비밀번호가 비었습니다");
				$("#cud_pwd").focus();				
			
		} else {
			
			//무결성 테스트 통과하면 아이디, 비밀번호 값을 넘김
			$("#cud_frm").attr("action", "login.cud");

			$("#cud_frm").submit();
			
		}
		
	})
	
})

		
/* $(document).ready(function() {
	var referrer =  document.referrer;
	alert(referrer);
    $('#referrer').val(referrer);
});
 */

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
                
                <form name ="cud_frm" id="cud_frm" method="post">
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
                 	<input type='hidden' name ="referrer" id="referrer"/>
                   
                    <!-- CREATE AN ACCOUNT -->
                    <li class="col-md-4">
                      <div class="checkbox margin-0 margin-top-20 text-right">
                        <a href="#" onclick="forgit.idForgit()">Forget ID</a>
                      </div>
                    </li>
              
                    <!-- FORGET PASS -->
                    <li class="col-md-4">
                      <div class="checkbox margin-0 margin-top-20 text-right">
                        <a href="#" onclick="forgit.pwdForgit()">Forget Password</a>
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
  

