<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/css/Mypage/order_list.css">

<div id="page-nav-wrap">
<div id="page-nav">
            HOME > 주문목록
</div>
</div>
    <form action="#" onsubmit="return false">
    <div class="orderlistwrap">
        <div class="orderlist">
       	 주문목록
        </div>
     
     <c:forEach var="list" items="${myOrderList}">
        <div class="orderlist2">
            <span class="orderdate">주문일자 <fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd"/></span>
            <p>
            	<span class="ordernum1">주문번호</span>
            	<span class="ordernum2">${list.order_idx}</span>
            </p>            
        </div>
		<!-- 리핏부분 orderProductVeiw-->	
		<c:set var="total" value="0" />
		<c:set var="productnum" value="0" />
		<c:set var="sum" value="0" />			
		<c:forEach var="product" items="${orderProductVeiw}">
			<c:choose>
				<c:when test="${ list.order_idx eq product.order_idx }">
					<c:set var="productnum" value="${productnum+product.order_pd_idx}" />
					<div class="order-product">
		            <div class="imgdiv">
		                <img src="../upload/${product.product_image}">
		            </div>
		            <div class="product-namediv">
		                <span class="product-name">${product.product_name}</span>
		            </div>
		            <div class="product-quantitydiv">
		                <span class="product-quantity">수량 ${product.order_quantity}개</span><br>
		               가격<span class="product-price"><c:set var="sum" value="${sum+(product.product_price*product.order_quantity) }"/><fmt:formatNumber value="${sum}" pattern="0,000"/></span>
	        			<c:set var="total" value="${ total+sum }" /><c:set var="sum"  value="0"/>
		            </div>
		            <div class="buttondiv">	            
		                <a href="order_list_detail?order_idx=${product.order_idx}"><input class="order-button" type="button" value="상세보기"></a>
		                <a href="#"><input class="order-button" type="button" value="배송조회"></a>
		                <a href="review?prodcut_idx=${productnum}"><input class="order-button" type="button" value="리뷰쓰기"></a><c:set var="productnum" value="0" />
		                <a href="#"><input class="order-button" type="button" value="주문취소"></a>
		            </div>
	        	</div> 					
				</c:when>
				<c:otherwise>			
				
				</c:otherwise>
			</c:choose>
			 
			
		</c:forEach>
        <!-- 리핏끝 -->
            <div class="price-top">
                <div class="pricediv">
                    <button class="price-all">총 상품금액</button><br>
                    총액금액<span class="all-price1"><c:set var="total" value="${ total }" /><fmt:formatNumber value="${total}" pattern="###,###,###"/></span>원
                </div>
            </div>
   
        </c:forEach>
		

  
    </div>
    </form>
    <script type="text/javascript">
    
    </script>
    