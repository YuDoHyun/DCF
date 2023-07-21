<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/product/product_new.css">
<link rel="stylesheet" href="/css/checkbox.css">
<div id="samplepage-wrap">
    <div id="page-nav-wrap">
        <div id="page-nav">
            <p>HOME > 신상품</p>
        </div> 
    </div>
    <div id="samplepage-main">
        <h4>신상품</h4>
        <div id="samplepage-button">
    <form action="product_new_cat_form" method="get">
            <input type="button" class="type-button bgcolor-yello" id="left-button" value="dog">
            <input type="submit" class="type-button" id="right-button" value="cat">
    </form>
        </div>
        <div id="samplepage-sample">
            <table id="product_new-table" style="width:1080px;">
            	<c:forEach var="list" items="${newlist}">
                <tr style="width:25%; float:left;" >
                    <td>
                        <div class="sample-product">
                            <img src="../upload/${ list.product_image }" alt="사료1">
                        </div>
                        <p class="product-name">${ list.product_name }</p>
                        <p class="price">${ list.product_price }원</p>
                    </td>                   
                </tr>
                 </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>
	

</script>