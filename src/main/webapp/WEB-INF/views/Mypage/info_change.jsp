<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Mypage/info_change.css">

<div class="wrapper">
        <div id="page-nav-wrap">
            <div id="page-nav">
                HOME > 회원정보변경
            </div>
        </div>
   
        <div id="joinwrap">
            <div id="joinform-top">
                <span>회원정보 변경</span>
            </div>
    
            <div>
                <form action="info_change_form">
                <table class="joinform-table">
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            이름
                        </td>
                        <td>
                            <input class="joinform-input" type="text" name="user_name" placeholder="자기이름" value="${dto.user_name}">
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            아이디
                        </td>
                        <td class="btndiv">
                            <input class="joinform-input2" type="text" name="user_id" placeholder="자기아이디" value="${dto.user_id}" disabled>
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            비밀번호
                        </td>
                        <td>
                            <input class="joinform-input" type="password" name="user_pw" placeholder="비밀번호 입력" value="${dto.user_pw}"><br>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="passwordinfo">
                            * 6~16자 이내, 영문 대/소문자, 특수문자 중 2가지 조합으로 사용해주세요.<br>
                            가능 특수문자 : ! @ # $ % ^ ? _ ~<br>
                            * 아이디와 동일한 비밀번호는 사용할 수 없습니다.
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            비밀번호 확인
                        </td>
                        <td>
                            <input class="joinform-input" type="password" placeholder="비밀번호 확인">
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            이메일
                        </td>
                        <td>
                            <input class="joinform-input" type="email" name="user_email" placeholder="자기이메일@naver.com" value="${dto.user_email}"><br>
                        </td>
                    </tr>
                    
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            휴대폰 번호
                        </td>
                        <td>
                            <input class="joinform-input" type="text" name="user_phone" placeholder="자기휴대폰번호 01055521000" value="0${dto.user_phone }">
                        </td>
                    </tr>
                </table>
                <table id="joinform-table">
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            생년월일
                        </td>
                        <td>
                            <input class="joinform-input" type="text" name="user_birth_date" placeholder="자기생일뜨게20000101" value="<fmt:formatDate value="${dto.user_birth_date}" pattern = "yyyy-MM-dd"/>">
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            성별
                        </td>
                        <td class="joinform-check2">
                            <input type="radio" name="user_gender" id="yellowCheckbox2" class="checkinput" value="0" checked>
                            <label for="yellowCheckbox2" class="yellowCheckbox"></label> <span class="joinform-span">여자</span>
                            <input type="radio" name="user_gender" id="yellowCheckbox3" class="checkinput" value="1">
                            <label for="yellowCheckbox3" class="yellowCheckbox"></label> <span class="joinform-span">남자</span>
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            주소
                        </td>
                        <td>
                            <input class="joinform-input" type="text" name="user_address" placeholder="자기주소 의정부 부흥로25" value="${dto.user_address}">
                        </td>
                    </tr>
                </table>
    
                <div class="joinform-buttonwrap">
                    <button type="button" class="joinform-button joinform-cancel" onClick="location.href='index'">취소</button>
                    <button type="submit" class="joinform-button joinform-confirm">확인</button>
                    <input type="hidden" name="user_idx" value="${dto.user_idx}">
                </div>
                
                </form>
            </div>
        </div>
    
   
    </div>