<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="product/product.css" />
<script src="js/sectionMove.js"></script> 
<form name="find_str_now_page_form" method="post">
	<!-- 상품 코드 -->
	<input type='hidden' name='prod_code' value='${param.prod_code}' />
	<!-- 회원 ID -->
	<input type='hidden' name='cud_id' value='${vo.cud_id}' />
	<!-- 상품 갯수 -->
	<input type='hidden' name='crt_cnt' />
	<!-- 상품 이름 -->
	<input type='hidden' name='prod_name' />
	<!-- 리뷰 작성 가능 여부 -->
	<input type='hidden' name='prod_review' value='${review}' />
	<!-- 가격 -->
	<input type='hidden' name='prod_price' value='${param.prod_price}' />
	<!-- 사진 이름 -->
	<input type='hidden' name='pho_rename2' />
</form>
<form name='checkoutFrm' method='post'>
	<input type='hidden' name='prod_name0' /> 
	<input type='hidden' name='prod_pric0' value='${param.prod_price}' />
</form>
<!-- Content -->

<div id="content">
	<!-- Popular Products -->
	<section class="padding-top-100 padding-bottom-100">
		<div class="container">

			<!-- SHOP DETAIL -->
			<div class="shop-detail">
				<div class="row">
					<!-- Popular Images Slider -->
					<div class="col-md-7">
						<!-- Images Slider -->
						<div class="images-slider">
							<ul class="slides">
								<!-- 상품 사진을 Prod_select_dao, Prod_servlet에서 받아 뿌립니다. -->
								<c:forEach var='p' items='${prod_photo_detail_list}'>
									<li data-thumb="${p.pho_rename2}"><img
										class="img-responsive" src="${p.pho_rename2}" alt=""></li>
									<li data-thumb="${p.pho_rename3}"><img
										class="img-responsive" src="${p.pho_rename3}" alt=""></li>
									<li data-thumb="${p.pho_rename4}"><img
										class="img-responsive" src="${p.pho_rename4}" alt=""></li>
									<input type='hidden' id='rename2_send' value='${p.pho_rename2}' />
								</c:forEach>
							</ul>
						</div>
					</div>

					<!-- COntent -->

					<div class="col-md-5">
						<c:forEach var='v' items='${prod_select_list}'>
							<h4 class="margin-bottom-30">${v.prod_name}</h4>
							<h5 class="price">${v.prod_price}원</h5>
							<input type='hidden' id="price_send" value='${v.prod_price}' />
							<input type='hidden' id="name_send" value='${v.prod_name}' />
							<input type='hidden' id="prod_code_send" value='${v.prod_code}' />
						</c:forEach>

						<ul class="item-owner">
							<li><p class="store-brand">
									<span><i class="fa fa-truck"></i> [배송비] 무료배송</span> | <span><i
										class="fa fa-home"></i> [판매처] 코딩빌런</span>
								</p></li>
						</ul>

						<!-- Item Detail -->
						<p>${prod_content}</p>

						<!-- Short By -->
						<div class="some-info">
							<ul class="row margin-bottom-30 total-price">
								<!-- 수량 -->
								<div class="form-group row" id='hm-number-box'>
									<label for="example-number-input" class="col-2 col-form-label">수량</label>
									<div class="col-10" onclick="compute_count()">
										<input class="form-control" type="number" value="1"
											id="example_number_input" name="example_number_input" min="1" />
									</div>
								</div>
								<!-- 수량 끝 -->
								<c:forEach var='v' items='${prod_select_list}'>
									<li class="col-xs-12"><span class="fl margin-top-20">
											총 상품 금액 : </span>
										<h4 class="fr" id='total_price'>${v.prod_price}원</h4></li>
								</c:forEach>
							</ul>

							<ul class="row">
								<!-- ADD TO CART -->
								<li class="col-xs-6"><a href="#" onclick="add_cart()"
									class="btn"> 장바구니 담기 </a></li>
								<li class="col-xs-6"><a href="#" onclick="checkout()"
									class="btn"> 구매하기 </a></li>
							</ul>
							<!-- INFOMATION -->
							<div class="inner-info">
								<h6>DELIVERY INFORMATION</h6>
								<p>8월 13일~15일까지 여름휴가입니다. 8월 10일(금) 12시 이전 주문까지 발송하며, 10일 12시
									이후 주문부터 15일 주문은 16일부터 순차적으로 배송됩니다.</p>
								<h6>SHARE THIS PRODUCT</h6>

								<!-- Social Icons -->
								<ul class="social_icons">
									<li><a href="#."><i class="icon-social-facebook"></i></a></li>
									<li><a href="#."><i class="icon-social-twitter"></i></a></li>
									<li><a href="#."><i class="icon-social-tumblr"></i></a></li>
									<li><a href="#."><i class="icon-social-youtube"></i></a></li>
									<li><a href="#."><i class="icon-social-dribbble"></i></a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!--======= PRODUCT DESCRIPTION =========-->
			<div class="item-decribe">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs animate fadeInUp" data-wow-delay="0.4s"
					role="tablist">
					<li role="presentation" class="active"><a href="#descr"
						role="tab" data-toggle="tab">DESCRIPTION</a></li>
					<li role="presentation"><a href="#review" role="tab"
						data-toggle="tab">REVIEW (03)</a></li>
					<li role="presentation"><a href="#qna" role="tab"
						data-toggle="tab">QNA</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content animate fadeInUp" data-wow-delay="0.4s">
					<!-- DESCRIPTION -->
					<div role="tabpanel" class="tab-pane fade in active" id="descr">
						<c:forEach var='v' items='${prod_select_list}'>
							<p>${v.prod_content}</p>
						</c:forEach>
					</div>

					<!-- REVIEW -->
					<div role="tabpanel" class="tab-pane fade" id="review">
						<div class="comments margin-top-80">
							<h5 class="shop-tittle margin-bottom-30">리뷰</h5>
							<ul class="media-list padding-left-15">
								<!--=======  COMMENTS =========-->
								<c:forEach var="r" items="${prod_review_list}">
									<li class="media">
										<div class="media-body">
											<h6 class="media-heading" id='replyId'>
												${r.cud_vo.cud_id} <span><i
													class="icon-clock primary-color"></i> ${r.rew_date}</span>
											</h6>
											<p>${r.rew_content}</p>
											<%-- <a href="#." onclick="reply()" class="raply"> <i
												class="icon-bubble primary-color"></i> Reply
											</a>
											<div id='reply_div' style="display: none">
												<textarea class="form-control" id="reply_textarea"
													name='reply_textarea' rows="3" placeholder=""></textarea>
												<button type="submit" class="btn margin-top-30"
													id="reply_submit">작성 완료</button>
											</div>
											<ul>
												<c:forEach var='t' items=''>
													<li class="media padding-left-100">
														<div class="media-body">
															<h6 class="media-heading">
																${t.cud_vo.cud_id} <span><i
																	class="icon-clock primary-color"></i> ${t.rew_date}</span>
															</h6>
															<p>${t.rew_content}</p>
														</div>
													</li>
												</c:forEach>
											</ul> --%>
										</div>
									</li>
								</c:forEach>

								<!--=======  LEAVE COMMENTS =========-->

								<h5 class="shop-tittle margin-top-80">리뷰를 작성해주세요</h5>
								<form class="padding-left-15" name="review_form" method='post'
									action='review_insert.prod'>
									<ul class="row">
										<li class="col-sm-12"><label> <textarea
													class="form-control" name="review_textarea"
													id="review_textarea" placeholder=""></textarea>
										</label></li>
										<li class="col-sm-12">
											<button type="submit" class="btn margin-top-30"
												name="review_submit" id="review_submit"
												onclick="add_review()">작성 완료</button>
										</li>
									</ul>
									<input type='hidden' name='review_prod_code'
										id='review_prod_code' value='' />

								</form>
							</ul>
						</div>
					</div>

				<!-- QNA -->
					<div role="tabpanel" class="tab-pane fade" id="qna">
						<div class="comments margin-top-80">
							<h5 class="shop-tittle margin-bottom-30">질문 / 답변</h5>
							
							<form class="padding-left-15" name="qna_form" >
							<input type='hidden' name='prod_code' value='${param.prod_code }'/>
							<ul class="media-list padding-left-15">
								
								<!--=======  COMMENTS =========-->
								
								<c:forEach var="q" items='${qna }'>
								<li class="media">
									<div class="media-body">
										<h6 class="media-heading" name="cud_name">
											${q.cud_name } <span name="qna_date"><i
												class="icon-clock primary-color"></i> ${q.qna_date }  <a href="#" onclick='delete_qna()' ><i class="icon-close"></i></a> ${fail}</span>
										</h6>
										<p>
											${q.qna_content }
										</p>
										
										<input type='hidden' name='q_seq' value='${q.qna_code}'/>
										<c:if test='${vo.cud_id eq "admin"}'>
										<a href="#." onclick="qna_reply()" class="raply">
											<i class="icon-bubble primary-color"></i> Reply
										</a>
										
										<div id='qna_reply_div' style="display: none">
											<textarea class="form-control" id="qna_reply_textarea" name="qna_reply_textarea" rows="3"></textarea>
											<input type='hidden' name='depth' value='${q.qna_deep }'/>
											<input type='hidden' name='q_seq' value='${q.qna_code}'/>
											<button type="button" class="btn margin-top-30" id="qna_reply_submit">작성 완료</button>
										</div>
										</c:if>
									</div>
								</li>
								</c:forEach>
								
							<!--=======  LEAVE COMMENTS =========-->
							
							<h5 class="shop-tittle margin-top-80">질문을 작성해주세요</h5>
								<ul class="row">
									<li class="col-sm-12">
										<label>
											<textarea class="form-control" id="qna_textarea" name="qna_content"></textarea>
										</label>
									</li>
									<li class="col-sm-12">
										<button type="button" class="btn margin-top-30" id="qna_submit" >작성 완료</button>
									</li>
								</ul>
							</ul>
							</form>
						</div>
					</div>

					<!-- TAGS -->
					<div role="tabpanel" class="tab-pane fade" id="tags"></div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
	/* function add_review() {
		var df = document.review_form;
		df.review_prod_code.value = document.getElementById("prod_code_send").value;
		var text = df.review_textarea.value;
		df.review_content.value = text;
		alert(df.review_prod_code.value);
		alert(df.review_content.value);
	df.action = "review_insert.prod";
	df.submit();
	}  */
	document.review_form.onsubmit = function() {
		var df = document.review_form;
		df.review_prod_code.value = document.find_str_now_page_form.prod_code.value;
		df.submit();
	}

