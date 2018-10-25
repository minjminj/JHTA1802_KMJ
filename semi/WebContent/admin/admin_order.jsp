<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="js/sectionMove.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#admin_order_list {
	padding: 10px;
	box-sizing: border-box;
}

.shopping-cart>.admin-title {
	text-align: center;
	margin: 10px;
	font-weight: bold;
	font-size: 40px;
	padding: 10px;
	border-bottom: solid 1px #eeeeee;
}

.area {
	margin: 0;
	padding: 0;
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -moz-flex;
	display: -webkit-flex;
	display: flex;
	justify-content: space-between;
	list-style: none;
}

.area:before {
	display: inline-block;
	width: 1px;
	content: '';
}

.area:after {
	display: inline-block;
	width: 1px;
	content: '';
}

.admin_btn_label {
	text-align: center;
	width: 200px;
}

.admin_btn_label>.btn {
	margin: 30px;
}

#find_order {
	margin-top: 0px;
}

.col-md-4>.admin_find_label {
	text-align: right;
	margin: 0px;
}

.admin_btn_list_info {
	margin-top: 0px;
	height: 44px;
	box-sizing: border-box;
}

.admin_find_label {
	text-align: right;
	margin: 0px;
}

.area>.col-md-1, .area>.col-md-2, .area>.col-md-3 {
	text-align: left;
	padding: 3px;
	margin-top: 3px;
	font-size: 14px;
}

.col-md-2>.admin_btn_list {
	width: 40px;
	height: 20px;
	box-sizing: border-box;
	border: none;
	padding: 2px;
	font-size: 12px;
	outline: none;
	background: #e83735;
	color: #111111;
}

.admin_btn_list:hover {
	background: gold;
	color: red;
}

.admin_list_output {
	padding: 15px;
	box-sizing: border-box;
	margin-top: 10px;
	margin-bottom: 30px;
}

.admin_find_label {
	text-align: right;
}

.admin_list_element_info {
	border-top: solid 1px black;
	border-bottom: solid 1px black;
	background: #eeeeee;
	color: white;
}

.admin_list_element_info>.area>.col-md-1, .admin_list_element_info>.area>.col-md-2, .admin_list_element_info>.area>.col-md-3
	{
	padding: 4px;
	font-weight: bold;
}

.admin_list_element {
	border-bottom: solid 1px black;
}

.area>.admin_list_btn_info {
	text-align: center;
}

.area>.admin_list_btns {
	text-align: center;
}

.admin_list_page_buttons {
	display: inline-block;
	width: 100%;
}

.admin_list_page_buttons>.admin_list_page_btn_wrap {
	text-align: center;
}

.admin_btn_list_page {
	width: 50px;
	height: 40px;
	border-radius: 25px;
	background: #e3f254;
	border: 0px;
	box-shadow: none;
	outline: none;
	font-weight: bold;
	font-family: sans-serif;
	padding: 5px;
	box-sizing: border-box;
}

.admin_btn_list_page:hover {
	background: gold;
}
</style>

</head>

<body>
	<!-- Content -->
	<div id="content">

		<!--======= PAGES INNER =========-->
		<section class="chart-page padding-top-100 padding-bottom-100">

		<div class="container">


			<div class="shopping-cart">
				<h6 class="admin-title">ORDER</h6>
				<div class="cart-ship-info register">
					<div class="row">


						<div class="col-sm-12">

							<div class="col-md-12">
								<!-- LIST -->
								<h6>LIST</h6>

								<form name='admin_order_list' method='post'>

									<div class="admin_list_output" class="col-md-12">
										<ul class="row">

											<li class="col-md-10"><label> <input type='text'
													name='find_str' id="find_order" value="${param.findStr }" />
											</label></li>
											<li class="col-md-2"><label class="admin_find_label">
													<button type='button' class="btn admin_btn_list_info">주문검색</button>
											</label></li>
										</ul>
								</form>

								<div class="admin_list_element_info">
									<ul class="area">
										<li class="col-md-2">주문번호</li>
										<li class="col-md-3">품목</li>
										<li class="col-md-1">수취인</li>
										<li class="col-md-2">주소</li>
										<li class="col-md-1">금액</li>
										<li class="col-md-1">주문일자</li>
										<li class="col-md-2 admin_list_btn_info">배송(취소/완료)</li>
									</ul>
								</div>


								<c:forEach var="vo" items='${list }'>

									<div>

										<div class="admin_list_element">
											<ul class="area">
												<li class="col-md-2">H20180724</li>
												<li class="col-md-3">아라비카100, 맥심아이스</li>
												<li class="col-md-1">김민수</li>
												<li class="col-md-2">서울시 광진구 자양동</li>
												<li class="col-md-1">117000</li>
												<li class="col-md-1">2018-07-24</li>
												<li class="col-md-2 admin_list_btns">
													<button type="button" class="admin_btn_list"
														onclick="view_prod()">취소</button>
													<button type="button" class="admin_btn_list" name="#"
														id="#">완료</button>
												</li>
											</ul>
										</div>
										<div class="admin_list_element">
											<ul class="area">
												<li class="col-md-2">H20180724</li>
												<li class="col-md-3">아이스바닐라라떼 그란데사이즈 샷추가 얼음조금 우유많이</li>
												<li class="col-md-1">김민수</li>
												<li class="col-md-2">서울시 광진구 자양동</li>
												<li class="col-md-1">145000</li>
												<li class="col-md-1">2018-07-24</li>
												<li class="col-md-2 admin_list_btns">
													<button type="button" class="admin_btn_list"
														onclick="view_prod()">취소</button>
													<button type="button" class="admin_btn_list" name="#"
														id="#">완료</button>
												</li>
											</ul>
										</div>
									</div>

								</c:forEach>

							</div>


							<div class="col-md-12 admin_list_page_buttons">
								<div class="admin_list_page_btn_wrap">
									<c:if test='${dao.nowBlock>1}'>
										<button id="btn_first" class="admin_btn_list_page"
											onclick='movePage(1)'>&lt;&lt;</button>
										<button id="btn_prev" class="admin_btn_list_page"
											onclick='movePage(${dao.startPage-1 })'>&lt;</button>
									</c:if>

									<c:forEach var='p' begin='${dao.startPage }'
										end='${dao.endPage}'>
										<c:set var='here' value='' />
										<c:if test='${p == dao.nowPage }'>
											<c:set var='here' value="here" />
										</c:if>
										<button id="btn_now_page" class="admin_btn_list_page"
											onclick='movePage(${p})'>
											<%-- ${p } --%>
											now
										</button>
									</c:forEach>

									<c:if test='${dao.nowBlock < dao.totBlock}'>
										<button id="btn_next" class="admin_btn_list_page"
											onclick='movePage(${dao.endPage+1})'>&gt;</button>
										<button id="btn_last" class="admin_btn_list_page"
											onclick='movePage(${dao.totPage})'>&gt;&gt;</button>
									</c:if>
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
		</div>


		</section>
	</div>
</body>
</html>