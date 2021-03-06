<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<!----------------aos ----------------->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<!----------------aos ----------------->
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/9_editProduct.css'/>">
<!----------------aos ----------------->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!----------------aos ----------------->
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
<title>Edit Product</title>
</head>
<body>
	<!-- -------------------------------???????????????????????????------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- -------------------------------???????????????????????????------------------------------------- -->


	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>

	<div class="container pt-4">
		<div class="row">

			<!-- -------------------------?????????????????? --------------------------------------->
			<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- -------------------------?????????????????? --------------------------------------->
			



			<!-- -------------------------????????????????????????-------------------------------------- -->
			<main class="col-8">
				<div class="editBtn">
					<a href="<c:url value='/products/add'/>" id="insertProduct">????????????</a>
					<a href="#" id="upProduct">????????????</a>
					<a href="#" id="downProduct">????????????</a> 
					<a href="#" id="deleteProduct">????????????</a>

						
				</div>

				<div id="productTab">
					<div id="tab_nav">
						<a href="javascript:;" class="tab_selected onsale">???????????????</a> 
						<a href="javascript:;">???????????????</a> 
						<a href="javascript:;">???????????????</a>
					</div>
					<div class="tabs_content content_selected">

						<div class="tabs_panel product_info" style="display: block;">
							<div class="itemsList shadow mb-5 bg-white rounded">

								<c:choose>
									<c:when test="${empty editProducts}">
                        			?????????????????????????????????....<a
											href="<c:url value='/products/add'/>">????????????</a>
										<br>
									</c:when>
									<c:otherwise>
										<div class="table">
											<div class="thead">
												<div class="tr ">
													<!-- ---------------checkBox------------- -->
													<div class="th checkBox">
														<input type="checkbox" id="selectAll"> 
														<label for="selectAll"></label><br>
													</div>
													<!-- ----------------checkBox------------ -->
													<div class="th pic">??????</div>
													<div class="th name">????????????</div>
													<div class="th price">??????</div>
													<div class="th count">??????</div>
													<div class="th upDate">??????</div>
													<div class="th edit">??????</div>
													<div class="th delete">??????</div>
												</div>
											</div>
											<div class="tbody">

												<c:forEach var='product' items='${editProducts}'>
													<c:if test="${product.product_status == 0}">
														<div class="tr">
															<!---------------------------------------checkBox------------------------------- -->
															<div class="td checkBox">
																<input type="checkbox" id="product_id${product.product_id}" name="product_id"
																	value="${product.product_id}"> <label for="product_id"></label>
															</div>
															<!---------------------------------------checkBox------------------------------- -->
															<div class="td pic">
																<img
																	src="<c:url value='/getProductPictureA/${product.product_id}'/>">
															</div>
															<div class="td name">
																<a
																	href="<c:url value='/productUpdate/${product.product_id}'/>">${product.product_name}</a>
																<div>
																	<span>${product.product_spec}</span>
																</div>
															</div>
															<div class="td price">
																<span>NT$ ${product.product_price }</span>
															</div>
															<div class="td count">
																<span>${product.product_stock }</span>
															</div>
															<div class="td upDate">
																<span>${product.product_id }</span>
															</div>
															<div class="td edit">
																<a
																	href="<c:url value='/productUpdate/${product.product_id}'/>"><i
																	class="fas fa-pen"></i></a>
															</div>
															<div class="td delete">

																<a class="deleteLink"
																	href="<c:url value='/productDelete/${product.product_id}'/>"><i
																	class="fas fa-trash"></i></a>
															</div>
														</div>
													</c:if>
												</c:forEach>

											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>


						<div class="tabs_panel noSale">
							<div class="itemsList shadow mb-5 bg-white rounded">
								<div class="table ">
									<div class="thead">
										<div class="tr">
											<!-- ---------------checkBox------------- -->
											<div class="th checkBox">
												<input type="checkbox" id="noSaleSelectAll"> <label
													for="noSaleSelectAll"></label><br>
											</div>
											<!-- ----------------checkBox------------ -->
											<div class="th pic">??????</div>
											<div class="th name">????????????</div>
											<div class="th price">??????</div>
											<div class="th count">??????</div>
