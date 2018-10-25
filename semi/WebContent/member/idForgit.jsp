<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	$(function(){
		
		$("#findId").remove();
		
		// 아이디 찾기를 클릭하면
		$("#forgitIdBtn").click(function(){
			
			// 이름과 연락처가 비어있으면 걸러줌
			if ($("#cud_name").val() === "") {
				alert("이름을 입력해주세요");
				$("#cud_name").focus();
				
			} else if ($("#cud_phone").val() === "") {
				alert("연락처를 입력해주세요")
				$("#cud_phone").focus();
				
			// 빈칸이 없으면 action을 추가해주고 submit
			} else {
			
				$("#forgitIdFrm").attr("action", "forgitId.cud");
				$("#forgitIdFrm").submit();
				
				// 컨트롤러에서 데이터가 넘어온다면 매칭이 잘 되었으니 text를 추가해준다
				if ("${forgitId}" !== "") {
					$("#findId").append("당신의 아이디는 ${forgitId} 입니다");
				
				} else if ("${forgitId}" === "") {
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
                <h6>아이디 찾기</h6>
                <form id="forgitIdFrm" method="post">
                  <ul class="row">
                    
                    <!-- Name -->
                    <li class="col-md-12">
                      <label> 이름
                        <input type="text" id="cud_name" name="cud_name" placeholder="이름을 입력해주세요">
                      </label>
                    </li>
                    <!-- LAST NAME -->
                    <li class="col-md-12">
                      <label> 연락처
                        <input type="password" id="cud_phone" name="cud_phone" placeholder="연락처를 입력해주세요">
                      </label>
                    </li>
                    
                    <!-- 찾은 아이디 -->
                    <li class="col-md-12">
                      <label id="findId"> 
                  	    
                      </label>
                    </li>
                    
                    <!-- 아이디 찾기 -->
                    <li class="col-md-4">
                      <button type="button" id="forgitIdBtn" class="btn">아이디 찾기</button>
                    </li>
                   </ul>
                 </form>
              </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    
  

