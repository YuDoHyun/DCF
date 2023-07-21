<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/css/Member/login.css">
<link rel="stylesheet" href="/css/checkbox.css">
<form action="loginAction" method="post">
<div id="page-nav-wrap">
    <div id="page-nav">
        <p>HOME > 로그인</p>
    </div> 
</div>
<div id="login-wrap">
    <h1 id="login-title"><img src="/img/icons/login_logo.png" alt="로그인로고"></h1>
    <div id="login-session-1">
        <input name="user_id" type="text" class="input-radius" placeholder="아이디를 입력하세요.">
        <input name="user_pw" type="password" class="input-radius" placeholder="비밀번호를 입력하세요.">
        <input type="checkbox" name="checkbox" id="yellowCheckbox">
        <label for="yellowCheckbox" class="yellowCheckbox"></label><span class="bold">아이디 저장</span>
        <input type="submit" value="확인" id="bt1">
    </div>
    <div id="login-bottom">
        <ul>
            <li>
                <a href="idfind">아이디찾기</a>
            </li>
            <li>
                <a href="pwfind">비밀번호찾기</a>
            </li>
            <li>
                <a href="join">회원가입</a>
            </li>
        </ul>
    </div>
</div>
</form>

<script type="text/javascript">
    <% if(request.getAttribute("msg") != null) { %>
		alert("${msg}");
	<% }else { %>
	<% } %>
</script>

