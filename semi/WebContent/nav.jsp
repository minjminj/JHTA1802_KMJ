<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>

/* 구매목록 리스트를 눌렸을 때 로그인이 되어있지 않으면 로그인페이지로 되어있으면 리스트로 */

var checkoutList = function() {
	
	if ("${vo.cud_id}" !== "") {
		location.href = "checkoutList.crt";
	
	} else if ("${vo.cud_id}" === ""){
		alert("로그인하세요")
		location.href = "index.jsp?content=member/login.jsp";
		
	}
	
}


</script>
<div class="sticky">
	<div class="container">

		<!-- Logo -->
		<div class="logo">
			<a href="index.jsp"><img class="img-responsive"
				src="images/codingBillain.png" alt=""></a>
		</div>
		<nav class="navbar ownmenu">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#nav-open-btn"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"><i class="fa fa-navicon"></i></span>
			</button>
		</div>

		<!-- NAV -->
		<div class="collapse navbar-collapse" id="nav-open-btn">
			<ul class="nav">
				
				<li><a href="index.jsp">Home </a></li>
				<li><a href="prod_origin_list.prod" >Origin </a></li>
				<li><a href="prod_blend_list.prod" > Blend</a></li>
				<li><a href="prod_dutch_cold_list.prod" >Dutch / Cold </a></li>
				<li><a href="index.jsp?content=contact/contact.jsp">Contact </a></li>
			</ul>
		</div>

		<!-- Nav Right -->
		<div class="nav-right">
			<ul class="navbar-right">

				<!-- USER INFO -->
				<li class="dropdown user-acc"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"><i
						class="icon-user"></i> </a>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${!empty vo.cud_id}">
								<li>
									<h6>${vo.cud_id} 님 안녕하세요</h6>
								</li>
								<li><a href="go_cart.crt?id=${vo.cud_id}">MY CART</a></li>
								<c:choose>
								<c:when test='${vo.cud_id eq "admin" }'>
								<li><a href="prod.admin">prod_admin</a></li>
								<li><a href="cud.admin">cud_admin</a></li>
<!-- 								<li><a href="order.admin">order_admin</a></li> -->
								</c:when>
								</c:choose>
								<li><a href="userInfo.cud">USER INFO</a></li>
								<li><a href="logout.cud">LOG OUT</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="index.jsp?content=member/login.jsp">LOGIN</a></li>
								<li><a href="register.cud">REGISTER</a></li>
							</c:otherwise>
							
						</c:choose>
					</ul></li>

				<!-- USER BASKET -->
				<li class="dropdown user-acc"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="true"><i
						class="icon-basket-loaded"></i> </a>
					<ul class="dropdown-menu">
						
						<li><a href="go_cart.crt?id=${vo.cud_id}">VIEW CART</a></li>
								
						<li><a onclick="checkoutList()">Checkout List</a></li>
						
						<!-- <li><a href="index.jsp?content=cart/checkout.jsp">CHECK OUT</a></li> -->		
		
					</ul></li>

				<!-- SEARCH BAR -->
				<li class="dropdown"><a href="javascript:void(0);"
					class="search-open"><i class=" icon-magnifier"></i></a>
					<div class="search-inside animated bounceInUp">
						<i class="icon-close search-close"></i>
						<div class="search-overlay"></div>
						<div class="position-center-center">
							<div class="search">
								<form>
									<input type="search" placeholder="Search Shop">
									<button type="submit">
										<i class="icon-check"></i>
									</button>
								</form>
							</div>
						</div>
					</div></li>
			</ul>
		</div>
		</nav>
	</div>
</div>