<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/Order/order_detail.css">

    <div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 주문 상세정보
        </div>
    </div>


    <div class="orderDetailwrap">
        <div class="orderDetail1">
            주문 상세정보
        </div>
		
        <div>
			
            <div class="orderDetail2">
                <div class="orderDetail2-1">주문일자 <fmt:formatDate value="${ orderdetail[0].order_date }" pattern="yyyy-MM-dd" /> </div>
                <div class="orderDetail2-2">주문번호 ${ orderdetail[0].order_idx }</div>
            </div>
            <c:set var="total" value="0" />
            <c:set var="sum" value="0" />
            <c:forEach var="list" items="${orderdetail}">
            <div class="orderDetail3">
                <div class="orderDetail3-1"><img src="../upload/${list.product_image}" alt="" width="130px" height="130px"></div>
                <div class="orderDetail3-2">${list.product_name}</div>
                <div class="orderDetail3-3">
                    <div class="orderDetail3-3-1">
                    <c:choose>
                    <c:when test="${list.order_status eq 0 }">배송준비</c:when>
                    <c:when test="${list.order_status eq 1 }">배송중</c:when>
                    <c:when test="${list.order_status eq 2 }">배송완료</c:when>
                    <c:otherwise>고객센터에 문의 요</c:otherwise>
                    </c:choose>
                    </div>
                    <div class="orderDetail3-3-2"><span class="orderDetail3-3-2-sp1"> <c:set var="sum" value="${sum+(list.product_price*list.order_quantity) }"/><fmt:formatNumber value="${sum}" pattern="0,000"/><c:set var="total" value="${total+sum }" /></span>원</div>
                    <div class="orderDetail3-3-3">수량 ${list.order_quantity}개</div>
                </div>                
                <div class="orderDetail3-4">
                    <input class="orderDetail3-4-button btn1" type="button" value="배송조회">
                    <a href="review?prodcut_idx=${list.order_pd_idx}"><input class="orderDetail3-4-button btn2" type="button" value="리뷰쓰기"></a>
                    <input class="orderDetail3-4-button btn3" type="button" value="주문취소">
                </div>
            </div>
            <c:set var="sum" value="0" />
            </c:forEach>
            <div class="orderDetail4">주문/결제 정보</div>

            <div class="orderDetail5">
                <div class="orderDetail5-1">총 상품금액</div>
                <div class="orderDetail5-2"><span class="orderDetail5-2-sp1"><c:set var="total" value="${total}"/><fmt:formatNumber value="${total}" pattern="###,###,###"/></span><span class="orderDetail5-2-sp2">원</span></div>
            </div>

            
            <div class="orderDetail6">배송지 정보</div>

            <div class="orderDetail7">
                <div class="orderDetail7-1">
                    <div class="orderDetail7-1-1">수령인</div>
                    <div class="orderDetail7-1-2">연락처</div>
                    <div class="orderDetail7-1-3">배송지</div>
                </div>
                <div class="orderDetail7-2">
            
                    <div class="orderDetail7-2-1">${ orderdetail[0].order_user_name }</div>
                    <div class="orderDetail7-2-2">${ orderdetail[0].order_user_phone }</div>
                    <div class="orderDetail7-2-3">${ orderdetail[0].order_user_address }</div>
                
                </div>
            </div>
        </div>
    </div>