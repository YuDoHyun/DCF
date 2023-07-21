<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/product/sample.css">
<link rel="stylesheet" href="/css/checkbox.css">
    <div id="page-nav-wrap">
        <div id="page-nav">
            <p>HOME > 샘플신청</p>
        </div> 
    </div>
<div id="samplepage-wrap">
    <div id="samplepage-main">
        <h4>샘플신청</h4>
        <div id="samplepage-button">
            <input type="button" name="type" class="type-button bgcolor-yello" id="left-button" value="dog">
            <input type="button" name="type" class="type-button" id="right-button" value="cat">
        </div>
        <div id="samplepage-sample">
            <table class="table dog " style="width: 1080px;">
                	<c:forEach var="dog" items="${ dog }">
                <tr style="width: 20%; float: left;" onclick="location.href='product_action?product_idx=${ dog.product_idx }'">
                	<td>
                        <div class="sample-product">
                            <img src="../upload/${ dog.product_image }" class="product" alt="사료8">
                        </div>
                        <p class="product-name">${ dog.product_name }</p>
                        <p class="price">${ dog.product_price }</p>
                     </td>
                </tr>
					</c:forEach>
            </table>
             <table class="table cat ds-none">
                	<c:forEach var="cat" items="${ cat }">
                <tr onclick="location.href='product_action?product_idx=${ cat.product_idx }'">
                	<td>
                        <div class="sample-product">
                            <img src="../upload/${ cat.product_image }" class="product" alt="사료8">
                        </div>
                        <p class="product-name">${ cat.product_name }</p>
                        <p class="price">${ cat.product_price }</p>
                     </td>
                </tr>
					</c:forEach>
            </table>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(".type-button").click(function(){
			for(var  i = 0 ; i<$(".type-button").length;i++){
				$(".type-button")[i].classList.remove("bgcolor-yello");
			}
			if($(this).attr("id") == "left-button"){
				$("#left-button").attr("disabled", true);
				$("#right-button").attr("disabled", false);
				$(".table")[0].classList.remove("ds-none");
				$(".table")[1].classList.add("ds-none");
			}else{
				$("#right-button").attr("disabled", true);
				$("#left-button").attr("disabled", false);
				$(".table")[0].classList.add("ds-none");
				$(".table")[1].classList.remove("ds-none");
			}
			$(this)[0].classList.add("bgcolor-yello");
        })
    });
</script>