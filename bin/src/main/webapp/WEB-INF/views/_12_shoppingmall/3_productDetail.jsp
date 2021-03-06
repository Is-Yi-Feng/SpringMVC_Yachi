<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/3_mix.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
    <script src="<c:url value='/_00_util/shoppingMallUtil/javascript/3_????????????.js'/>"></script>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
    <!-- ps: ???????????????????????? 2/10 
        1. input??????????????????javascript????????? input??????????????????
        2. ???????????????????????????
        3. ??????????????????????????????????????????
        4. ????????????'????????????'?????? (?????????????????????)
        5. ????????????????????? ????????????
        6. ??????????????????????????????????????????????????????(??????????????????????????????)
        7. ??????????????????header???????????????(??????=>??????????????????????????????)
    -->

    
    <body>

    <div id="main">
        <!-- <div class="header_image">
            <img src="images_2/?????????.jpg">
        </div>

        <div class="new_container">
            <div class="new_product">
                <h1>????????????</h1>
            </div>
        </div> -->

        <!-- ??????header ??? ?????????????????? -->
        <div style="width: 100%;height: 80px;"></div>
        
        <!-- ???????????? -->
        <div class="shoppingArea">
        
            <!-- leftSide start  ?????????????????????????????????-->
           	<jsp:include page="/WEB-INF/views/_00_util/shoppingMallUtil/jsp/shop_sort.jsp" />
            <!-- End:leftSide -->

            <!-- Start:rightSide(????????????) -->
            <main>
                <div class="right_container">
                    <div class="productBox">
                        <!-- Start ?????????????????? -->
                        <div class="productUpBox">
                            <!-- big photo start -->
                            <div class="productImage">
                            
                            <img src="<c:url value='/getPicture/${product.product_id }'/>" alt="product">
                            </div>
                            <!-- big photo end -->
                            <div class="productIntro">
                                <div class="productName">
                                    <h3>${product.product_name}</h3>
                                    <span>??????(99)</span>
                                    <h4>?????????: 87???</h4>
                                </div>
                                <div class="productPrice">
                                    <span class="perPrice">??????: NT$ ${product.product_price}</span>
                                    <span class="leftCount">????????????: ${product.product_stock }</span>
                                </div>
                                <div class="selectCountBox">
                                    <label for="selectCount">?????????</label>
                                    	<select name="count" id="selectCount" selected="1" >
                                    		<option value="1">1</option>
                                    		<option value="2">2</option>
                                    		<option value="3">3</option>
                                    		<option value="4">4</option>
                                    		<option value="5">5</option>
                                    		<option value="6">6</option>
                                    		<option value="7">7</option>
                                    		<option value="8">8</option>
                                    		<option value="9">9</option>
                                    		<option value="10">10</option>
                                    	</select>
                                </div>
                                <div class="selectSizeBox">
                                    <label for="SelectSize">?????????</label>
                                        <select name="size" id="SelectSize">
	                                        <option value="S">S</option>
	                                        <option value="M">M</option>
                                        </select>
                                </div>
                                <div class="shopBtn">
                                    <div class="cartBtn">
                                        <a href="#"><span>???????????????</span></a>
                                    </div>
                                    <div class="buyBtn">
                                    
                                        <a href="<c:url value='/carContent.html' />"><span>????????????</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>   
                        <!-- End ?????????????????? -->

                        <!-- Start ?????????????????? -->
                        <div class="productDownBox">

                            <div id="productTab">
                                <div id="tab_nav">
                                    <a href="javascript:;" class="tab_selected">????????????</a>
                                    <a href="javascript:;">????????????</a>
                                </div>
                                <div class="tabs_content">
                                    <div class="tabs_panel product_info" style="display: block;">
                                        ${product.product_info }
                                    </div>

                                    
                                    <div class="tabs_panel product_comment">
                                        <!-- ????????? -->
                                            
                                        <div class="container pb-4 mb-5 border-bottom">
                                            <div class="row" id="flexbox1">

                                                <div class="col-12">
                                                    <div>
                                                        ???????????????????????????????????????????????????<span>??????</span>??????
                                                    </div>
                                                    <div class="row py-2">
                                                        <div class="col-3">????????????????????????</div>
                                                        <div id="score" class="col-3">
                                                            <i class="far fa-thumbs-up"></i>
                                                            <i class="far fa-thumbs-up"></i>
                                                            <i class="far fa-thumbs-up"></i>
                                                            <i class="far fa-thumbs-up"></i>
                                                            <i class="far fa-thumbs-up"></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12 flexitem" id="flex-item-1">
                                                    <input type="text" class="form-control" placeholder="????????????...." aria-label="Username" aria-describedby="basic-addon1">
                                                </div>

                                                <div class="col-12 flexitem" id="flex-item-2">
                                                    <textarea class="form-control" aria-label="With textarea" placeholder="????????????..."></textarea>
                                                </div>

                                                <div class="col-12 flexitem" id="flex-item-3">
                                                    <button type="button" class="btn btn-secondary btn-sm btn-block">????????????</button>
                                                </div>

                                            </div>

                                        </div>
                                        <!-- ??????????????? -->





                                        <div class="commentBox">

                                            <div class="memberInfo">
                                                <div class="putLeft">
                                                    <div class="memberImage">
                                                        <img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
                                                    </div>
                                                    <span class="memberId">vickychen0087</span>
                                                    <span class="nickname">Vicky</span>
                                                    <div class="comment_score">
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                    </div>
                                                </div>
                                                
                                                 <!-- ????????????????????????????????????????????? -->
                                                 <div class="doMore"><i class="fas fa-ellipsis-v"></i>
                                                    <!-- ????????????css ??? jq ??? class????????? -->
                                                    <!-- <ul class="dropdownList jq-dropdown">
                                                        <li>??????</li>
                                                        <li>??????</li>
                                                    </ul> -->
                                                </div>
                                            </div>
                                    
                                            <div class="comment_content">
                                                <span>????????????!???????????????!!!!???????????????</span>
                                            </div>

                                        </div>
                                        <div class="commentBox">

                                            <div class="memberInfo">
                                                <div class="putLeft">
                                                    <div class="memberImage">
                                                        <img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
                                                    </div>
                                                    <span class="memberId">alicehung6666</span>
                                                    <span class="nickname">Alice</span>
                                                    <div class="comment_score">
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                    </div>
                                                </div>
                                                
                                                 <!-- ????????????????????????????????????????????? -->
                                                 <div class="doMore"><i class="fas fa-ellipsis-v"></i>
                                                    <!-- ????????????css ??? jq ??? class????????? -->
                                                    <!-- <ul class="dropdownList jq-dropdown">
                                                        <li>??????</li>
                                                        <li>??????</li>
                                                    </ul> -->
                                                </div>
                                            </div>
                                    
                                            <div class="comment_content">
                                                <span>???????????? ?????????</span>
                                            </div>

                                        </div>
                                        <div class="commentBox">

                                            <div class="memberInfo">
                                                <div class="putLeft">
                                                    <div class="memberImage">
                                                        <img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
                                                    </div>
                                                    <span class="memberId">bobchung9898</span>
                                                    <span class="nickname">Bob Chung</span>
                                                    <div class="comment_score">
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                        <i class="far fa-thumbs-up"></i>
                                                    </div>
                                                </div>
                                                <!-- ????????????????????????????????????????????? -->
                                                <div class="doMore"><i class="fas fa-ellipsis-v"></i>
                                                    <!-- ????????????css ??? jq ??? class????????? -->
                                                    <!-- <ul class="dropdownList jq-dropdown">
                                                        <li>??????</li>
                                                        <li>??????</li>
                                                    </ul> -->
                                                </div>
                                            </div>
                                    
                                            <div class="comment_content">
                                                <span>?????????????????? ???????????????</span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                         <!-- End ?????????????????? -->
                    </div>


                </div>
            </main>
            <!-- End:rightSide -->
            <div class="clearfix"></div>
        </div>
    </div>

</body>
</html>