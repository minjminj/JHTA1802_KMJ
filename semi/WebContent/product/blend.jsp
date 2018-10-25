<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="product/product.css" />
<script src="js/sectionMove.js"></script> 
<form name="find_str_now_page_form" method="post">
	<input type='hidden' name='find_str' value='${param.find_str}' />
	<input type='hidden' name='now_page' value='${param.now_page < 1 ? 1 : param.now_page}' />
	<input type='hidden' name='cate' value='blend' />
	<input type='hidden' name='prod_code' />
	<input type='hidden' name='crt_cnt' value='1'/>
</form>
<!-- Wrap -->
<div id="wrap">
	<!-- Content -->
	<div id="content">

		<!-- Popular Products -->
		<section class="shop-page padding-top-100 padding-bottom-100">
			<div class="container">
				<div class="item-display">
					<div class="row">
						<div class="col-xs-6">
							<span class="product-num">Showing 1 - 10 of 30 products</span>
						</div>

						<!-- Products Select -->
						<div class="col-xs-6">
							<div class="pull-right">

								<!-- Short By -->
								<select class="selectpicker">
									<option>Short By</option>
									<option>Short By</option>
									<option>Short By</option>
								</select>
								<!-- Filter By -->
								<select class="selectpicker">
									<option>Filter By</option>
									<option>Short By</option>
									<option>Short By</option>
								</select>

								<!-- GRID & LIST -->
								<a href="#." class="grid-style"><i class="icon-grid"></i></a> <a
									href="#." class="list-style"><i class="icon-list"></i></a>
							</div>
						</div>
					</div>
				</div>

				<!-- Popular Item Slide -->
				<div class="papular-block row">
					<!------------------------------------------
					각 카테고리 별 상품 정보를 DAO에서 받아
					c:forEach를 사용해 상품 정보를 뿌렸습니다.
					------------------------------------------->
					<c:forEach var='v' items='${prod_blend_list}'>
						<!-- Item -->
						<div class="col-md-3">
							<div class="item">
								<!-- Item img -->
								<div class="item-img">
								
									<!-- 마우스 hover 전 사진 -->
									<img class="img-1" src="${v.pho_vo.pho_rename1}" alt="">
									
									<!-- 마우스 hover 후 사진 -->
									<img class="img-2" src="${v.pho_vo.pho_rename1}" alt="">
									
									<!-- Overlay -->
									<div class="overlay">
										<div class="position-center-center">
											<div class="inn" id='hm-padding-control'>
												<a href="${v.pho_vo.pho_rename1}" data-lighter><i class="icon-magnifier"></i></a>
												
												<!-- hover시 장바구니 버튼 -->
												<a href="#" onclick="add('${v.prod_code}')"><i class="icon-basket"></i></a>
												
												<!-- hover시 하트 버튼 -->
												<a href="#."><i class="icon-heart"></i></a>
											</div>
										</div>
									</div>
								</div>
								<!-- Item Name -->
								<div class="item-name">
									
									<!-- 상품 이름을 클릭했을 때 go메소드를 호출(상품 코드, now_page, find_str, cate정보를
									담아 전송합니다. -->
									<a href="#" onclick="go('${v.prod_code}')">${v.prod_name}</a>
									<p>"${v.prod_content}"</p>
								</div>
								<!-- Price -->
								<span class="price">${v.prod_price}<small>원</small></span>
							</div>
						</div>
					</c:forEach>
					
					<!-- 상품 페이징 -->
					<ul class="pagination in-center">
						<!-- 왼쪽화살표 버튼 -->
						<c:if test="${prod_blend_dao.now_block > 1}">
							<li><a href="#" onclick="move_page(1)"><i class="fa fa-angle-double-left" id="hm-angle"></i></a></li>
							<li><a href="#" onclick="move_page(${prod_blend_dao.start_page - 1})"><i class="fa fa-angle-left" id="hm-angle"></i></a></li>
						</c:if>
						<!-- 왼쪽화살표 버튼 끝 -->
					
						<!-- 상품 페이지  -->
						<c:forEach var="p" begin="${prod_blend_dao.start_page}"
							end="${prod_blend_dao.end_page}">
							<c:if test="${p == prod_blend_dao.now_page}">
								<li class="active"><a href="#" onclick="move_page(${p})">${p}</a></li>
							</c:if>
							<c:if test="${p != prod_blend_dao.now_page}">
								<li><a href="#" onclick="move_page(${p})">${p}</a></li>
							</c:if>
						</c:forEach>
						<!-- 상품 페이지 끝 -->
						
						<!-- 오른쪽화살표 버튼  -->
						<c:if
							test="${prod_blend_dao.now_block < prod_blend_dao.tot_block}">
							<li><a href="#" onclick="move_page(${prod_blend_dao.end_page + 1})"><i class="fa fa-angle-right"
									id="hm-angle"></i></a></li>
							<li><a href="#" onclick="move_page(${prod_blend_dao.tot_page})"><i class="fa fa-angle-double-right"
									id="hm-angle"></i></a></li>
						</c:if>
						<!-- 오른쪽화살표 버튼 끝 -->
					</ul>
					<!-- 상품 페이징 끝 -->
				</div>
			</div>
		</section>
	</div>
</div>
<script>
	document.find_str_now_page_form.onsubmit = function() {
		var df = document.find_str_now_page_form;
		df.now_page.value = 1;
		df.submit();
	}
	function move_page(now_page) {
		var df = document.find_str_now_page_form;
		df.now_page.value = now_page;
		df.submit();
	}
	
	function go(prod_code) {
		var df = document.find_str_now_page_form;
		df.prod_code.value = prod_code;
		df.action = "prod_detail.prod";
		df.submit();
	}
	
	function add(prod_code) {
		var df = document.find_str_now_page_form;
		if (${empty sessionScope.vo}){
			df.action = "index.jsp?content=member/login.jsp";
			df.submit();
		} else {
			df.prod_code.value = prod_code;
			df.action = "add_cart.crt";
			df.submit();
		}
	}
</script>