<!-- 											<div class="th upDate">????????????</div> -->
											<div class="th edit">??????</div>
											<div class="th delete">??????</div>
										</div>
									</div>
									<div class="tbody">
									
										<c:forEach var='product' items='${editProducts}'>
											<c:if test="${product.product_status == 2}">
												<div class="tr">
													<!---------------------------------------checkBox------------------------------- -->
													<div class="td checkBox">
														<input type="checkbox"
															id="product_id${product.product_id}" name="product_id"
															value="${product.product_id}"> <label
															for="product_id"></label>
													</div>
													<!---------------------------------------checkBox------------------------------- -->
												
													<div class="td pic">
														<img src="<c:url value='/getProductPictureA/${product.product_id}'/>">
													</div>
													<div class="td name">
														<a  style="color:gray; href="<c:url value='/productUpdate/${product.product_id}'/>">${product.product_name}</a>
														<div>
															<span>${product.product_spec}</span>
														</div>
													</div>
													<div class="td price">
														<span>NT$ ${product.product_price }</span>
													</div>
													<div class="td count">
														<span>${product.product_stock }</span>
													</div>
<!-- 													<div class="td upDate"> -->
<!-- 														<span>2021-02-28</span> -->
<!-- 													</div> -->
													<div class="td edit">
														<a href="<c:url value='/productUpdate/${product.product_id}'/>"><i class="fas fa-pen"></i></a>
													</div>
													<div class="td delete">
														<a href="<c:url value='/productDelete/${product.product_id}'/>"><i class="fas fa-trash"></i></a>
													</div>
												</div>
											</c:if>
										</c:forEach>

									</div>
								</div>
							</div>
						</div>




						<div class="tabs_panel noStock">
							<div class="title">
								<span>????????????????????????! ???????????????????????????<i class="fas fa-arrow-down"></i><i class="fas fa-arrow-down"></i><i class="fas fa-arrow-down"></i></span>
							</div>
							<div class="itemsList shadow mb-5 bg-white rounded">

								<div class="table">
									<div class="thead">
										<div class="tr">

											<div class="th pic">??????</div>
											<div class="th name">????????????</div>
											<div class="th price">??????</div>
											<div class="th count">??????</div>
<!-- 											<div class="th upDate">????????????</div> -->
											<div class="th edit">??????</div>
											<div class="th delete">??????</div>
										</div>
									</div>
									<div class="tbody">
									
										<c:forEach var='product' items='${editProducts}'>
											<c:if test="${product.product_stock == 0}">
												<div class="tr">
													<div class="td pic">
														<img src="<c:url value='/getProductPictureA/${product.product_id}'/>">
													</div>
													<div class="td name">
														<a  style="color:gray; href="<c:url value='/productUpdate/${product.product_id}'/>">${product.product_name}</a>
														<div>
															<span>${product.product_spec}</span>
														</div>
													</div>
													<div class="td price">
														<span>NT$ ${product.product_price }</span>
													</div>
													<div  class="td count">
														<span style="color: red;">${product.product_stock }</span>
													</div>
