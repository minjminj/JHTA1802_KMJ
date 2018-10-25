<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	$(function(){
		
		$("#findPwd").remove();
		
		// 비밀번호 찾기를 클릭하면
		$("#forgitPwdBtn").click(function(){
			
			// 이름 질문 답변 공백만 걸름
			if ($("#cud_id").val() === "") {
				alert("이름을 입력해주세요");
				$("#cud_id").focus();
				
			} else if ($("#cud_pwdchk").val() === "") {
				alert("질문을 입력해주세요")
				$("#cud_pwdchk").focus();
				
			} else if ($("#cud_pwdans").val() === "") {
				alert("답변을 입력해주세요")
				$("#cud_pwdans").focus();
			
			// 빈칸이 없으면 action을 추가해주고 submit
			} else {
			
				$("#forgitPwdFrm").attr("action", "forgitPwd.cud");
				$("#forgitPwdFrm").submit();
				
				// 컨트롤러에서 데이터가 넘어온다면 매칭이 잘 되었으니 text를 추가해준다
				if ("${forgitPwd}" !== "") {
					$("#findPwd").append("당신의 비밀번호는 ${forgitPwd} 입니다");
				
				} else if ("${forgitPwd}" === "") {
					alert("입력정보가 없습니다. 다시 확인해주세요.");
				
				}
			}
			
		})
		
	})

</script>
  
  
  <!-- Content -->
  <div id="content"> 
    
    <!--======= PAGES INNER =========-->
      <div class="container"> 
        
        <!-- Payments Steps -->
        <div class="shopping-cart"> 
          
          <!-- SHOPPING INFORMATION -->
          <div class="cart-ship-info">
            <div class="row"> 
              
              <!-- ESTIMATE SHIPPING & TAX -->
              <div class="col-sm-7">
                <h6>비밀번호 찾기</h6>
                <form id="forgitPwdFrm" method="post">
                  <ul class="row">
                    
                    <!-- Name -->
                    <li class="col-md-12">
                      <label> 아이디
                        <input type="text" id="cud_id" name="cud_id" placeholder="아이디를 입력해주세요">
                      </label>
                    </li>
                    <!-- 비밀번호 찾기 질문 답 -->
                    <li class="col-md-12">
                      <label> 비밀번호 확인 질문
                        <input type="text" id="cud_pwdchk" name="cud_pwdchk" placeholder="질문을 입력해주세요">
                      </label>
                    </li>
                    <li class="col-md-12">
                      <label> 비밀번호 확인 답
                        <input type="text" id="cud_pwdans" name="cud_pwdans" placeholder="답변을 입력해주세요">
                      </label>
                    </li>
                    
                    <!-- 찾은 비밀번호 -->
                    <li class="col-md-12">
                      <label id="findPwd"> 
                  	    
                      </label>
                    </li>
                    
                    <!-- 비밀번호찾기 -->
                    <li class="col-md-4">
                      <button type="button" id="forgitPwdBtn" class="btn">비밀번호 찾기</button>
                    </li>
                   </ul>
                 </form>
              </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    
  

