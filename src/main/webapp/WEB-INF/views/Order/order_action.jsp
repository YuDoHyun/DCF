<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Order/order_action.css">

    <div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 주문완료
        </div>
    </div>

        <div id="orderActionwrap">
            <span id="confirm">주문완료!</span>
            <div id="orderinfo">
                <span id="action">주문번호 : ${ order_idx }</span>
                <span id="action2">주문일자 : ${ date }</span>
            </div>
            <img src="/img/icons/login_logo.png" width="147" height="60">
            <a href="index"><button class="orderAction-button">메인으로가기</button></a>

        </div>