/* 	document.reply_form.onsubmit = function() {
		var df = document.reply_form;
		df.review_prod_code.value = document.find_str_now_page_form.prod_code.value;
		df.submit();
	} */

	function compute_count() {
		document.getElementById("total_price").innerText = document
				.getElementById("example_number_input").value
				* document.getElementById("price_send").value + " 원";
	}

	function add_cart() {
		var df = document.find_str_now_page_form;
		df.method = "POST";
		df.crt_cnt.value = document.getElementById("example_number_input").value;
		df.pho_rename2.value = document.getElementById("rename2_send").value;
		df.prod_price.value = document.getElementById("price_send").value;
		df.prod_name.value = document.getElementById("name_send").value;

		if (df.cud_id.value == null || df.cud_id.value == ""){
			df.action = "index.jsp?content=member/login.jsp";
 			df.submit();
		} else {
			alert("장바구니에 추가");
 			df.action = "add_cart.crt";
			df.submit();
		}
	}

	//상품 갯수, 사진 경로, 가격, 상품 이름을 checkoutData.crt로 보냅니다.
	function checkout() {
		var df = document.checkoutFrm;
		df.method = "POST";
		df.prod_pric0.value = document.getElementById("price_send").value;
		df.prod_name0.value = document.getElementById("name_send").value;
		alert("구매");
		df.action = "checkoutData.crt";
		df.submit();
	}

	//로그인 여부에 따른 리뷰의 textarea, button을 enabled, disabled 지정
	function editable() {
		var df = document.find_str_now_page_form;
		document.getElementById("review_textarea").disabled = true;
		document.getElementById("review_submit").disabled = true;
		if (document.find_str_now_page_form.cud_id.value != 'admin') {
			if (document.getElementById("reply_submit") !== null) {
				document.getElementById("reply_submit").disabled = true;
				document.getElementById("reply_textarea").disabled = true;
			}
			if (df.cud_id.value === null || df.cud_id.value === "") {
				document.getElementById("review_textarea").placeholder = "로그인 후 리뷰를 작성할 수 있습니다.";
				if (document.getElementById("reply_submit") !== null) {
					document.getElementById("reply_textarea").placeholder = "로그인 후 리뷰 댓글을 작성할 수 있습니다.";
				}
			} else {
				if (df.prod_review.value == "false") {
					document.getElementById("review_textarea").placeholder = "상품 구매 후 리뷰를 작성할 수 있습니다.";
					if (document.getElementById("reply_submit") !== null) {
						document.getElementById("reply_textarea").placeholder = "상품 구매 후 리뷰 댓글을 작성할 수 있습니다.";
					}
				} else if (df.prod_review.value == "true") {
					document.getElementById("review_textarea").disabled = false;
					document.getElementById("review_submit").disabled = false;
					document.getElementById("review_textarea").placeholder = "";
					if (document.getElementById("reply_submit") !== null) {
						document.getElementById("reply_submit").disabled = false;
						document.getElementById("reply_textarea").placeholder = "";
						document.getElementById("reply_textarea").disabled = false;
					}
				}
			}
		} else {
			document.getElementById("review_textarea").disabled = true;
			document.getElementById("review_submit").disabled = true;
			document.getElementById("review_textarea").placeholder = "관리자는 리뷰를 작성할 수 없습니다.";

		}
	}
	
	function qna_editable() {
		var df = document.find_str_now_page_form;
		document.getElementById("qna_textarea").disabled = true;
		document.getElementById("qna_submit").disabled = true;
		 if(document.getElementById("qna_reply_submit") !== null) {
			document.getElementById("qna_reply_submit").disabled = true;
			document.getElementById("qna_reply_textarea").disabled = true;
		 }
		
 		if(df.cud_id.value === null || df.cud_id.value === "") {
 			document.getElementById("qna_textarea").disabled = false;
 			document.getElementById("qna_textarea").placeholder = "로그인 후 qna를 작성할 수 있습니다.";
 		} else if (df.cud_id.value === "admin"){
 			if (document.getElementById("qna_textarea") != null){
 				document.getElementById("qna_reply_textarea").disabled = false;	
 				document.getElementById("qna_reply_textarea").placeholder = "답변을 작성해주세요.";
 				document.getElementById("qna_reply_submit").disabled = false;
 			} 			
 			
 		} else { 
 			document.getElementById("qna_textarea").disabled = false;
 			document.getElementById("qna_submit").disabled = false;
 			
 			
 		}
	}

	//reply 버튼 컨트롤
	function reply() {
		var dr = document.getElementById("reply_div");
		if (dr.style.display === "none") {
			dr.style.display = "block";
		} else {
			dr.style.display = "none";
		}
	}
	
	//reply 버튼 컨트롤 for qna
	function qna_reply() {
		var dq = document.getElementById("qna_reply_div");
		if(dq.style.display === "none") {
			dq.style.display = "block";
		} else {
			dq.style.display = "none";
		}
	}
	
	function go_servlet(){
		if (document.getElementById("qna_reply_submit") != null){
			document.getElementById("qna_reply_submit").onclick = function(){
				document.qna_form.action = "insert_a.prod";
				document.qna_form.submit();
			}
		}
		if (document.getElementById("qna_submit") != null){
			document.getElementById("qna_submit").onclick = function(){
				document.qna_form.action = "insert_q.prod";
				document.qna_form.submit();
			}
	
		}
	}
		
	function delete_qna(){
		var pwd = prompt("삭제를 위해 로그인 비밀번호를 입력해주세요");
		if ('${vo.cud_pwd == pwd}'){
			document.qna_form.action = "delete_qna.prod";
			document.qna_form.submit();
		} else {
			alert("비밀번호가 틀렸습니다.");
			return;
		}
		
	}
	editable();
	qna_editable();
	go_servlet();
</script>