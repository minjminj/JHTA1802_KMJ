<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/sectionMove.js"></script> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">
		.here{
			border:0px ;
			background-color: #ffffff;
		}
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
		.output-picture{
			width: 100%;
			box-sizing: border-box;
			background: white;
			box-sizing: border-box;
		}
		.output-picture>img{
			width: 120px;
			height: 180px;
			border: solid 1px black;
			box-sizing: border-box;
			cursor: auto;
		}
		.admin_register_elements{
			padding: 7px;
			box-sizing: border-box;
		}
		#admin_prod_register{
			padding: 10px;
			box-sizing: border-box;
		}
		#admin_prod_list{
			padding: 10px;
			box-sizing: border-box;
		}
		.area>#admin_list_btns{
			text-align: center;
		}
		.item>.btn{
			width: 120px;
		}
		.output-picture .area > li {
			width:120px;
			height:180px;
		}
		.output-picture .area > li >img {
			width:100%;
			height:100%;
		}
		.shopping-cart>.admin-title{
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
			
		.item {
			display: inline-block;
			color: #fff;
			text-align: center;
			line-height: 30px;
		}
		.admin_btn_label{
			text-align: center;
			width: 200px;
		}
		.admin_btn_label>.btn{
			margin: 30px;
		}
		#find_prod{
			margin-top: 0px;
		}
		.admin_btn_list_info{
			margin-top: 0px;
			height: 44px;
			box-sizing: border-box;
		}
		.col-md-4>.admin_find_label{
			text-align: right;
			margin: 0px;
		}
		.area>.col-md-2, .area>.col-md-3{
			text-align: left;
			padding: 3px;
			margin-top: 3px;
			font-size: 14px;
		}
		.col-md-2>.admin_btn_list{
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
		.admin_btn_list:hover{
			background: gold;
			color: red;
		}
		#admin_list_output{
			padding: 15px;
			box-sizing: border-box;
			margin-top: 10px;
			margin-bottom: 30px;
		}
		.admin_find_label{
			text-align: right;
		}
		#admin_list_btns{
			text-align: right;
		}
		.admin_list_element_info{
			border-top: solid 1px black;
			border-bottom: solid 1px black;
			background: #eeeeee;
			color: white;
		}
		.admin_list_element_info>.area>.col-md-2, .admin_list_element_info>.area>.col-md-3{
			padding: 4px;
			font-weight: bold;
		}
		.admin_list_element{
			border-bottom: solid 1px black;
		}
		.area>#admin_list_btn_info{
			text-align: center;
		}
		#admin_list_page_buttons{
			display: inline-block;
			width: 100%;
		}
		#admin_list_page_buttons>.admin_list_page_btn_wrap{
			text-align: center;
		}
		.admin_btn_list_page{
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
		#prod_reg_file1, #prod_reg_file2, #prod_reg_file3, #prod_reg_file4,
			#prod_view_file1, #prod_view_file2, #prod_view_file3, #prod_view_file4 {
			display: none;
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
	  <h6 class="admin-title">PRODUCT</h6>
      <div class="cart-ship-info register">
        <div class="row"> 

        
		<div class="col-sm-12">
		
		<!-- REGISTER -->
		<div class ="mask" id="mask1">
			<div style="display:none;" id="con_register" class='conMain'>
				<div class = 'conHead'>
				   <h2 class = 'title' style ="text-align:center;">REGISTER</h2>
				</div>
				<div class="col-md-12">
				
					<form name="admin_prod_register">
						<div class="output-picture">
							<ul class="area">
								<li class="item"><img id="prod_reg_img1" src="http://placehold.it/120X180"	class="prod_reg_img"/></li>
								<li class="item"><img id="prod_reg_img2" src="http://placehold.it/120X180"	class="prod_reg_img"/></li>
								<li class="item"><img id="prod_reg_img3" src="http://placehold.it/120X180"	class="prod_reg_img"/></li>
								<li class="item"><img id="prod_reg_img4" src="http://placehold.it/120X180"	class="prod_reg_img"/></li>
							</ul>
						</div>
						<br/>
						
						<div class="output-picture">
							<ul class="area">
								<input type="file" id="prod_reg_file1" class="prod_reg_file" name="file1" />
								<input type="file" id="prod_reg_file2" class="prod_reg_file" name="file2" />
								<input type="file" id="prod_reg_file3" class="prod_reg_file" name="file3" />
								<input type="file" id="prod_reg_file4" class="prod_reg_file" name="file4" />
							</ul>
						</div>
						
						<div class="admin_register_elements">
							<ul class="row">
							
								<!-- prod_name -->
			                    <li class="col-md-6">
			                      <label> <strong>*품명</strong>
			                        <input type="text" name="prod_name" value="" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_price -->
			                    <li class="col-md-6">
			                      <label> <strong>*가격</strong>
			                        <input type="text" name="prod_price" value="" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_inven -->
			                    <li class="col-md-6">
			                      <label> <strong>*입고(EA)</strong>
			                        <input type="text" name="prod_inven" value="" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_region -->
			                    <li class="col-md-6">
			                      <label> <strong>*지역</strong>
			                        <input type="text" name="prod_region" value="" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_cate -->
	                            <li class="col-md-6">
			                      <label> <strong>*분류</strong>
			                        <select class="selectpicker" name="prod_cate">
			                          <option>ORIGIN</option>
			                          <option>BLEND</option>
			                          <option>DUTCH / COLD</option>
			                        </select>
			                      </label>
			                    </li>
			                    
								<!-- prod_content -->
			                    <li class="col-md-6">
			                      <label> <strong>*내용</strong>
			                        <input type="text" name="prod_content" value="" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- button -->
								<li class="col-md-6">
			                      <label class="admin_btn_label">
				                      <button type="button" class="btn" name="admin_btn_register" id="admin_btn_register">등록</button>
			                      </label>
			                    </li>
								<li class="col-md-6">
			                      <label class="admin_btn_label">
				                      <button type="button" class="btn admin_btn_close" name="admin_btn_close" id="admin_prod_register_close">닫기</button>
			                      </label>
			                    </li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<!-- VIEW -->
		<div class ="mask" id="mask2">
			<div style="display:none;" id="conView" class='conMain'>
				<div class = 'conHead'>
				<h2 class = 'title' style ="text-align:center;">VIEW</h2>
				</div>
				<div class="col-md-12">
				
					<form name="admin_prod_view">
						<div class="output-picture">
							<ul class="area">
								<li class="item"><img id="prod_view_img1" src="http://placehold.it/120X180"	class="prod_view_img"/></li>
								<li class="item"><img id="prod_view_img2" src="http://placehold.it/120X180"	class="prod_view_img"/></li>
								<li class="item"><img id="prod_view_img3" src="http://placehold.it/120X180"	class="prod_view_img"/></li>
								<li class="item"><img id="prod_view_img4" src="http://placehold.it/120X180"	class="prod_view_img"/></li>
							</ul>
						</div>
						<br/>
						
						<div class="output-picture">
							<ul class="area">
								<input type="file" id="prod_view_file1" class="prod_view_file" name="file1" />
								<input type="file" id="prod_view_file2" class="prod_view_file" name="file2" />
								<input type="file" id="prod_view_file3" class="prod_view_file" name="file3" />
								<input type="file" id="prod_view_file4" class="prod_view_file" name="file4" />
							</ul>
						</div>

						<div class="admin_register_elements">
							<ul class="row">
							
								<!-- prod_name -->
			                    <li class="col-md-6">
			                    	
			                      <label> <strong>*품명</strong>
			                        <input type="text" name="prod_name" value="${pvo.prod_name }" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- "prod_price" -->
			                    <li class="col-md-6">
			                      <label> <strong>*가격</strong>
			                        <input type="text" name="prod_price" value="${pvo.prod_price }" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_inven -->
			                    <li class="col-md-6">
			                      <label> <strong>*입고(EA)</strong>
			                        <input type="text" name="prod_inven" value="${pvo.prod_inven }" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_region -->
			                    <li class="col-md-6">
			                      <label> <strong>*지역</strong>
			                        <input type="text" name="prod_region" value="${pvo.prod_region }" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- prod_cate -->
	                            <li class="col-md-6">
			                      <label> <strong>*분류</strong>
			                        <select class="selectpicker" name="prod_cate">
			                          <option>ORIGIN</option>
			                          <option>BLEND</option>
			                          <option>DUTCH / COLD</option>
			                        </select>
			                      </label>
			                    </li>
			                    
								<!-- prod_content -->
			                    <li class="col-md-6">
			                      <label> <strong>*내용</strong>
			                        <input type="text" name="prod_content" value="${pvo.prod_content }" autocomplete="off">
			                      </label>
			                    </li>
			                    
								<!-- BUTTON -->
								<li class="col-md-6">
			                      <label class="admin_btn_label">
				                      <button type="button" class="btn" name="admin_btn_view_modify" id="admin_btn_view">수정</button>
			                      </label>
			                    </li>
								<li class="col-md-6">
			                      <label class="admin_btn_label">
				                      <button type="button" class="btn admin_btn_close" name="admin_btn_close" id="admin_prod_view_close">닫기</button>
			                      </label>
			                    </li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
			
			<div class="col-md-12">
			<!-- LIST -->
			<h6>LIST</h6>
			
				<form name='admin_prod_list' method='post'>
					
				<div id="admin_list_output" class="col-md-12">
					<ul class="row">
						
	                    <li class="col-md-10">
	                    	<label>
								<input type='text' name='find_str' id="find_prod" value="${param.findStr }" />
	                    	</label>
						</li>
	                    <li class="col-md-2">
	                    	<label class="admin_find_label">
								<button type='button' class="btn admin_btn_list_info" onclick="admin_search_list(find_str.value)">상품검색</button>
	                    	</label>
						</li>
	                    <li class="col-md-2">
	                    	<label class="admin_find_label">
								<button type='button' class="btn admin_btn_list_info" onclick="register_prod()">상품등록</button>
	                    	</label>
						</li>
					</ul>
					<input type='hidden' name='nowPage'value='${empty param.nowPage ? 1 : param.nowPage }'/>
					<input type='hidden' name='prod_code' />
				</form>
				
				

					<div class="admin_list_element_info">
						<ul class="area">
							<li class="col-md-3">품번</li>
							<li class="col-md-3">품명</li>
							<li class="col-md-2">판매량</li>
							<li class="col-md-2">재고</li>
							<li class="col-md-2" id="admin_list_btn_info">기능</li>
						</ul>
					</div>
					

					<c:forEach var="pvo" items='${list }'>
					
						

							<div class="admin_list_element">
								<ul class="area">
									<li class="col-md-3">${pvo.prod_code }</li>
									<li class="col-md-3">${pvo.prod_name }</li>
									<li class="col-md-2">${pvo.prod_inven }</li>
									<li class="col-md-2">${pvo.prod_inven }</li>
									<li class="col-md-2" id="admin_list_btns">
										<button type="button" class="admin_btn_list" name="#" onclick="view_prod('${pvo.prod_code }')">보기</button>
										<button type="button" class="admin_btn_list" name="#" onclick="delete_prod('${pvo.prod_code }')">삭제</button>
									</li>
								</ul>
							</div>

						
					</c:forEach>
				
				</div>
			
			
				<div class="col-md-12" id='admin_list_page_buttons'>
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
        
        	var fr = document.admin_prod_register;
        	var fv = document.admin_prod_view;
        	var fl = document.admin_prod_list;
        	
            
  			fr.admin_btn_register.onclick = function() {
  				
	       		if (!val(/^[a-zA-z가-힣0-9]{1,}$/, fr.prod_name)){	/*모든 문자열 1글자 이상*/
	       			return;
	       		}else if(!val(/^[0-9]{1,}$/, fr.prod_price)) {    /*숫자만 입력가능*/
		       			return;
	       		} else if(!val(/^[0-9]{1,}$/, fr.prod_inven)) {
	       			return;
	       		}else if(!val(/^[a-zA-z가-힣0-9]{1,}$/, fr.prod_region)) {
		       			return;
		       	}else if(!val(/^[a-zA-z가-힣0-9]{1,}$/, fr.prod_content)) {
	       			return;
	       		} else {
	  			   var msg = confirm("제출하냐?");
	  			   if (msg) {
	  			      alert("제출 되었습니다.");
	  			      var con = document.getElementById("con_register");
	  			      con.style.display = 'none';
	  			      fr.method = 'post';
	  			      fr.enctype = 'multipart/form-data';
	  			      fr.action = 'prodRegisterR.admin';
	  			      fr.submit();
		       		}
  				
  			   }
  			}
  			

	         function val(re, e){
	        	if (re.test(e.value)){
	        		return true;
	        	} else {	
	        		e.focus();
	        		e.value = "";
	        		return false;
	        	}
	        }
        	
        	function admin_search_list(findStr){
        		fl.find_str.value = findStr;
        		fl.action = 'prod.admin';
        		fl.method = 'post';
        		fl.submit();
        	}
        	
        	
        	function movePage(nowPage){
        		fl.nowPage.value = nowPage;
        		fl.submit();
        	}
        	

			
			fr.admin_prod_register_close.onclick = function(){
				var con = document.getElementById("con_register");
				con.style.display = 'none';
			}
			
			fv.admin_prod_view_close.onclick = function(){
				var con = document.getElementById("conView");
				con.style.display = 'none';
			}

			$('.admin_btn_close').click(function () {  
	            //링크 기본동작은 작동하지 않도록 한다.
				$('#mask1').hide(); 
				$('#mask2').hide(); 
			});
	        
        
			function register_prod() {
			    
			    var con = document.getElementById("con_register");
			    var maskHeight = $(document).height();
			    var maskWidth = $(window).width();
			    var ff = document.conFrm;
			    
			    con.style.display = 'block';
			    
			    if (con.style.display == 'block') {
			       $('#mask1').css({
			          'width' : maskWidth,
			          'height' : maskHeight
			       });
			       
			       //애니메이션 효과
			       $('#mask1').fadeTo("fast", 1.0);
			       $('#con_register').css(background , 'rgba(0,0,0,0)');
			    } else {
			
			    }
			    
			}
			
			function delete_prod(prod_code) {
			       alert(prod_code);
			       fl.prod_code.value = prod_code;
			       fl.method = "post";
			       fl.action = "prodDelete.admin";
			       fl.submit();
			}
			
			function view_prod(prod_code) {
			    alert("coming soon");
/* 			       
			    var con = document.getElementById("conView");
			    var maskHeight = $(document).height();
			    var maskWidth = $(window).width();
			    var ff = document.conFrm;
			    
			    con.style.display = 'block';
			    
			    if (con.style.display == 'block') {
			       $('#mask2').css({
			          'width' : maskWidth,
			          'height' : maskHeight
			       });
			       //애니메이션 효과
			       $('#mask2').fadeTo("fast", 1.0);
			       $('#conView').css(background , 'rgba(0,0,0,0)'); 
			    } else {
			
			    }
*/
			} 
			
			
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_reg_img1').click(function (e) {
					e.preventDefault();
					$('#prod_reg_file1').click();
				});
			});
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_reg_img2').click(function (e) {
					e.preventDefault();
					$('#prod_reg_file2').click();
				});
			});
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_reg_img3').click(function (e) {
					e.preventDefault();
					$('#prod_reg_file3').click();
				});
			});
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_reg_img4').click(function (e) {
					e.preventDefault();
					$('#prod_reg_file4').click();
				});
			});
			
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_reg_file1").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    });
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_reg_img1').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_reg_file2").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_reg_img2').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_reg_file3").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_reg_img3').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_reg_file4").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_reg_img4').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
        
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_view_img1').click(function (e) {
					e.preventDefault();
					$('#prod_view_file1').click();
				});
			});
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_view_img2').click(function (e) {
					e.preventDefault();
					$('#prod_view_file2').click();
				});
			});
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_view_img3').click(function (e) {
					e.preventDefault();
					$('#prod_view_file3').click();
				});
			});
			/* 이미지태그 클릭으로 파일찾기 */
		    $(function () {
				$('#prod_view_img4').click(function (e) {
					e.preventDefault();
					$('#prod_view_file4').click();
				});
			});
			
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_view_file1").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_view_img1').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_view_file2").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_view_img2').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_view_file3").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_view_img3').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });
			/* 이미지태그에 이미지 넣기 */
		    $(document).ready(function(){ 
		    	
		    	$("#prod_view_file4").change(function(){ 
		    		//alert(this.value); //선택한 이미지 경로 표시 
		    		readURL(this); 
		    		
		    	});
		    	
		    	function readURL(input) { 
		    		
		    		if (input.files && input.files[0]) { 
		    			
		    			var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
		    			
		    			reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러 
		    				
		    				$('#prod_view_img4').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 //(아래 코드에서 읽어들인 dataURL형식) 
		    				
		    			} 
		    			
		    			reader.readAsDataURL(input.files[0]); //File내용을 읽어 dataURL형식의 문자열로 저장 
		    			
		    		} 
		    		
		    	}//readURL()-- //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드 
		    	
		    });

        </script>
        
      </div>
    </section>
</body>
 

</html>