<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/Admin/admin_product_registration.css">
<div id="admin-product-wrap">
    <p class="title">상품수정</p>
    <div>
    <form action="/admin_product_update_form" method="post" enctype="multipart/form-data">
    <input type="hidden" name="product_idx" value="${ dto.product_idx }">
        <table id="category-table">
            <tr class="line-top line-bottom">
                <td class="item">
                    <p class="setting">상품설정</p>
                </td>
            </tr>
            <tr class="line-top line-bottom bkcolor">
                <td class="item">
                    표시설정
                </td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item" id="sell">
                    <input type="radio" name="sell" class="category-sell" value="1">판매함
                    <input type="radio" name="sell" class="category-sell" value="0">판매안함
                </td>
            </tr>
            <tr class="line-top line-bottom bkcolor">
                <td class="item">
                    상품분류 선택
                </td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item" id="animal">
                    <input type="radio" name="animal" class="category-animal" value="0">DOG (반려견)
                    <input type="radio" name="animal" class="category-animal" value="1">CAT (반려묘)
                </td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item" id="age">
                    <input type="radio" name="age" class="category-age" value="0">전연령
                    <input type="radio" name="age" class="category-age" value="1"><span id="change">키튼</span>
                    <input type="radio" name="age" class="category-age" value="2">어덜트
                    <input type="radio" name="age" class="category-age" value="3">시니어
                </td>   
            </tr>
            <tr class="line-top line-bottom">
                <td class="item" id="feed-type">
                    <input type="radio" name="feed-type" class="category-feed-type" value="0">건식
                    <input type="radio" name="feed-type" class="category-feed-type" value="1">습식
                </td>   	
            </tr>
            <tr class="line-top line-bottom">
                <td class="item" id="category-type">
                    <input type="radio" name="type" class="category-type" value="0">사료
                    <input type="radio" name="type" class="category-type" value="1">간식
                    <input type="radio" name="sample" id="sample" class="category-type" value="2">샘플신청
                </td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item">
                	<input type="radio" name="best" id="best" class="category-best-new" value="1">베스트
                	<input type="radio" name="new" id="new" class="category-best-new" value="1">신상품
                </td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item" id="size">
                    <input type="radio" name="size" class="category-size" value="0">크기무관
                    <input type="radio" name="size" class="category-size" value="1">초소형
                    <input type="radio" name="size" class="category-size" value="2">소형
                    <input type="radio" name="size" class="category-size" value="3">중형
                    <input type="radio" name="size" class="category-size" value="4">대형
                    <input type="radio" name="size" class="category-size" value="5">초대형
                </td>
            </tr>
        </table>
        <table id="product-table">
            <tr class="line-top line-bottom bkcolor">
                <td class="item"><p class="sub-title">기본정보</p></td>
                <td></td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="wd-30 item"><p>상품명</p></td>
                <td><input type="text" class="input-border" name="name" value="${dto.product_name}" style="width: 100%; height: 35px; margin-right: 10px;"></td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item wd-80"><p>이미지등록</p></td>
                <td>
                    <div id="label-box">
                        <div class="wd-80" id="image-show">
                            <img src="../upload/${ dto.product_image }" id="product-image" class="wd-80"/>
                        </div>
                        <input type="hidden" name="original_image" value="${ dto.product_image }">
                        <label class="uploadlabel" for="chooseFile">첨부</label><input type="button" class="uploadlabel" id="deletebtn" onclick="deletefile()" value="삭제">
                        <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
                    </div>
                </td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item"><p>판매가</p></td>
                <td class="KRW"><input type="text" class="input-border" name="price" value="${dto.product_price}" style="height: 35px; margin-right: 10px;"><p>KRW</p></td>
            </tr>
            <tr class="line-top line-bottom">
                <td class="item"><p>상품 상세설명</p></td>
                <td><textarea name="bo_content" id="textarea" cols="30" rows="10">${dto.product_content}</textarea></td>
            </tr>
        </table>
        <div id="btn-box">
            <input type="submit" id="btn" value="상품수정">
        </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

window.onload = function(){
	$("#animal input[value=${ dto.product_animal }]").attr('checked' , true);
	$("#age input[value=${ dto.product_age }]").attr('checked' , true);
	$("#feed-type input[value=${ dto.product_feed_type }]").attr('checked' , true);
	$("#category-type [value=${ dto.product_category_type }]").attr('checked' , true);
	if('${ dto.product_sample }' == "1"){
		$("#sample").attr('checked' , true);
	}
	if('${dto.product_best}' == "1"){
		$("#best").attr('checked' , true);
	}
	if('${dto.product_new}' == "1"){
		$("#new").attr('checked' , true);
	}
	$("#size input[value=${ dto.product_size }]").attr('checked' , true);
}


    $(function(){
        CKEDITOR.replace('bo_content', {
            filebrowserUploadUrl: ' ${ pageContext.request.contextPath }/adm/filupload.do'});
    })
    function deletefile(){
        var Image = document.getElementById("product-image");
        Image.src = "https://via.placeholder.com/80x80";
        var container = document.getElementById('image-show');
        container.prepend(newImage);
    }
    function loadFile(input) {
        var file = input.files[0];

        var newImage = document.getElementById("product-image");
        newImage.setAttribute("class", 'img');

        newImage.src = URL.createObjectURL(file);   

        newImage.style.width = "100%";
        newImage.style.height = "100%";
        newImage.style.objectFit = "contain";

        var container = document.getElementById('image-show');
        container.prepend(newImage);
    };

    $(document).ready(function() {
        var switch_ = false;
        var best_switch_ = false;
        var new_switch_ = false;
    $(".category-animal").click(function(){
        var name = $(this)[0].value;
        if(name==0){
            document.getElementById("change").innerHTML = "퍼피";
        }else if(name==1){
            document.getElementById("change").innerHTML = "키튼";
        }
    });

    $(".category-type").click(function(){
        var name = $(this)[0].value;
        if(name==0){
            $("#sample").attr('disabled', false);
        }else if(name==1){
            $("#sample").attr('disabled', true);
        }
    });

    $("#sample").click(function(){
        if(switch_ == true){
            $(this).prop("checked", false);
            switch_ = false;
        }else if(switch_ == false){
            $(this).prop("checked", true);
            switch_ = true;
        }
    });
    
    $("#best").click(function(){
        if(best_switch_ == true){
            $(this).prop("checked", false);
            best_switch_ = false;
        }else if(best_switch_ == false){
            $(this).prop("checked", true);
            best_switch_ = true;
        }
    });

    $("#new").click(function(){
        if(new_switch_ == true){
            $(this).prop("checked", false);
            new_switch_ = false;
        }else if(new_switch_ == false){
            $(this).prop("checked", true);
            new_switch_ = true;
        }
    });
});
</script>