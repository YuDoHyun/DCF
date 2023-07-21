<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/css/Mypage/cart.css">

<div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 장바구니
        </div>
    </div>

    <form method="get" name="form">
    <div class="cartwrap">
        <div>
            <span class="cartlist">장바구니</span>
        </div>

        <div>
            <div class="cartlist-top">
                <input class="checkboxdiv" type="checkbox" id="cbx_chkAll">
                <span class="product-name">상품명</span>
                <span class="product-count">수량</span>
                <span class="product-price">금액</span>
                <span class="product-order">주문</span>
            </div>

			<c:forEach var="list" items="${list}" varStatus="status">
            <div class="cartlist-content">

                <input class="checkboxdiv chk" id="chk" type="checkbox" name="chk" value="${list.basket_idx}">
                <input type="hidden" class="chk_hidden" name="chk" value="0">


                <div class="imgdiv">
                    <img src="../upload/${list.product_image}" alt="상품이미지" width="120px" height="120px">
                </div>

                <div class="productname">${list.product_name}</div>

                <div class="countdiv">
                    <input class="minusbutton" type='button' id="minus" onclick="count(this)" value='-'>
                    <div id='result' class="result">${list.basket_count}</div>
                    <input class="plusbutton" type='button' id="plus" onclick="count(this)" value='+'>
                </div>

                <div class="productprice">
                <span class="price price-num" id="price-num"><fmt:formatNumber value="${list.basket_count*list.product_price}" pattern="###,###,###"/></span>
                <input type="hidden" value="${list.product_price}">
                <span class="price">원</span>
                </div>
                <div class="buttondiv">
                    <input class="cartlist-button cartlist-button1" type="button" value="바로주문" onclick="location.href='/order_payments?basket_idx=${list.basket_idx}'">
                	<input type="hidden" name="status_idx" value="${status.count}">
                	<input type="hidden" name="basket_idx" value="${list.basket_idx}">
                    <input class="cartlist-button" name="delete" type="button" value="삭제" onclick="location.href='/cart_delete?status_idx=${status.count}'">
                </div>

            </div>
            </c:forEach>


            <div class="cartlist-delete">
                <input class="delete-button" type="submit" value="선택삭제" formaction="cart_check_delete">
            </div>

            <div class="cartlist-order">
                <span class="priceall">총 결제금액</span>
                <span id="price-all-num" class="price-all-num"><fmt:formatNumber value="0" pattern="###,###,###"/></span><span class="price-all">원</span>
            </div>

        </div>
        
        <div class="orderbuttondiv">
            <input class="order-button order-button1" type="submit" value="선택상품주문" formaction="cart_check_order">
            <input class="order-button order-button2" type="submit" value="전체상품주문" formaction="cart_order_all">
        </div>

    </div>
    </form>

    
<script type="text/javascript">
    

    $(document).ready(function() {
    	
    	$("#cbx_chkAll").click(function() {
    		var sum = $('span[id="price-all-num"]')[0];
    		var sum_text = sum.innerText.replace(/,/g, "");
    		var length = $('.price-num');
    		var price = 0;
    		var chk = $('.chk');
    		for(var i=0; i<length.length; i++){
    			var check = chk[i].checked;
    			if(check == false){
	    			price = Number(price) + Number($('.price-num')[i].innerText.replace(/,/g, ""));
    			}
    		}
    		var chkAll = $(this).is(":checked");
    		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
    		else $("input[name=chk]").prop("checked", false);
    		if(chkAll==true) {
    			$(".chk_hidden").attr("disabled", true);
    			sum.innerHTML = Number(sum_text) + Number(price);
    		}
            else if(chkAll==false) {
            	$(".chk_hidden").attr("disabled", false);
            	sum_text = sum_text.replace(/,/g, "");
	    		sum.innerHTML = 0;
            }
    		sum.innerHTML = sum.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    	});

    	$("input[name=chk]").click(function() {
    		var sum = $('span[id="price-all-num"]')[0];
    		var sum_text = sum.innerText.replace(/,/g, "");
    		var chkdiv = $(this)[0];
    		var price = chkdiv.parentNode.childNodes[11].childNodes[1].innerText.replace(/,/g, "");
    		var chk = $('input:checkbox[id="chk"]').is(":checked");
    		var chkprice = $(this).is(":checked");
    		var total = $("input[name=chk]").length;
    		var checked = $("input[name=chk]:checked").length;
    		if(total/2 != checked) $("#cbx_chkAll").prop("checked", false);
    		else $("#cbx_chkAll").prop("checked", true);
    		if(chk==true) $(".chk_hidden").attr("disabled", true);
            else if(chk==false) $(".chk_hidden").attr("disabled", false);
    		if(chkprice==true){
    			sum.innerHTML = Number(sum_text) + Number(price);
    		}
    		else if(chkprice==false) {
    			sum_text = sum_text.replace(/,/g, "");
	    		sum.innerHTML = Number(sum_text) - Number(price);
    		}
    		sum.innerHTML = sum.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    	});

    });
    
    function count(btn) {
    	var parent = btn.parentNode;
    	var product_price = parent.parentNode.childNodes[11].childNodes[3];
    	product_price_value = product_price.value;
        var price = parent.parentNode.childNodes[11].childNodes[1];
    	price_text = price.innerText.replace(/,/g, "");
        var result = parent.childNodes[3];
    	result_text = result.innerText;
        var total = document.getElementById("price-all-num");
        total_text = total.innerText.replace(/,/g, "");;
        var id = btn.getAttribute('id');
        var status = parent.parentNode.childNodes[13].childNodes[3];
        status_value = status.value;
        var chk = parent.parentNode.childNodes[1].checked;

        if(id == 'plus'){
        	 result.innerHTML = Number(result_text) + 1;
             price.innerHTML = Number(price_text) + Number(product_price_value);
             price.innerHTML = price.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
             if(chk == true){
            	 total.innerHTML = Number(total_text) + Number(product_price_value);
            	 total.innerHTML = total.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
             }
             $.ajax({
					type: "POST",
					url: "http://3.39.54.14:8090/cart_update_plus?status_value="+status_value+"&result_text="+result_text
			 })
        } else if(id == 'minus'){
             if(result.innerHTML == 1){
            	 return;
             }
        	 result.innerHTML = Number(result_text) - 1;
             price.innerHTML = Number(price_text) - Number(product_price_value);
             price.innerHTML = price.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
             if(chk == true){
            	 total.innerHTML = Number(total_text) - Number(product_price_value);
            	 total.innerHTML = total.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
             }
             $.ajax({
					type: "POST",
					url: "http://3.39.54.14:8090/cart_update_minus?status_value="+status_value+"&result_text="+result_text
			 })
        }
        	
    }
    
    
    
    <% if(request.getAttribute("msg") != null) { %>
		alert("${msg}");
	<% }else { %>
	<% } %>
</script>