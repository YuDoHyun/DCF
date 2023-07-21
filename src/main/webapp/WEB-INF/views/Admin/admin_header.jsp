<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/Admin/admin_header.css">
<link rel="stylesheet" href="/css/font.css">
<div id="all-wrap">
    <div id="iconcircle">
        <img src="/img/icons/admin-icon.png" class="admin-icon" alt="">
    </div>
    <div class="square ds-none">
        <div class="user-type">
        <% session = request.getSession(); %>
        <% if( session.getAttribute("user_name") != null){ %>
            <p><%= session.getAttribute("user_name") %>님</p>
        <% } %>     	
        </div>
        <p class="user-name">
        <% session = request.getSession(); %>
        <% if( session.getAttribute("user_id") != null){ %>
            <p><%= session.getAttribute("user_id") %>님</p>
        <% } %>
        <a href="index">쇼핑몰정보</a><br>
        <a href="logout">로그아웃</a>
    </div>
<div id="aside-wrap">
    <div id="aside-main">
        <img src="/img/logo.png" id="aside-logo">
        <ul class="aside-menu">
            <li class="aside-menu-item">
                <a href="admin_user" class="bold">회원관리</a>
            </li>
            <li class="aside-menu-item">
                <a href="admin_product" class="bold">상품관리</a>
                <ul class="asidebar">
                    <li><a href="admin_product_registration">상품 등록</a></li>
                    <li><a href="admin_product">상품 목록</a></li>
                </ul>
            </li>
            <li class="aside-menu-item">
                <a href="admin_order" class="bold">주문관리</a>
                <ul class="asidebar">
                    <li><a href="admin_order_list">전체 주문 목록</a></li>
                </ul>
            </li>
            <li class="aside-menu-item">
            <a href="admin_notice" class="bold">게시판관리</a>
            <ul class="asidebar">
                <li><a href="admin_notice">공지사항</a></li>
                <li><a href="admin_faq">FAQ</a></li>
                <li><a href="admin_one2one">1:1문의</a></li>
            </ul>
            </li>
        </ul>
    </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
		$("#iconcircle").click(function() {
            var square = document.getElementsByClassName("square")[0];
            if(square.classList.contains("ds-none") == false){
                square.classList.add("ds-none");
            }else{
                square.classList.remove("ds-none");
            }
		});
    });
    
</script>