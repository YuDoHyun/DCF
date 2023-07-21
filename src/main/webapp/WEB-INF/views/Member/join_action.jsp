<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Member/join_action.css">
    <div id="page-nav-wrap">
        <div id="page-nav">
                HOME > 회원가입
        </div>
    </div>
        
        <div class="join-step">
            <span class="step-font">STEP1.약관동의</span>
            <img src="/img/icons/arrow.png" class="step-font" width="7px" height="18px">
            <span class="step-font">STEP2.회원정보 입력</span>
            <img src="/img/icons/arrow.png" class="step-font" width="7px" height="18px">
            <span id="step-font" class="step-font">STEP3.가입완료</span>
        </div>

        <div id="joinActionwrap">
            <span id="welcome">WELCOME!</span>
            <span id="action">회원가입이 완료 되었습니다.</span>
            <img src="/img/icons/login_logo.png" width="147" height="60">
            <a href="index"><button class="joinAction-button">메인으로</button></a>
        </div>