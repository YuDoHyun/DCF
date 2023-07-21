<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
  <link rel="stylesheet" href="/css/main.css">
 <div id="mainwrap">
​
        <div id="main_ani" class="main">
            <div class="main_first">
                <img src="/img/maindog.jpg" width="500">
                <img src="/img/maincat.jpg" width="310"><br>
            </div>
            <div class="main_first">
                <a href="product_dog"><button class="productlist">더보기</button></a>
                <a href="product_cat"><button class="productlist">더보기</button></a>
            </div>
        </div>
        <div id="main_md" class="main">
            <div>
                <img class="mdevent" src="/img/main_mdevent_dog.jpg" width="310">
            </div>
            <div class="md_content">
                <h3>MD가 추천하는 강아지 기호성 좋은 사료</h3>
                <span>MD가 추천하는 강아지 기호성 좋은 사료<br>
                강아지 기호성 좋은 사료 어쩌고 저쩌고..</span><br><br>
                <button class="productchoose">바로가기</button>
            </div>
        </div>
        <div id="main_md" class="main">
            <div>
                <img class="mdevent" src="/img/main_mdevent_dog.jpg" width="310">
            </div>
            <div class="md_content">
                <h3>MD가 추천하는 강아지 기호성 좋은 사료</h3>
                <span>MD가 추천하는 강아지 기호성 좋은 사료<br>
                강아지 기호성 좋은 사료 어쩌고 저쩌고..</span><br><br>
                <button class="productchoose">바로가기</button>
            </div>
        </div>
    </div>
    <script>
<% if(request.getAttribute("msg") != null) { %>
	alert("${msg}");
<% }else { %>
<% } %>
</script>

