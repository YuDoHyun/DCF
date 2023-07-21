<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="/css/Admin/admin_order_action.css">
    
    <div class="orderActionwrap">

        <div>
            <div class="orderActiondiv oa-height oa-div1">
                <div class="oa-div1-1">주문일자:<fmt:formatDate value="${ dto.order_date }" pattern = "yyyy-MM-dd"/></div>
                <div class="oa-div1-2">주문번호:${ dto.order_idx }</div>
            </div>

            <div class="orderActiondiv oa-height oa-div5">
                배송지정보
            </div>

            <div class="orderActiondiv oa-height oa-div6">
                <div class="orderActiondiv orderActiondiv6-1">
                    <div class="oa-div6-1">주문자</div>
                    <div class="oa-div6-2"> ${ dto.user_name }</div>
                </div>
                <div class="orderActiondiv orderActiondiv6-2">
                    <div class="oa-div6-3">아이디</div>
                    <div class="oa-div6-4">${ dto.user_id }</div>
                </div>
            </div>

            <div class="orderActiondiv oa-height oa-div7">
                <div class="orderActiondiv orderActiondiv7-1">
                    <div class="oa-div7-1">휴대전화</div>
                    <div class="oa-div7-2">0${ dto.user_phone }</div>
                </div>
                <div class="orderActiondiv orderActiondiv7-2">
                    <div class="oa-div7-3">이메일</div>
                    <div class="oa-div7-4">${ dto.user_email }</div>
                </div>
            </div>

            <div class="orderActiondiv oa-height oa-div8">
                <div class="oa-div8-1">주소</div>
                <div>${ dto.user_address }</div>
            </div>

            <div class="orderActiondiv oa-height oa-div9">
                주문 상품정보
            </div>

            <div class="orderActiondiv oa-height oa-div10">
                <div class="oa-div10-1">주문번호</div>
                <div class="oa-div10-2">상품명</div>
                <div class="oa-div10-3">주문상태</div>
                <div class="oa-div10-4">수량</div>
                <div class="oa-div10-5">금액</div>
            </div>

            <c:forEach var="list" items="${ list }">
            <form action="/admin_order_status_update">
            <input type="hidden" name="order_idx" value="${ list.order_idx }">
            <div class="orderActiondiv oa-div11">
                <div class="oa-div11-1"><input type="checkbox"></div>
                <div class="oa-div11-2"><p>${ list.order_idx }</p></div>
                <div class="oa-div11-3"><img src="../upload/${ list.product_image }" alt="" width="80px" height="80px"></div>
                <div class="oa-div11-4">${ list.product_name }</div>
                <div class="oa-div11-5">
                    <select class="oa-select" name="delivery" id="delivery">
                        <option value="0">배송준비중</option>
                        <option value="1">배송중</option>
                        <option value="2">배송완료</option>
                        <option value="3">배송취소</option>
                    </select>
                    <input class="oa-select-button" type="submit" value="변경">
                </div>
                <div class="oa-div11-6">${ list.order_quantity }개</div>
                <div class="oa-div11-7">${ list.product_price }원</div>
            </div>
            </form>
            </c:forEach>
            
            <div class="orderActiondiv oa-div12">
                <div class="oa-div12-1">합계: ${ total_quantity }개</div>
                <div class="oa-div12-2">${ total_price }원</div>
            </div>
        </div>
        <div class="orderbuttondiv oa-div13">
            <input class="oa-div13-button oa-div13-1" type="button" value="목록">
            <input class="oa-div13-button oa-div13-2" type="button" value="정보수정">
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    window.onload = function(){
    	var arr = new Array();
    	var select = document.getElementsByClassName("oa-select");
    	<c:forEach var="list" items="${ list }">
    		arr.push("${list.order_status}");
    	</c:forEach>
    	for(var i = 0 ; i<select.length;i++){
    		select[i][arr[i]].setAttribute("selected", true);
    	}
    	
    }
    </script>