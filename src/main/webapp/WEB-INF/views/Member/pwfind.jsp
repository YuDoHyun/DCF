<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/Member/pwfind.css"> 
<form action="pwfindAction" method="get" onsubmit="return emailCheck();">
<div id="page-nav-wrap">
    <div id="page-nav">
        <p>HOME > 비밀번호찾기</p>
    </div> 
</div>
<div id="pwfind-wrap">
    <h1 id="pwfind-title">비밀번호찾기</h1>
    <div id="pwfind-session-1">
        <p>이름</p>
        <input type="text" class="input-radius" name="user_name" placeholder="이름을 입력하세요."  required>
        <p>* 이메일 / 휴대전화 중 하나를 선택하여 입력해주세요.</p><br><br>
        <p>아이디</p>
        <input type="text" class="input-radius"  name="user_id" placeholder="아이디를 입력하세요."  required>
        <p>이메일</p>
        <input type="text" class="input-radius" id="user_email" name="user_email" placeholder="이메일을 입력하세요.">
        <p>휴대전화</p>
        <input type="text" class="input-radius" name="user_phone" placeholder="휴대전화 번호를 입력하세요.">
        <div id="pwFind">${userPw}성공하면여기출력</div>
        <input type="submit" value="확인" id="bt1">
    </div>
</div>
</form>


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
