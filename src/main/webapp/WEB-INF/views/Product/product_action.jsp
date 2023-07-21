<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/product/product_action.css"> 
<div id="productActionpage-wrap">
	<form action="basket_action" method="get">
	<input type="hidden" name="product_idx" value="${ product.product_idx }">
    <div id="productActionpage-topwrap">
        <div id="productActionpage-img">
            <img src="../upload/${ product.product_image }" alt="">
        </div>
        <div id="productActionpage-productcontent">
            <div id="productActionpage-name">
                <p>${ product.product_name }</p>
            </div>
            <p id="productActionpage-price">${ product.product_price }원</p>
            <div id="countbar">
                <span>수량</span>
                <div id="countbar-in">
                    <div id="count-button">
                        <input type="button" id="minus" value="-">
                        <input type="hidden" name="count" value="1">
                        <p id="count">1</p>
                        <input type="button" id="plus" value="+">
                    </div>
                    <div id="count-price">
                        <p id="productActionpage-price2">${ product.product_price }원</p>
                        <input type="button" id="reset" value="x">
                    </div>
                </div>
            </div>
            <div>
            	<% session = request.getSession(); %>
            	<% if( session.getAttribute("user_id") != null){ %>
		            <input type="submit" id="basket" value="장바구니 담기">
		        <% } else { %>
		        	<input type="button" id="basket" value="장바구니 담기" onclick="alert('로그인후 이용해주세요'); location.href='login';">
		        <% } %>
            </div>
        </div>
    </div>
    </form>
    <div id="product-guide">
        <a href="#">상품정보</a>
        <a href="#">구매후기</a>
        <a href="#">취소/교환/반품 안내</a>
    </div>
    <div id="content-wrap">
        <div id="product-content">
        <img src="/img/product-img/unknown.jpg">
       	${ product.product_content }
        </div>
        <table id="review">
            <tr>
                <th>구매후기 <span id="blue">( ${ count } )</span> </th>
            </tr>
        <c:forEach var="list" items="${ review_list }">
            <tr>
                <td id="first-td">            
                    <div class="star-ratings">                    
                        <div class="star-ratings-fill space-x-2 text-lg" style="width: ${list.review_score}%;">
                        
                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                        </div>
                        <div class="star-ratings-base space-x-2 text-lg">
                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                        </div>
                    </div>
                </td>
                <td><img src="../upload/${ list.review_image }" style="width: 90%"></td>
                <td>
                    ${ list.review_content }
                </td>
                <td>${ list.user_name }</td>
                <td><fmt:formatDate value="${ list.review_date }" pattern = "yyyy-MM-dd"/></td>
            </tr>
		</c:forEach>
        </table>
        <table id="exchange_info">
            <tr>
                <th>반품.교환 안내</th>
            </tr>
            <tr>
                <td>      
                    배송정보      
                </td>
                <td>
                    - 배송의 경우: 실 결제금액(예치금 포함) 2만원 이상일 경우 무료 배송입니다. 무료배송 상품이 포함됐을 경우 해당 상품은 구매금액 합산에서 제외 됩니다.<br>
                    - 도서산간비 : 2만원 미만 구매 시 기본 배송료 3,000원에 추가 도선료가 부과됩니다. 2만원 이상 구매 시에는 기본 배송료가 무료이므로 추가 도선료만 부과됩니다. 도서산간비의 경우, 모나미 물류배송, 업체직배송 모두 기준 공통으로 적용합니다.
                </td>
            </tr>
            <tr>
                <td>   
                    주문취소         
                </td>
                <td>
                    - 주문 상태가 '입금대기', '결제완료'일 경우는 멍냥남매 마이페이지에서 신청하실 수 있습니다.<br>
                    - 주문 상품의 상태가 '배송준비중', '배송중', '배송완료'인 경우는 주문 취소 신청이 진행이 되지 않으며, 반품, 교환으로 진행한 뒤 제품 회수 후 환불 처리 됩니다.
                    환불 처리는 제품 회수 완료 시점으로 최대 15일 이내에 처리해 드립니다.
                </td>
            </tr>
            <tr>
                <td>
                    반품안내
                </td>
                <td>
                    반품 교환 시점은 제품 수령일로부터 7일 이내 가능하며 수령받은 상태로 제품이 선회수되어야 합니다. 상품확인 후 환불이 진행됩니다. 고객님의 단순변심으로
                    인한 반품의 경우, 결제금액(실제 결제한 금액)에서 배송비를 차감한 뒤 환불됨을 알려드립니다.
                </td>
            </tr>
        </table>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $("#plus").click(function(){
            var count = $("#count");
            var price = $("#productActionpage-price2").html();
            var result = Number(count[0].innerHTML) + 1;
            var new_price = price.split("원");
            new_price = new_price[0].replace(",", "");
            var result2 = Number(new_price) + ${ product.product_price };
            document.getElementsByName("count")[0].value = result;
            $("#productActionpage-price2")[0].innerHTML = result2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
            count[0].innerHTML = result;
            
        });
        $("#minus").click(function(){
            var count = $("#count");
            var price = $("#productActionpage-price2").html();
            var new_price = price.split("원");
            new_price = new_price[0].replace(",", "");
            
            var result = Number(count[0].innerHTML) - 1;
            var result2 = Number(new_price) - ${ product.product_price };
            
            if(result != 0){
            $("#productActionpage-price2")[0].innerHTML = result2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
                count[0].innerHTML = result;
            }else{
                return;
            }
        });
        $("#reset").click(function(){
            var count = $("#count");
            count[0].innerHTML = "1";
        });
        var price = ${ product.product_price };
        price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
        
        $("#productActionpage-price").text(price+"원");
        $("#productActionpage-price2").text(price+"원");
    }); 
</script>