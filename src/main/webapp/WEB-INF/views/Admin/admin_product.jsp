<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/Admin/admin_product.css">
<link rel="stylesheet" href="/css/pagenav.css">
    <div class="content-wrap">
    
        <p class="admin-title">상품관리</p>
        <div class="btn-wrap">
            <div class="customer-search">
        <form action="/admin_product_search" method="get">
                <input name="keyword" type="text" class="searchbar">
                <input type="submit" class="searchbutton" value="검색">
        </form>
            </div>
        </div>
		
            <form action="/admin_product_delete" method="get" id="product_delete_form">
        <table>
            <thead>
                <tr>
                    <th>&ensp;</th>
                    <th>No</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="list" items="${list}">
                <tr>
                    <td><input type="checkbox" name="product_idx" value="${ list.product_idx }"></td>
                    <td onclick="location.href='/admin_product_update?product_idx=${ list.product_idx }';">${ list.product_idx }</td>
                    <td onclick="location.href='/admin_product_update?product_idx=${ list.product_idx }';">
                        <div class="admin-product-img">
                            <span><img src="../upload/${ list.product_image }" alt=""></span>
                            <span>${ list.product_name }</span>
                        </div>
                    </td>
                    <td onclick="location.href='/admin_product_update?product_idx=${ list.product_idx }';">${ list.product_price }</td>
                    <td onclick="location.href='/admin_product_update?product_idx=${ list.product_idx }';"><fmt:formatDate value="${ list.product_date }" pattern = "yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>
            </tbody>
		
        </table>
        <div class="container-fluid">
		<div class="row">
		  <ul class="pagination">
		   
		    <li class="<c:if test="${ page == 1 } ">disabled</c:if>">
		    	<a href="/admin_product?page=${page-1}">&#60;</a>
		    </li>
		   
		    <li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_product?page=1">1</a>
		    </li>
		    <li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_product?page=2">2</a>
		    </li>
		    <li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_product?page=3">3</a>
		    </li>
		    <li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_product?page=4">4</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_product?page=5">5</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="" href="/admin_product?page=${page+1}">&gt;</a>
		    </li>
		  </ul>
		</div>
	</div>
			</form>
    </div><!--content-wrap-->
    

    