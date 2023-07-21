<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <link rel="stylesheet" href="/css/Order/order_payments.css">
<div id="page-nav-wrap">
    <div id="page-nav">
        <p>HOME > 주문결제</p>
    </div> 
</div>
<div class="orderpay-wrap">
	<form action="order_action" method="get">
    <div class="order-box">
        <p class="title">주문자 정보</p>
        <div class="line-box">
            <table class="infotable">
                <tr class="border-bottom">
                    <td class="tr-1td-1"><p>이름</p></td>
                    <td class="tr-1td-2"><p>아이디</p></td>
                    <td class="tr-1td-3"><p>휴대전화</p></td>
                </tr>
                <tr>

                    <td class="tr-2td-1">${ item.user_name }</td>
                    <td class="tr-2td-2">${ item.user_id }</td>
                    <td class="tr-2td-3">0${ item.user_phone }</td>

                </tr>
            </table>
        </div>
    </div>
    <div class="order-box">
        <p class="title">배송지 정보</p>
        <div class="line-box">
            <table class="infotable">
                <tr>
                    <td class="td-title"><p class="bold">이름</p></td>
                    <td class="td-input"><input type="text" class="inputs margin-top-15px" name="name" style="width: 60%;" value="${ item.user_name }" placeholder="이름을 입력해주세요"></td>
                </tr>
                <tr>
                    <td class="td-title"><p class="bold">휴대폰 번호</p></td>
                    <td class="td-input"><input type="text" class="inputs" style="width: 60%;" name="phone" value="0${ item.user_phone }" placeholder="숫자만 입력(11자리)"></td>
                </tr>
                <tr>
                    <td class="td-title"><p class="bold">주소</p></td>
                    <td class="td-input"><input type="text" class="inputs margin-bottom-15px" name="address" value="${ item.user_address }" placeholder="주소를 입력해주세요"></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="order-box">
        <p class="title">주문상품정보</p>
        <div class="line-box">
            <table class="infotable">
                <tr>
                    <td class="tr-1td-1" style="width: 70%; text-align: center;">상품명</td>
                    <td class="tr-1td-2" style="width: 10%;">수량</td>
                    <td class="tr-1td-3" style="width: 20%;">상품금액</td>
                </tr>
                <c:forEach var="product" items="${product}">
                <tr>
                    <td>
                        <div class="product">
                            <div class="product-image">
                                <img src="../upload/${product.product_image}" id="product-img">
                            </div>
                            <input type="hidden" name="basket_idx" value="${ product.basket_idx }"/>
                            <input type="hidden" name="product_idx" value="${ product.basket_pd_idx }"/>
                            <input type="hidden" name="product_name" value="${ product.product_name }"/>
                            <input type="hidden" name="product_count" value="${ product.basket_count }"/>
                            <input type="hidden" name="product_price" value="${ product.product_price}"/>
                            <p class="product-name">${product.product_name}</p>
                        </div>
                    </td>
                    <td>${product.basket_count}</td>
                    <td>${product.basket_count*product.product_price}원</td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="bottom-button">
            <input type="submit" class="btn" value="주문결제">
            <input type="button" class="btn" value="취소" onclick="location.href='/cart'">
        </div>
    </div>
    </form>
</div>