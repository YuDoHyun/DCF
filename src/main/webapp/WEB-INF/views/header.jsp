<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/font.css">
<div id="headerwrap">
<div id="top">
    <ul>
        
        <li>
        
        <% session = request.getSession(); %>
        <% if( session.getAttribute("user_id") != null){ %>
            <p style="color: blue;"><%= session.getAttribute("user_name")  %>님</p>
       	<% } else { %>
       		<a href="login">로그인</a>
       	<% } %>
       	
        </li>
        <li>
        	<% if( session.getAttribute("user_id") != null){ %>
            	<a href="logout">로그아웃</a>
       		<% } else { %>
       			<a href="join">회원가입</a>
       		<% } %>
        </li>
        <li id="ds_none">
        <% if( session.getAttribute("user_id") != null){ %>
            <img src="/img/icons/main-header-maypage.png" class="header-icon">
            <img src="/img/icons/mypagearrow.png" class="triangle ds-none" alt="">
        <% } else { %>
        <a href="login"><img src="/img/icons/main-header-maypage.png" class="header-icon" onclick="login()"></a>
        <a href="login"><img src="/img/icons/mypagearrow.png" class="triangle ds-none" alt="" onclick="login()"></a>
        <script>
        function login() {
        alert("로그인후 이용해주세요");
        }
        </script>
        <% } %>
            <div class="mypage-submenu ds-none">
                <ul>
                    <li><a href="order_list">주문목록</a></li>
                    <li><a href="one2one_list">1:1문의</a></li>
                    <li><a href="info_change">회원정보변경</a></li>
                    <% if(session.getAttribute("user_id") != null) {
						if( session.getAttribute("user_id").equals("admin") ){ %>
	                    <li><a href="admin_user">관리자페이지</a></li>
		       		<% } else { %>
	                    <li><a href="mypage">마이페이지</a></li>
	                <% } } %>
                </ul>
            </div>
        </li>
        <li>
        <% if( session.getAttribute("user_id") != null){ %>
            <a href="cart"><img src="/img/icons/main-header-basket.png" class="header-icon"></a>
        <% } else { %>
        <a href="login"><img src="/img/icons/main-header-basket.png" class="header-icon" onclick="login()"></a>
        <script>
        function login() {
        alert("로그인후 이용해주세요");
        }
        </script>
        <% } %>
        </li>
    </ul>
</div>
<div id="header">
    <h1><img src="/img/logo.png" style="cursor: pointer;" alt="멍냥남매" onclick="location.href='index';"></h1>
    <form action="product_search" id="product_search">
    <p><input type="text" name="keyword"><img src="/img/icons/searchicon.png" alt="검색하기" onclick="document.getElementById('product_search').submit()"></p>
    </form>
</div>
<div id="menu">
    <ul>
        <li>
            <h1><a href="product_dog" class="linkhover">반려견</a></h1>
        </li>
        <li>
            <h1><a href="product_cat" class="linkhover">반려묘</a></h1>
        </li>
        <li>
            <h1><a href="product_new" class="linkhover">신상품</a></h1>
        </li>
        <li>
            <h1><a href="product_best" class="linkhover">베스트</a></h1>
        </li>
        <li>
            <h1><a href="sample" class="linkhover">샘플신청</a></h1>
        </li>
        <li>
            <h1><a href="notice" class="linkhover">고객센터</a></h1>
        </li>
    </ul>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $("#ds_none").click(function () {
        var triangle = document.getElementsByClassName("triangle");
        var submenu = document.getElementsByClassName("mypage-submenu");

        if(triangle[0].classList.contains("ds-none") && submenu[0].classList.contains("ds-none")){
            triangle[0].classList.remove("ds-none");
            submenu[0].classList.remove("ds-none");
        }else{
            triangle[0].classList.add("ds-none");
            submenu[0].classList.add("ds-none");
        }
    });
</script>
