<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/Member/idfind.css"> 
<div id="idfind-wrap">
	<form action="idfindAction" method="get" onsubmit="return emailCheck();">
	<div id="page-nav-wrap">
	    <div id="page-nav">
	        <p>HOME > 아이디찾기</p>
	    </div> 
	</div>
	<h1 id="idfind-title">아이디찾기</h1>
		 <div id="idfind-session-1">
		    <p>이름</p>
		    <input type="text" class="input-radius" name="user_name" value="" placeholder="이름을 입력하세요." required >
		    <p>* 이메일 / 휴대전화 중 하나를 선택하여 입력해주세요.</p><br><br>
		    <p>이메일</p>
		    <input type="text" class="input-radius" id="user_email" name="user_email" value="" placeholder="이메일을 입력하세요.">
		    <p>휴대전화</p>
		    <input type="text" class="input-radius" name="user_phone" value="" placeholder="전화번호를 입력하세요.">
		   	<div id="findId">${userId}</div>
		    <input type="submit" value="확인" id="bt1">
		  </div>
	</form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function emailCheck() {   
    var email = document.getElementById("user_email").value;
    var exptext  = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    if(exptext.test(email)==false){
	   	alert("이메일 형식이 올바르지 않습니다.");
	    return false;
    } return true; }  
</script>
<script>
<% if(request.getAttribute("msg") != null) { %>
	alert("${msg}");
<% }else { %>
<% } %>
</script>
