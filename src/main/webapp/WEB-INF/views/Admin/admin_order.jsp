<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/Admin/admin_order.css">
<div class="content-wrap">
        <p class="admin-title">전체 주문 현황</p>
        <div id="current-order-list">
            <div>
                <p class="current-order-title">배송준비</p>
                <p><img src="/img/icons/admin_orderlist_icon00.jpg" alt="">${before}</p>               
            </div>
            <div>
                <p class="current-order-title">배송중</p>
                <p><img src="/img/icons/admin_orderlist_icon01.jpg" alt="">${during}</p>               
            </div>
            <div>
                <p class="current-order-title">배송완료</p>
                <p><img src="/img/icons/admin_orderlist_icon00.jpg" alt="">${after}</p>               
            </div>
        </div>
        <p class="admin-title">취소/교환/반품 현황</p>
        <div id="cancle-change-return-list">
            <div>
                <p class="change-return-title">취소</p>
                <p>${cancel}</p>
            </div>
            <div onClick="location.href='admin_order_list'">
                <p class="change-return-title">전체주문</p>
                <p>${orderAll}</p>
            </div>
            
        </div>
    </div><!--content-wrap-->