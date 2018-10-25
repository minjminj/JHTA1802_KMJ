<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script src="js/sectionMove.js"></script>  
 <!--======= PAGES INNER =========-->
    <section class="padding-top-100 padding-bottom-100 pages-in chart-page">
      <div class="container"> 
        
        <!-- Payments Steps -->
        <div class="shopping-cart text-center">
          <div class="cart-head">
            <ul class="row">
              
              <!-- 구매번호 -->
              <li class="col-sm-2">
                <h6>구매번호</h6>
              </li>
              
              <!-- 날짜 -->
              <li class="col-sm-2">
                <h6>날짜</h6>
              </li>
              
              <!-- 상품명 -->
              <li class="col-sm-2">
                <h6>상품명</h6>
              </li>
              
              <!-- PRICE -->
              <li class="col-sm-2">
                <h6>이름</h6>
              </li>
              <!-- QTY -->
              <li class="col-sm-1">
                <h6>배송상태</h6>
              </li>
              
              <!-- TOTAL PRICE -->
              <li class="col-sm-2">
                <h6>총금액</h6>
              </li>
              <li class="col-sm-1"> </li>
            </ul>
          </div>
          
          <c:forEach items="${chkList}" var="chkList" >
          <ul class="row cart-details">
           
            <!-- 구매번호 -->
            
            <li class="col-sm-2">
              <div class="position-center-center"> <span class="price"><c:out value="${chkList.pur_code }"/></span> </div>
            </li>
            
            <!-- 날짜 -->
            <li class="col-sm-2">
              <div class="position-center-center"> <span class="price"><c:out value="${chkList.pur_date }"/></span> </div>
            </li>
            
            <!-- 상품명 -->
            <li class="col-sm-2">
              <div class="position-center-center"> <span class="price"><c:out value="${chkList.pur_name }"/></span> </div>
            </li>
            
            <!--  이름 -->
            <li class="col-sm-1">
              <div class="position-center-center"> <span class="price"><c:out value="${chkList.pur_name }"/></span> </div>
            </li>
            
            <!--  배송상태 -->
            <li class="col-sm-2">
              <div class="position-center-center"> <span class="price"><c:out value="${chkList.pur_status}"/></span> </div>
            </li>
            
            <!--  총금액 -->
            <li class="col-sm-1">
              <div class="position-center-center"> <span class="price"><c:out value="${chkList.pur_final_price }"/></span> </div>
            </li>
            
           <!--  <li class="col-sm-1">
              <div class="position-center-center"> <a href=""><i class="icon-close"></i></a> </div>
            </li> -->
          </ul>
          </c:forEach>
        </div>
      </div>
    </section> 