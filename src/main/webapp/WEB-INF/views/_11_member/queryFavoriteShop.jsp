<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<script
	src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">

<link rel="stylesheet"
	href="<c:url value='_00_util/memberUtil/css/member_coupon.css'/>">
	
<style>
remove-product i{
	color: #555;
}
.cancelBtn{
	position: absolute;
    font-size: 1rem;
    transition:.1s;
    right: 6px;
    top: 4px;
}
.cancelBtn:hover{
	font-size: 1.2rem;
}
.card{
	height:220px;
}


</style>
</head>


<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- Start:header -->
	<!-- ????????????????????? -->
	<!-- <a href="#" class="toTop"><i class="fas fa-arrow-up"></i></a> -->


<%-- 		<h1>${title}</h1> --%>
<%-- 				<p>${subtitle}</p><h1>${title}</h1> --%>
<%-- 				<p>${subtitle}</p><h1>${title}</h1> --%>

	<!-- ????????? -->
<!-- 	<div id="Marquee"> -->
<!-- 		<h3>??????????????????:</h3> -->
<!-- 		<ul id="news"> -->
<!-- 			<li>????????????????????? !</li> -->
<!-- 			<li>????????????</li> -->
<!-- 			<li>??????????????????????????????</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	<!-- ??????????????? -->

	<!-- ???????????????????????? -->
	<div class="main-member">
	<!-- ?????????????????? -->
	<jsp:include page="/WEB-INF/views/_00_util/memberUtil/jsp/member_aside.jsp" />
	<!-- ?????????????????? -->
<!-- 		<aside > -->
<!--             <div class="function"> -->
<!--                 <h3>????????????</h3> -->
<!-- 				<div class="item"> -->
				
<%-- 		            <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> ' --%>
<!-- 		                  id="headImgg" height='200px' width='200px'> -->
		                  					
<!-- 	            </div> -->
<!--                 <div class="item"> -->
<%--                    	<a href="<c:url value='/member/update/${LoginOK.memberId}'/>"> --%>
<!--                         <button><span>????????????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_23_orderProcess/orderList'/>"> --%>
<!--                         <button><span>????????????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/member/keep/coupons'/>"> --%>
<!--                         <button><span>???????????????</span></button> -->
<!--                     </a>                     -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value="/queryFavoriteShop"/>">  --%>
<!--                         <button><span>????????????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>??????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                 <c:if test="${empty LoginOK.shopBean.shop_id}">	 --%>
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />"> --%>
<!--                         <button><span>????????????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                 </c:if> --%>
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>???????????????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('????????????????');"> --%>
<!--                         <button><span>??????</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </aside> -->

		<!-- ?????????????????????????????? -->
		<!-- ???????????????????????? -->
		<main  class="shadow p-3 mb-5 bg-white rounded">


			<div id="hcg_tabs">

				<div id="tabs-nav">
					<a href="#" class="change">????????????</a>
				</div>

				<!-- 					<div class="tabs-content"> -->
				<!-- ????????????????????????????????? display:block -->
				<!-- 						<div class="tabs-panel" style="display: block"> -->
				<!-- ========================================================================================================= -->
				<div class="row pt-5 row-cols-1 row-cols-md-3" style="padding: 20px">
					<c:forEach var='fslb' items='${fslbList}'>
						<div class="col mb-4" style="position: relative;">
							<div class="card shadow p-4 mb-5 bg-white rounded " >
								<div class="coupon-shop">
								
<%-- 									<a href="<spring:url value='/MyfavoriteShop?memberId=${member_favoriteShops.memberbean}' />"> --%>
											<a
							href="<c:url value='/_50_shop/_54_showShops/ShowShops/${fslb.shop_id}' />">
										<img style="height: 150px;" src="<c:url value='/getShopPicture/${fslb.shop_id}' />"
											class="card-img-top" alt="..." />	</a>		
																															
<!-- 										</a>  -->
<!-- 										<div class="card-body"> -->
											<h5 class="card-title" style="margin-top:5px;">
												${fslb.shop_name} <i id="collect"></i>
											</h5>
<!-- 											<p class="card-text"> -->
<%-- 												${fslb.shop_name} --%>
<!-- 											</p> -->
											<a	href="<spring:url value='/deleteFavoriteShop/${fslb.shop_id}' />">   
												<button class="remove-product"
													onclick="return window.confirm('????????????????')"	type="submit"><i class="fas fa-times cancelBtn"></i>
												</button> 
												</a> 
										</div> <%-- 					????????????${coupon.coupon_days} ??????${coupon.coupon_birth} --%>
										<%-- 					<a href="<spring:url value='/coupon?id=${coupon.coupon_id}' />" class="btn btn-primary">> --%>
										<!-- 						 <span --> <!-- 						class="glyphicon-info-sigh glyphicon"></span>???????????? -->
										<!-- 					</a> -->
								</div>
							</div>
					</c:forEach>
				</div>
				<!-- ===================================================================================================== -->
				<!-- 							<div class="coupon-container"> -->

				<%-- 								<form action=""> --%>
				<!-- 									<div class="coupon-shop"> -->
				<!-- 										<a></a> <img -->
				<%-- 											src="<c:url value='/data/images/couponPic/BBQ1.jpg'/>"> --%>
				<!-- 										<button class="remove-product" -->
				<!-- 											onclick="return window.confirm('????????????????')" type="submit"> -->
				<!-- 											<i class="fas fa-window-close"></i> -->
				<!-- 										</button> -->

				<!-- 									</div> -->
				<%-- 								</form> --%>

				<%-- 								<form action=""> --%>
				<!-- 									<div class="coupon-shop"> -->

				<!-- 										<img -->
				<%-- 											src="<c:url value='/data/images/Taiwan_streetFood/Bubble tea.jpg'/>"> --%>

				<!-- 										<button class="remove-product" -->
				<!-- 											onclick="return window.confirm('????????????????')" type="submit"> -->
				<!-- 											<i class="fas fa-window-close"></i> -->
				<!-- 										</button> -->

				<!-- 									</div> -->
				<%-- 								</form> --%>

				<%-- 								<form action=""> --%>
				<!-- 									<div class="coupon-shop"> -->

				<!-- 										<img src="../img/coupon_03.jpg" alt=""> -->

				<!-- 										<button class="remove-product" -->
				<!-- 											onclick="return window.confirm('????????????????')" type="submit"> -->
				<!-- 											<i class="fas fa-window-close"></i> -->
				<!-- 										</button> -->

				<!-- 									</div> -->
				<%-- 								</form> --%>



				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
			</div>
		</main>

	</div>
	<!-- -------------------------------?????????????????????---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------?????????????????????----------------------------------------- -->
</body>
</html>