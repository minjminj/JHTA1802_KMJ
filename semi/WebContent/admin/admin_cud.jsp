<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/sectionMove.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.mask {
			position: absolute;
			left: 0;
			top: 0px;
			z-index: 9000;
			display: none;
			margin: 0;
			padding: 0px;
			box-sizing: border-box;
			background: rgba(0,0,0,0.7);
		}
		.conMain {
			position: fixed;
		    width: 550px;
		    left: 50%;
		    margin-left: 0;
		    top: 240px;
		    display: none;
		    background-color:white;
		    box-sizing: border-box;
		}
		
		.conHead {
			height: 100px;
		    line-height: 120px;
		    background: white;
		    font-size: 36px;
		    color: #fff;
		    padding: 10px;
		    font-weight: 400;
		    border-bottom: solid 1px black;
		    margin-bottom: 20px;
		}
		.title{
		    height: 70px;
		    line-height: 80px;
		    background: white;
		    font-size: 36px;
		    color: #black;
		    padding: 0 50px;
		    font-weight: 400;
		    margin-top: 0px;
		}
		.title:before{
			width:0px;
		}
		.conMain>.col-md-12{
			background: white;
		}
		.conContent{
			margin-bottom: 20px;
		}
		#admin_cud_list {
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
		
		#find_cud {
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
		
		.area>.col-md-2, .area>.col-md-3 {
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
		
		.admin_list_element_info>.area>.col-md-2, .admin_list_element_info>.area>.col-md-3
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
		#mask3>.admin_list_page_buttons{
			margin: 15px;
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
				<h6 class="admin-title">CUSTOMER</h6>
				<div class="cart-ship-info register">
					<div class="row">


						<div class="col-sm-12">
						
							
							<!-- CUD_VIEW -->
							<div class ="mask" id="mask3">
								<div style="display:none;" id="conCudList" class='conMain'>
									<div class = 'conHead'>
									   <h2 class = 'title' style ="text-align:center;">김민수님의 내역</h2>
									</div>
									
									<div class="col-md-12 conContent">
		
										<div class="admin_list_element_info">
											<ul class="area">
												<li class="col-md-2">주문번호</li>
												<li class="col-md-2">품목</li>
												<li class="col-md-2">금액</li>
												<li class="col-md-2">주문일자</li>
											</ul>
										</div>
		
										<c:forEach var="vo" items='${list }'>
		
											<div>
												<div class="admin_list_element">
													<ul class="area">
														<li class="col-md-2">H20180724</li>
														<li class="col-md-2">아라비카100, 맥심아이스</li>
														<li class="col-md-2">117000</li>
														<li class="col-md-2">2018-07-24</li>
													</ul>
												</div>
												<div class="admin_list_element">
													<ul class="area">
														<li class="col-md-2">H20180724</li>
														<li class="col-md-2">아이스바닐라라떼 그란데사이즈 샷추가 얼음조금 우유많이</li>
														<li class="col-md-2">145000</li>
														<li class="col-md-2">2018-07-24</li>
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
									
									<div>
				                      <label class="admin_btn_label">
					                      <button type="button" class="btn admin_btn_close" name="admin_btn_close" id="admin_cud_view_close">닫기</button>
				                      </label>										
									</div>
									
								</div>
							</div>
							

							<div class="col-md-12">
								<!-- LIST -->
								<h6>LIST</h6>

								<form name='admin_cud_list' method='post'>

									<div class="admin_list_output" class="col-md-12">
										<ul class="row">

											<li class="col-md-10"><label> <input type='text'
													name='find_str' id="find_cud" autocomplete="off" value="${param.findStr }" />
											</label></li>
											<li class="col-md-2"><label class="admin_find_label">
													<button type='button' class="btn admin_btn_list_info" onclick="admin_search_cud_list(find_str.value)">회원검색</button>
											</label></li>
										</ul>
										<input type='hidden' name='nowPage'value='${empty param.nowPage ? 1 : param.nowPage }'/>
										<input type='hidden' name='cud_code' />
								</form>

								<div class="admin_list_element_info">
									<ul class="area">
										<li class="col-md-2">회원번호</li>
										<li class="col-md-2">ID</li>
										<li class="col-md-2">이름</li>
										<li class="col-md-2">연락처</li>
										<li class="col-md-2">총 구매액</li>
										<li class="col-md-2 admin_list_btn_info">관리(상세/추방)</li>
									</ul>
								</div>


								<c:forEach var="cvo" items='${list }'>

									<div>

										<div class="admin_list_element">
											<ul class="area">
												<li class="col-md-2">${cvo.cud_code }</li>
												<li class="col-md-2">${cvo.cud_id }</li>
												<li class="col-md-2">${cvo.cud_name }</li>
												<li class="col-md-2">${cvo.cud_phone }</li>
												<li class="col-md-2"></li>
												<li class="col-md-2 admin_list_btns">
													<button type="button" class="admin_btn_list"
														onclick="view_cud()">상세</button>
													<button type="button" class="admin_btn_list" name="#"
														id="#" onclick="admin_cud_delete('${cvo.cud_code}')">추방</button>
												</li>
											</ul>
										</div>
									</div>

								</c:forEach>

							</div>


							<div class="col-md-12 admin_list_page_buttons">
								<div class="admin_list_page_btn_wrap">
									<c:if test='${dao.nowBlock>1}'>
										<button id="btn_first" class="admin_btn_list_page" onclick ='movePage(1)'>&lt;&lt;</button>
										<button id="btn_prev" class="admin_btn_list_page" onclick ='movePage(${dao.startPage-1 })'>&lt;</button>
									</c:if>
									
									<c:forEach var='p' begin='${dao.startPage }' end='${dao.endPage}'>
										<c:set var='here' value=''/>
										<c:if test='${p == dao.nowPage }'>
											<c:set var='here' value="here" />
										</c:if>
										<button id="btn_now_page" class="admin_btn_list_page" class="${here }" value="${p }" onclick ='movePage(${p})'>${p }</button>
									</c:forEach>
									
									<c:if test = '${dao.nowBlock < dao.totBlock}'>
										<button id="btn_next" class="admin_btn_list_page" onclick ='movePage(${dao.endPage+1})'>&gt;</button>
										<button id="btn_last" class="admin_btn_list_page" onclick ='movePage(${dao.totPage})'>&gt;&gt;</button>
									</c:if>
								</div>
							</div>
							
							
							

						</div>

					</div>

				</div>
			</div>
		</div>
		
		<script>
		
			var fcl = document.admin_cud_list;
			
			function admin_cud_delete(cudCode){
				fcl.cud_code.value = cudCode;
				alert("comming soon");
/* 				
				fcl.action = 'cudDelete.admin';
				fcl.method = 'post';
				fcl.submit();
*/
			}
			
        	function admin_search_cud_list(findStr){
        		fcl.find_str.value = findStr;
        		fcl.action = 'cud.admin';
        		fcl.method = 'post';
        		fcl.submit();
        	}
        	
        	function movePage(nowPage){
        		fcl.nowPage.value = nowPage;
        		fcl.submit();
        	}
		
		
			$('.admin_btn_close').click(function () {  
	            //링크 기본동작은 작동하지 않도록 한다.
				$('#mask3').hide(); 
			});

			function view_cud() {
				alert("coming soon");
/* 			    
			    var con = document.getElementById("conCudList");
			    var maskHeight = $(document).height();
			    var maskWidth = $(window).width();
			    var ff = document.conFrm;
			    
			    con.style.display = 'block';
			    
			    if (con.style.display == 'block') {
			       $('#mask3').css({
			          'width' : maskWidth,
			          'height' : maskHeight
			       });
			       
			       //애니메이션 효과
			       $('#mask3').fadeTo("fast", 1.0);
			       $('#conCudList').css(background , 'rgba(0,0,0,0)');
			    } else {
			
			    }
*/ 
			}
			
		</script>

		</div>
	</section>
</body>


</html>