<!-- 													<div class="td upDate"> -->
<!-- 														<span>2021-02-28</span> -->
<!-- 													</div> -->
													<div class="td edit">
														<a href="<c:url value='/productUpdate/${product.product_id}'/>"><i class="fas fa-pen"></i></a>
													</div>
													<div class="td delete">
														<a href="<c:url value='/productDelete/${product.product_id}'/>"><i class="fas fa-trash"></i></a>
													</div>
												</div>
											</c:if>
										</c:forEach>

									</div>
								</div>
							</div>



						</div>

					</div>
				</div>
			</main>
			<!-- -------------------------????????????????????????-------------------------------------- -->

		</div>
	</div>
	<!-- -------------------------------?????????????????????---------------------------------------- -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
	<!-- -------------------------------?????????????????????----------------------------------------- -->
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
	<script>
	//???????????????????????????????????????????????????????????????????????????
  	$('#upProduct').css('display','none');
  	$('#downProduct').css('display','inline-block');
    $(function () {
	    $('#tab_nav a').click(function(){ 
	        // ?????????tabs-nav?????????a???  ?????????(this)???a???????????????.tab_selected???  
	        // ??????????????? siblings() remove .change???
	        $(this).addClass('tab_selected').siblings().removeClass('tab_selected');
	        
	        $('#upProduct').css('display','none');//????????????
	        $('#downProduct').css('display','inline-block'); //????????????
	        
// 	        console.log( $('#tab_nav a:nth-child(2)').hasClass('tab_selected'));
	        //???????????????????????????
	        if($('#tab_nav a:nth-child(2)').hasClass('tab_selected')){
	        	$('#upProduct').css('display','inline-block'); //????????????
	        	$('#downProduct').css('display','none'); //????????????
	        }
	        
	        
	        // ??????????????? ???????????? a ?????????????????????
	        let index = $(this).index();     //  index???0??????
	        // console.log(index);
	
	        // ???????????????????????????  .tabs-content ????????????.tabs-panel[index] ????????????  
	        // ?????? ????????? ????????? siblings() ??? .tabs_panel ??????
	        // ?????? panel ??? index ????????? #tab_nav a ??? index
	        $('.tabs_content .tabs_panel').eq(index)  
	        .addClass('show_panel animated_tabs').show().siblings().hide();
	
	    });
		
	    
	    
	    
	});
    $('.deleteLink').click(function() {
			Swal.fire({
	    		  title: '????????????????????????????',
	    		  text: "?????????????????????!",
	    		  icon: 'warning',
	    		  showCancelButton: true,
	    		  confirmButtonColor: '#3085d6',
	    		  cancelButtonColor: '#d33',
	    		  confirmButtonText: '???????????????!'
	    		}).then((result) => {
	    		  if (result.isConfirmed) {
	    			let href = $(this).attr('href');
//           	$('form').attr('action', href).submit();  //??????delete???????????????
						axios.get(href).then(() => {
							window.location.reload();
						}).then(() => {
							Swal.fire(
		                   		      'Deleted!',
		                   		      'Your file has been deleted.',
		                   		      'success'
			                    	)
						})
          	   	window.location = href;  //??????get??????????????????????????????
          	  	
	    		  }
	    		})
    	return false;
    });
  //??????????????????????????????(jquery ??????????????????????????????$(this)?????????window)

  //checkbox 
  $('#selectAll').click(function(){
	if($(this).is(":checked")) {
		$(":checkbox").prop("checked", true);//??????????????????
		let checkPid = new Array();	
		$('input:checkbox:checked[name="product_id"]').each(function(i) {
			 checkPid[i] = this.value; 
			//  console.log(checkPid[i]);
		})
		// console.log($('input:checkbox:checked[name="product_id"]').each(function(i) { checkPid[i] = this.value; }));
	} else {
		$(":checkbox").prop("checked", false);
	}
  });
  
  //??????????????????checkbox
	$('#noSaleSelectAll').click(function(){
		if($(this).is(":checked")) {
			$(":checkbox").prop("checked", true);//??????????????????
			let checkPid = new Array();	
			$('input:checkbox:checked[name="product_id"]').each(function(i) {
				 checkPid[i] = this.value; 
				//  console.log(checkPid[i]);
			})
			// console.log($('input:checkbox:checked[name="product_id"]').each(function(i) { checkPid[i] = this.value; }));
		} else {
			$(":checkbox").prop("checked", false);
		}
	  });
  
  
  function selectedCheck(){
	checkedNum = $("input[name='product_id']:checked").length;
	//???????????????????????????
	if (checkedNum == 0) {
		alert("?????????????????????");
		return false;
    }
	let checkList = new Array();	
	$('input[name="product_id"]:checked').each(function() {
		checkList.push($(this).val()); //??????id?????????
	})
	checkId = checkList.join("+");  //??????"+"????????????????????????(??????????????????????????????)
	console.log(checkId);
  }


  //????????????
  $('#deleteProduct').on("click",function(){
		selectedCheck();
		if(checkedNum != 0){
			let yes = confirm("???????????????????????????")
			if(yes){
				let href = "<c:url value='/productManage/" + checkId + "/del'/>";
				$('#deleteProduct').attr('href', href).submit();
			}
		}
  });

  //????????????
  	$('#downProduct').on("click",function(){
		selectedCheck();
		if(checkedNum != 0){
			let yes = confirm("???????????????????????????")
			if(yes){
			let href = "<c:url value='/productManage/" + checkId + "/down'/>";
			$('#downProduct').attr('href', href).submit();
			}
		}
	})
	  
  //????????????
  	$('#upProduct').on("click",function(){
  		selectedCheck();
  		if(checkedNum != 0){
	  		let yes = confirm("???????????????????????????")
	  		if(yes){
				let href = "<c:url value='/productManage/" + checkId + "/up'/>";
				$('#upProduct').attr('href', href).submit();
			}
  		}
  	})
  	


  	
  	
  		

  	
</script>
<script>
  AOS.init();
</script>
</body>
</html>
