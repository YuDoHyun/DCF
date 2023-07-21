<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/product/product.css">
  <link rel="stylesheet" href="/css/pagenav.css">
<div id="product-wrap">
    <div id="page-nav-wrap">
        <div id="page-nav">
            <p>HOME > 전체상품</p>
        </div> 
    </div>
    <div id="product-top">
        <img src="/img/product-img/dogfeedmainimg.jpg" alt="전체상품 배너">
    </div>
    <div id="product-main">
        <div id="product-aside">
            <div id="type-button">
                <div class="type-button">
                    <img src="/img/icons/productlist_dog.png" style="margin-top: 5.5px; " class="button" alt="0" id="dog_0">
                    <img src="/img/icons/productlist_dog_over.png" style="margin-top: 5.5px;" class="button" alt="1" id="dog_1">
                    <p>반려견</p>
                    <input type="hidden" name="animal" value="0" id="dog" class="animal_value" disabled>
                </div>
                <div class="type-button">
                    <img src="/img/icons/productlist_cat.png" style="margin-top: 6.5px; width:83px; height: 86px;" class="button" alt="2" id="cat_0">
                    <img src="/img/icons/productlist_cat_over.png" style="margin-top: 5.5px; width:83px; height: 86px;" class="button" alt="3" id="cat_1">
                    <p>반려묘</p>
                    <input type="hidden" name="animal" value="0" id="cat" class="animal_value" disabled>
                </div>
            </div>
            <p class="age-wrap">
            <div id="ageoutput">
                <span class="age">age</span>
                <span class="age" id="output_age">모든연령</span>
           	</div>
                <input type="range" id="agebar" min="0" max="40" step="1" value="0" oninput="agebar(this);">
            <div id="feed-type">
                <p>type</p>
                <label for="test"><input type="checkbox" name="type" value="0" id="type_0">건식</label>
                <label for="test"><input type="checkbox" name="type" value="1" id="type_1">습식</label>
            </div>
            <div id="pet-size">
                <p id="pet-size-title">Size</p>
                <table id="size-table">
                    <tr>
                        <td>
                            <input type="checkbox" name="size" value="0" id="size_0">
                        </td>
                        <td>
                            <p>초소형</p>
                        </td>
                        <td style="text-align: right;">
                            <p>4Kg미만</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="size" value="1" id="size_1">
                        </td>
                        <td>
                            <p>소형</p>
                        </td>
                        <td style="text-align: right;">
                            <p>4Kg ~ 10Kg미만</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="size" value="2" id="size_2">
                        </td>
                        <td>
                            <p>중형</p>
                        </td>
                        <td style="text-align: right;">
                            <p>11Kg ~ 25Kg미만</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="size" value="3" id="size_3">
                        </td>
                        <td>
                            <p>대형</p>
                        </td>
                        <td style="text-align: right;">
                            <p>26Kg ~ 44Kg미만</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="size" value="4" id="size_4">
                        </td>
                        <td>
                            <p>초대형</p>
                        </td>
                        <td style="text-align: right;">
                            <p>45Kg이상</p>
                        </td>
                    </tr>
                </table>
                <div id="filter-search">
                    <input type="button" id="search-button" value="검색하기" id="size_5">
                </div>
            </div>
        </div>
        <div id="product-session" >
            <div id="product-session-menu">
                <input type="button" class="type-feed-btn bgcolor-yello" id="left-button" value="모든상품">
                <input type="button" class="type-feed-btn" id="center-button" value="사료">
                <input type="button" class="type-feed-btn" id="right-button" value="간식">
            </div>
            <div id="productpage-product">
                <div id="product-product">
            <table class="table all" style="width: 710px;">
                 <c:forEach var="all" items="${ all }">
                <tr style="width: 33.3%; float: left;" onclick="location.href='product_action?product_idx=${ all.product_idx }'">
                	<td>
                        <div class="sample-product">
                            <img src="../upload/${ all.product_image }" class="product" alt="사료8">
                        </div>
                        <p class="product-name">${ all.product_name }</p>
                        <p class="price">${ all.product_price }</p>
                     </td>
                </tr>
					</c:forEach>
            </table>
           <table class="table food ds-none" style="width: 710px;">
                 <c:forEach var="food" items="${ food }">
                <tr style="width: 33%; float: left;" onclick="location.href='product_action?product_idx=${ food.product_idx }'">
                	<td>
                        <div class="sample-product">
                            <img src="../upload/${ food.product_image }" class="product" alt="사료8">
                        </div>
                        <p class="product-name">${ food.product_name }</p>
                        <p class="price">${ food.product_price }</p>
                     </td>
                </tr>
					</c:forEach>
            </table>
             <table class="table snack ds-none" style="width: 710px;">
                	<c:forEach var="snack" items="${ snack }">
                <tr style="width: 33%; float: left;" onclick="location.href='product_action?product_idx=${ snack.product_idx }'">
                	<td>
                        <div class="sample-product">
                            <img src="../upload/${ snack.product_image }" class="product" alt="사료8">
                        </div>
                        <p class="product-name">${ snack.product_name }</p>
                        <p class="price">${ snack.product_price }</p>
                     </td>
                </tr>
					</c:forEach>
                    </table>
                       <div id="pagenav">
    <div class="container-fluid">
		<div class="row">
		  <ul class="pagination">
		   
		    <li class="<c:if test="${ page == 1 } ">disabled</c:if>">
		    	<a href="/${ pagenav }?page=${page-1}">&#60;</a>
		    </li>
		   
		    <li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
		    	<a class="" href="/${ pagenav }?page=1">1</a>
		    </li>
		    <li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
		    	<a class="" href="/${ pagenav }?page=2">2</a>
		    </li>
		    <li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
		    	<a class="" href="/${ pagenav }?page=3">3</a>
		    </li>
		    <li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
		    	<a class="" href="/${ pagenav }?page=4">4</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
		    	<a class="" href="/${ pagenav }?page=5">5</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="" href="/${ pagenav }?page=${page+1}">&gt;</a>
		    </li>
		  </ul>
		</div>
	</div>
	</div><!--content-wrap-->
                </div>
            </div>
        </div>
        
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var dog = $("#dog")[0].value;
		var cat = $("#cat")[0].value;
		$("#dog_0").click(function() {
				$("#dog").attr("disabled", false);
				$("#cat").attr("disabled", true);
				dog = 1;
				cat = 0;
		})
		$("#dog_1").click(function() {
				$("#dog").attr("disabled", true);
				dog = 0;
		})
		$("#cat_0").click(function() {
			$("#cat").attr("disabled", false);
			$("#dog").attr("disabled", true);
				cat = 1;
				dog = 0;
		})
		$("#cat_1").click(function() {
			$("#cat").attr("disabled", true);
				cat = 0;
		})
		$("#search-button").click(function() {
			var age = $("#agebar")[0].value;
			var type_0_chk = $('input:checkbox[id="type_0"]').is(":checked");
			var type_1_chk = $('input:checkbox[id="type_1"]').is(":checked");
			var size_0_chk = $('input:checkbox[id="size_0"]').is(":checked");
			var size_1_chk = $('input:checkbox[id="size_1"]').is(":checked");
			var size_2_chk = $('input:checkbox[id="size_2"]').is(":checked");
			var size_3_chk = $('input:checkbox[id="size_3"]').is(":checked");
			var size_4_chk = $('input:checkbox[id="size_4"]').is(":checked");
			if(dog == 0 && cat == 0){
				if(type_0_chk == false && type_1_chk == false || type_0_chk == true && type_1_chk == true ){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=4";
					}
				}else if(type_0_chk == true && type_1_chk == false){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=0&product_size=4";
					}
				}else if(type_1_chk == true && type_0_chk == false){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_animal=1&product_age="+age+"&product_type=1&product_size=4";
					}
				}
			}
			
			//--------------------------------------------------------------------------------------
			
			if(dog == 1){
				if(type_0_chk == false && type_1_chk == false || type_0_chk == true && type_1_chk == true ){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_type=1&product_size=4";
					}
				}else if(type_0_chk == true && type_1_chk == false){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=0&product_size=4";
					}
				}else if(type_1_chk == true && type_0_chk == false){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=0&product_age="+age+"&product_type=1&product_size=4";
					}
				}
			}
			
			// -----------------------------------------------------------------------------------------------------
			
			if(cat ==1){
				if(type_0_chk == false && type_1_chk == false || type_0_chk == true && type_1_chk == true ){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_type=1&product_size=4";
					}
				}else if(type_0_chk == true && type_1_chk == false){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=0&product_size=4";
					}
				}else if(type_1_chk == true && type_0_chk == false){
					if(size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1";
					}else if(size_0_chk == true && size_2_chk == true && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=2";
					}else if(size_0_chk == true && size_3_chk == true && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=3";
					}else if(size_0_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2";
					}else if(size_0_chk == true && size_1_chk == true && size_3_chk == true && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_4_chk == true && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=4";
					}else if(size_0_chk == true && size_2_chk == true && size_3_chk == true && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_2_chk == true && size_4_chk == true && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_3_chk == true && size_4_chk == true && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=3&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_4_chk == true && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=4";
					}else if(size_0_chk == true && size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=0&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1";
					}else if(size_1_chk == true && size_2_chk == true && size_0_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2";
					}else if(size_1_chk == true && size_3_chk == true && size_0_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=3";
					}else if(size_1_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_0_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=3";
					}else if(size_1_chk == true && size_2_chk == true && size_4_chk == true && size_0_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=4";
					}else if(size_1_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=3&product_size=4";
					}else if(size_1_chk == true && size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=1&product_size=2&product_size=3&product_size=4";
					}else if(size_2_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=2";
					}else if(size_2_chk == true && size_3_chk == true && size_0_chk == false && size_1_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=2&product_size=3";
					}else if(size_2_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=2&product_size=4";
					}else if(size_2_chk == true && size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=2&product_size=3&product_size=4";
					}else if(size_3_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_4_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=3";
					}else if(size_3_chk == true && size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=3&product_size=4";
					}else if(size_4_chk == true && size_0_chk == false && size_1_chk == false && size_2_chk == false && size_3_chk == false){
						location.href="product_condition?product_animal=1&product_age="+age+"&product_type=1&product_size=4";
					}
				}
			}
		})
		
		$(".button").click(function() {
            var type_button = $(this).attr("alt");
            var all_button = document.getElementsByClassName("button");
            var button = document.getElementsByClassName("button")[type_button];
            if(button.classList.contains("display_none") == false){
                for( var i = 0 ; i<all_button.length;i++){
                    all_button[i].classList.remove("display_none");
                }
                button.classList.add("display_none");
            }else{
                button.classList.remove("display_none");
            }
		});
        $(".type-feed-btn").click(function(){
			for(var  i = 0 ; i<$(".type-feed-btn").length;i++){
				$(".type-feed-btn")[i].classList.remove("bgcolor-yello");
			}
			if($(this).attr("id") == "left-button"){
				$("#left-button").attr("disabled", true);
				$("#center-button").attr("disabled", false);
				$("#right-button").attr("disabled", false);
				$(".table")[0].classList.remove("ds-none");
				$(".table")[1].classList.add("ds-none");
				$(".table")[2].classList.add("ds-none");
			}else if($(this).attr("id") == "center-button"){
				$("#center-button").attr("disabled", true);
				$("#right-button").attr("disabled", false);
				$("#left-button").attr("disabled", false);
				$(".table")[1].classList.remove("ds-none");
				$(".table")[0].classList.add("ds-none");
				$(".table")[2].classList.add("ds-none");
			}else if($(this).attr("id") == "right-button"){
				$("#right-button").attr("disabled", true);
				$("#center-button").attr("disabled", false);
				$("#left-button").attr("disabled", false);
				$(".table")[2].classList.remove("ds-none");
				$(".table")[1].classList.add("ds-none");
				$(".table")[0].classList.add("ds-none");
			}
			$(this)[0].classList.add("bgcolor-yello");
        })
    }); 
    var before_value = 0;
    var week = 0;
    var month = 1;
    var year = 2;
    function agebar(e){
        var value = e.value;
        var output = document.getElementById("output_age");
        
        if(value == 0){output.innerHTML = "모든연령";}
        if(value == 1){output.innerHTML = "생후 1 주";}
        if(value == 2){output.innerHTML = "생후 2 주";}
        if(value == 3){output.innerHTML = "생후 3 주";}
        if(value == 4){output.innerHTML = "생후 4 주";}
        if(value == 5){output.innerHTML = "생후 5 주";}
        if(value == 6){output.innerHTML = "생후 6 주";}
        if(value == 7){output.innerHTML = "생후 7 주";}
        if(value == 8){output.innerHTML = "생후 8 주";}
        if(value == 9){output.innerHTML = "생후 2 개월";}
        if(value == 10){output.innerHTML = "생후 3 개월";}
        if(value == 11){output.innerHTML = "생후 4 개월";}
        if(value == 12){output.innerHTML = "생후 5 개월";}
        if(value == 13){output.innerHTML = "생후 6 개월";}
        if(value == 14){output.innerHTML = "생후 7 개월";}
        if(value == 15){output.innerHTML = "생후 8 개월";}
        if(value == 16){output.innerHTML = "생후 9 개월";}
        if(value == 17){output.innerHTML = "생후 10 개월";}
        if(value == 18){output.innerHTML = "생후 11 개월";}
        if(value == 19){output.innerHTML = "생후 12 개월";}
        if(value == 20){output.innerHTML = "생후 13 개월";}
        if(value == 21){output.innerHTML = "생후 14 개월";}
        if(value == 22){output.innerHTML = "생후 15 개월";}
        if(value == 23){output.innerHTML = "생후 16 개월";}
        if(value == 24){output.innerHTML = "생후 17 개월";}
        if(value == 25){output.innerHTML = "생후 18 개월";}
        if(value == 26){output.innerHTML = "생후 19 개월";}
        if(value == 27){output.innerHTML = "생후 20 개월";}
        if(value == 28){output.innerHTML = "생후 21 개월";}
        if(value == 29){output.innerHTML = "생후 22 개월";}
        if(value == 30){output.innerHTML = "생후 23 개월";}
        if(value == 31){output.innerHTML = "생후 24 개월";}
        if(value == 32){output.innerHTML = "3세";}
        if(value == 33){output.innerHTML = "4세";}
        if(value == 34){output.innerHTML = "5세";}
        if(value == 35){output.innerHTML = "6세";}
        if(value == 36){output.innerHTML = "7세";}
        if(value == 37){output.innerHTML = "8세";}
        if(value == 38){output.innerHTML = "9세";}
        if(value == 39){output.innerHTML = "10세";}
        if(value == 40){output.innerHTML = "11세";}
    }
</script>