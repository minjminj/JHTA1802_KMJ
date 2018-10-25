<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- <script src="js/sectionMove.js"></script>    --><!-- section이 존재할때 스크롤을 바로 content에 맞추는 기능 -->
<!DOCTYPE html>
<link href="./cart/cart.css" rel="stylesheet" type="text/css">

<script>
/* 결제버튼을 클릭하면 이동*/
$(function(){
	
	$(".checkoutBtn").click(function(){
		$("#checkoutFrm").attr("action", "checkoutData.crt");
		$("#checkoutFrm").submit();
		
	})
	
})

</script>

<!-- 결제버튼을 클릭하면 보내질 폼 -->
<form id="checkoutFrm" method="post">
	<c:forEach items="${v }" var="v" varStatus="status">
		<input type="hidden" name="prod_name${status.index}" value="${v.prod_name }"/>
		<input type="hidden" name="prod_pric${status.index}" value="${v.prod_price }"/>
	</c:forEach>
</form>


<!-- <section class="padding-top-100 padding-bottom-100 pages-in chart-page"> -->
	<div class="container">
	

		<!-- Payments Steps -->
		<div class="shopping-cart text-center">
			<div class="cart-head">
				<ul class="row">
					<!-- PRODUCTS -->
					<li class="col-sm-2 text-left"><h6>PRODUCTS</h6></li>
					<!-- NAME -->
					<li class="col-sm-3 text-left"><h6>NAME</h6></li>
					<!-- PRICE -->
					<li class="col-sm-2"><h6>PRICE</h6></li>
					<!-- QTY -->
					<li class="col-sm-1"><h6>QTY</h6></li>
					<!-- TOTAL PRICE -->
					<li class="col-sm-2"><h6>TOTAL</h6></li>
					<li class="col-sm-1"></li> <!-- 삭제 버튼(x) 자리 -->
					<li class="col-sm-1"></li> <!-- 수정 버튼(x) 자리 -->
				</ul>
				<h5>${msg }</h5>
			</div>

			<!-- 장바구니 목록 -->
			<c:forEach var='i' items='${v }'>		
			<form name='frm_cart'>
			<ul class="row cart-details">
				<li class="col-sm-5">
					<div class="media">
						<!-- product 사진 -->
						<div class="media-left media-middle">
							<a href="#." class="item-img"><img class="media-object"	src="${i.pho_rename1 }" alt=""></a>
						</div>

						<!-- product 이름 -->
						<div class="media-body">
							<div class="position-center-center">
								<h5>${i.prod_name }</h5>
								<p>${i.prod_content }</p>
							</div>
						</div>
						
					</div>
				</li>

				<!-- product 가격 -->
				<li class="col-sm-2">
					<div class="position-center-center">
						<span class="price"><small>$</small>${i.prod_price }</span>
					</div>
				</li>

					
				<!-- product 갯수 -->
				<li class="col-sm-1">
					<div class="position-center-center">
						<div class="quinty">
							<!-- QTY -->
								<input type='number' size='4' name='cnt' value='${i.crt_cnt }'/>
								<input type='hidden' name='code' value='${i.crt_code }'/>
						</div>
					</div>
				</li>

				<!-- TOTAL PRICE -->
				<li class="col-sm-2">
					<div class="position-center-center">
						<span class="price"><small>$</small>'${i.crt_cnt * i.prod_price }</span>
					</div>
				</li>

				<!-- 장바구니 목록에서 상품 제거 -->
				<li class="col-sm-1">
					<div class="position-center-center">
						<a href="cart_delete.crt?crt_code=${i.crt_code }&cud_id=${vo.cud_id}"><i class="icon-close"></i></a>
					</div>
				</li>
				<!-- 목록에서 상품 갯수 수정 -->
				<li class="col-sm-1">
					<div class="position-center-center">
						<button style=" border: none;background-color:#fff;font-size:16px;" onclick="update(this.form)"><i class="icon-check"></i></button>
					</div>
				</li>
			</ul>
			</form>
			</c:forEach>
		</div>
	</div>
<!-- </section> -->

<!--======= PAGES INNER =========-->
<!-- <section class=" padding-bottom-100 light-gray-bg shopping-cart small-cart"> -->
	<div class="container">

		<!-- SHOPPING INFORMATION -->
		<div class="cart-ship-info margin-top-0">
			<div class="row">

				<!-- SUB TOTAL -->
				<div class="col-sm-5" id="grand-total-yellow-box-size">
					<h6>합계</h6>
					<div class="grand-total">
						<div class="order-detail">
							<c:set var='sum' value='0'/>
							<c:forEach var='i' items='${v }'>
						
							<c:set var='sum' value='${sum + i.crt_cnt * i.prod_price }'/>
							</c:forEach>	
							<!-- SUB TOTAL -->
							<p class="all-total"> 총 결제 금액 <span>${sum } 원</span></p>
						</div>
					</div>
				</div>
				
				<!-- DISCOUNT CODE -->
				<div class="col-sm-7" id="grand-total-button-box-size">
					<div class="coupn-btn">
						<a href="index.jsp" class="btn" id="hm-cart-button">쇼핑계속하기</a>
						<a class="btn checkoutBtn" id="hm-cart-button">결제하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- </section> -->

<script>
function update(ff){
	ff.action = "update_cart.crt";
	ff.submit();
}
</script>
