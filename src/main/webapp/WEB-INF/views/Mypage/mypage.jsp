<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Mypage/mypage.css">
<% session = request.getSession(); %>
<div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 마이페이지
        </div>
    </div>
    <div class="mypagewrap">
        <div class="mypage-title">
            <div>
                <span class="mypage1">MY PAGE</span><br>
                <span class="mypage2">마이페이지</span>
            </div>
            <div class="mypage-status">

            	<span class="mypage2">${mypage_name[0].user_name}님</span><br> 	
                <button class="mypage-logout" onclick="location.href='logout'">LOGOUT</button>
            </div>
        </div>
        <div class="mypage-condition">
            <span>최근 주문 현황</span>
        </div>
        <div class="mypage-order-condition">
            <div class="order-condition1">
                <div class="condition-num"><span>${before}</span></div>
            </div>
            <img src="/img/icons/arrow.png" class="condition-next" width="7px" height="18px">
            <div class="order-condition2">
                <div class="condition-num"><span>${during}</span></div>
            </div>
            <img src="/img/icons/arrow.png" class="condition-next" width="7px" height="18px">
            <div class="order-condition2">
                <div class="condition-num"><span>${after}</span></div>
            </div>
        </div>
        <div class="order-condition">
            <div><span class="condition-status condition-status2">배송전</span></div>
            <div><span class="condition-status condition-status3">배송중</span></div>
            <div><span class="condition-status condition-status4">배송완료</span></div>
        </div>
        <div class="mypage-filter">
            <a href="order_list"><span>주문목록</span></a>
        </div>
        <div class="mypage-filter">
            <a href="one2one_list"><span>문의내역</span></a>
        </div>
        <div class="mypage-filter">
            <a href="cart"><span>장바구니</span></a>
        </div>
        <div class="mypage-filter mypage-filter2">
            <a href="info_change"><span>회원정보변경</span></a>
        </div>
    </div>