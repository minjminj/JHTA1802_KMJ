<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/sectionMove.js"></script> 
<script>

	$(function() {
	
		$("#purBtn").click(function() {
			
			if ($("#pur_name").val() === "") {
				alert("이름을 입력해주세요");
				$("#pur_name").focus();
			
			} else if ($("#pur_adr").val() === "") {
				alert("주소를 입력해주세요");
				$("#pur_adr").focus();
				
			} else if ($("#pur_phone").val() === "") {
				alert("연락처를 입력해주세요");
				$("#pur_phone").focus();
			
			} else if ($("#pur_memo").val() === "") {
				alert("메모를 입력해주세요 (없으면 없음)");
				$("#pur_memo").focus();
			
			} else {
				$("#purFrm").submit();				
			}
			
		})
		
		$("#totlaPrice").text($(".totalPrice").text());
	})

</script>

  <!-- Content -->
  <div id="content"> 
    
    
    <section class="padding-top-100 padding-bottom-100 light-gray-bg chart-page">
      <div class="container"> 
            <!-- Payments Steps -->
        <div class="shopping-cart"> 
          
          <!-- SHOPPING INFORMATION -->
          <div class="cart-ship-info">
            <div class="row"> 
              
              <!-- ESTIMATE SHIPPING & TAX -->
              <div class="col-sm-7">
                <h6>배송지 정보</h6>
                <form id="purFrm" method="post" action="checkout.crt">
                  <ul class="row">
                    
                    <!-- 받는분 -->
                    <li class="col-md-6">
                      <label>*받는분
                        <input type="text" id="pur_name" name="pur_name" value="" placeholder="">
                      </label>
                    </li>
                  <!-- 주소 -->
                    <li class="col-md-6"> 
                      <label>*주소
                        <input type="text" id="pur_adr" name="pur_adr" value="" placeholder="">
                      </label>
                    </li>
                    <li class="col-md-6"> 
                      <!-- 휴대전화 -->
                      <label>*휴대전화
                        <input type="text" id="pur_phone" name="pur_phone" value="" placeholder="">
                      </label>
                    </li>
                    <!-- 배송메모 -->
                    <li class="col-md-6">
                      <label>*배송메모
                        <input type="text" id="pur_memo" name="pur_memo" value="" placeholder="">
                      </label>
                    </li>
                    <!-- SUBMIT -->
<!--                     <li class="col-md-6">
                      <button type="submit" class="btn">SUBMIT</button>
                    </li> -->
                  </ul>

                
                <!-- SHIPPING info -->
                <h6 class="margin-top-50">주문자 정보</h6>
                  <ul class="row">
                    
                    <!-- 회원번호 -->
					<li class="col-md-6">
                      <label>*회원번호
                        <input type="text" name="cud_code" value="<c:out value='${vo.cud_code }'/>" placeholder="" readonly>
                      </label>
                    </li>

                    <!-- 이름 -->
                    <li class="col-md-6">
                      <label>*이름
                        <input type="text" name="" value="${vo.cud_name }" placeholder="" readonly>
                      </label>
                    </li>
                    <li class="col-md-6"> 
                      <!-- 휴대전화 -->
                      <label>*휴대전화
                        <input type="text" name="" value="${vo.cud_phone }" placeholder="" readonly>
                      </label>
                    </li>
                    <!-- PHONE -->
<!--                     <li class="col-md-6">
                      <button type="submit" class="btn">SUBMIT</button>
                    </li> -->
                  </ul>
                  <input type="hidden" name="pur_final_price" value="<c:out value='${totalPrice}'/>"/>
                </form>
              </div>
              
              <!-- SUB TOTAL -->
              <div class="col-sm-5">
                <h6>결제</h6>
                <div class="order-place">
                  <div class="order-detail">
                  <%-- <%
                    	 List list = (List)request.getAttribute("chkData");
                    	for(int i = 0 ; i<list.size(); i++){
                    		out.print(list.get(i));
                    	}
                    %> --%>
                  	
                  	<c:forEach items="${chkData}" var="chkData" varStatus="status">
                  		<%-- <p><c:out value="[${status.index}]:${chkData.prod_name[status.index]}"/> <span class="totalPrice"><c:out value="[${status.index}]:${chkData.prod_pric[status.index]}"/></span></p> --%>
                  		<c:if test="${status.index eq 0 }">
                  			<p><c:out value="${chkData.prod_name0}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric0}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 1 }">
                  			<p><c:out value="${chkData.prod_name1}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric1}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 2 }">
                  			<p><c:out value="${chkData.prod_name2}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric2}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 3 }">
                  			<p><c:out value="${chkData.prod_name3}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric3}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 4 }">
                  			<p><c:out value="${chkData.prod_name4}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric4}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 5 }">
                  			<p><c:out value="${chkData.prod_name5}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric5}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 6 }">
                  			<p><c:out value="${chkData.prod_name6}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric6}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 7 }">
                  			<p><c:out value="${chkData.prod_name7}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric7}"/></span></p>
                    	</c:if>
                    	<c:if test="${status.index eq 8 }">
                  			<p><c:out value="${chkData.prod_name8}"/> <span class="totalPrice"><c:out value="${chkData.prod_pric8}"/></span></p>
                    	</c:if>
                    </c:forEach>
                     
                    <!-- SUB TOTAL -->
                    <p class="all-total">총 금액 <span id="totalPrice"><c:out value="${totalPrice }"/></span></p>
                    
                  </div>
                  <div class="pay-meth">
                    <ul>
                      <!-- <li>
                        <div class="radio">
                          <input type="radio" name="radio1" id="radio1" value="option1" checked>
                          <label for="radio1"> 신용카드</label>
                        </div>
                      </li> -->
                      <li>
                        <div class="radio">
                          <input type="radio" name="radio1" id="radio2" value="option2">
                          <label for="radio2">무통장입금</label>
                        </div>
                      </li>
                       <li>
                          <label for="radio3">전산오류로 무통장입금 밖에 안되는 것을 양해바랍니다<br>
                          			입금자명과 주문자명을 같게 해주세요.</label>
                      </li>
                      <!-- <li>
                        <div class="radio">
                          <input type="radio" name="radio1" id="radio3" value="option3">
                          <label for="radio3">휴대폰</label>
                        </div>
                      </li> -->
                      <li>
                        <div class="checkbox">
                          <input id="checkbox3-4" class="styled" type="checkbox">
                          <label for="checkbox3-4"> 결제 진행 필수사항 동의</label>
                        </div>
                      </li>
                    </ul>
                    <a href="#" id="purBtn" class="btn btn-dark pull-right margin-top-30">결제</a> </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>