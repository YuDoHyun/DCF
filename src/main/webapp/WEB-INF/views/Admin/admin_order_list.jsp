<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/Admin/admin_order_list.css">
    <link rel="stylesheet" href="/css/pagenav.css">
<div class="content-wrap">
        <p class="admin-title">전체 주문 목록</p>
        <div class="btn-wrap">
            <div class="customer-search">
                <form action="order_list_search">
                <select name="search" id="search">
                    <option value="id">아이디</option>
                    <option value="name">이름</option>
                    <option value="email">이메일</option>
                    <option value="phone">휴대전화</option>
                </select>
                <input type="text" class="searchbar" name="keyword">
                <input type="submit" class="searchbutton" value="검색">
                </form>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th>주문일</th>
                    <th>주문번호</th>
                    <th>주문자</th>
                    <th>상품명</th>
                    <th>현재상태</th>
                    <th>수량</th>
                    <th>결제금액</th>
                </tr>
            </thead>
            <tbody>
        <c:forEach var="dto" items="${ list }">
	  	<tr onclick="location.href='admin_order_action?order_idx=${dto.order_idx}'">
           <td><fmt:formatDate value="${ dto.order_date }" pattern = "yyyy-MM-dd"/></td>
           <td>${ dto.order_idx }</td>
           <td>${ dto.user_name }</td>
           <td>${ dto.product_name }</td>
           <td>${ dto.order_status }</td>
           <td>${ dto.order_quantity }</td>
           <td><span>총액</span>${ dto.order_price }<span>원</span></td>
	  	</tr>
		</c:forEach>               
            </tbody>
        </table>
        <div id="pagenav">
    <div class="container-fluid">
		<div class="row">
		  <ul class="pagination">
		   
		    <li class="<c:if test="${ page == 1 } ">disabled</c:if>">
		    	<a href="/admin_order_list?page=${page-1}">&#60;</a>
		    </li>
		   
		    <li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=1">1</a>
		    </li>
		    <li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=2">2</a>
		    </li>
		    <li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=3">3</a>
		    </li>
		    <li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=4">4</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=5">5</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="" href="/admin_order_list?page=${page+1}">&gt;</a>
		    </li>
		  </ul>
		</div>
	</div>
	</div><!--content-wrap-->
    </div>