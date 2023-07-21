<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Member/join_form_2.css">

<form name="join_form_2">
        <div class="joinbox">
            <div class="joinbox1">
                <span>아이디 중복확인</span>
            </div>
            <div class="joinbox2">
                <input type="text" id="cid" name="id" value=""><input type="button" id="check" value="중복확인" onClick="search()">
            </div>
            <div id="span-div">
            <span id="span1"></span><br>
            <span id="span2"></span>
            <span id="span3" class="span3"></span>
            </div>
            <div class="joinbox3">
                <span class="span4"><input type="button" value="창닫기" onClick="window.close()" style="cursor: pointer;"></span>
            </div>
        </div>
</form>

  
   
    
    <script>
		function searchid() {
            opener.document.getElementById('pid').value = document.getElementById('cid').value;
            self.close();
        };

        function search() {
            var span1 = document.getElementById('span1');
            var span2 = document.getElementById('span2');
            var span3 = document.getElementById('span3');
            var arr = new Array();
            <c:forEach var="list" items="${list}">
            	arr.push("${ list.user_id }")
            </c:forEach>
            /* for (int i=0; i<arr.length; i++){
            	if( arr == $("#id").val) {
    	            span1.innerHTML = "<span id='span1-sp'>입력하신 아이디는 사용할수 없습니다.</span>";
    	            span2.innerHTML = "<span id='span2-sp'>다른 아이디를 입력해주세요.</span>";
                } else {
                	span1.innerHTML = "<span id='span1-sp'>입력하신 아이디는 사용가능합니다.</span>";
    	            span2.innerHTML = "<span id='span2-sp'>확인버튼을 눌러주세요.</span>";
    	            span3.innerHTML = "<input type='button' value='확인' onClick='searchid();' id='span3-input'>";
                }
            } */
            span1.innerHTML = "<span id='span1-sp'>입력하신 아이디는 사용가능합니다.</span>";
            span2.innerHTML = "<span id='span2-sp'>확인버튼을 눌러주세요.</span>";
            span3.innerHTML = "<input type='button' value='확인' onClick='searchid();' id='span3-input'>";
        };

    </script>