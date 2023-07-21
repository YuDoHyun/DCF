<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/css/Admin/admin_member_detail.css">
<div class="content-wrap">
        <p class="admin-title">회원정보 조회</p>
        <div id="user-infowrap">
            <p>${usersdto.user_name}&#40;${usersdto.user_id}&#41;님</p>            
            <form action="admin_member_update_form">
            <table>            	
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="user_id" value="${usersdto.user_id}" maxlength="20" ></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="text" name="user_pw" value="${ usersdto.user_pw }" maxlength="50"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="user_email" value="${ usersdto.user_email }" maxlength="50"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="user_name" value="${ usersdto.user_name }" maxlength="10"></td>
                </tr>
                <tr>
                    <td>가입일자</td>
                    <td><input type="date" name="user_join_date" value="<fmt:formatDate value="${usersdto.user_join_date}" pattern="yyyy-MM-dd" />" disabled ></td>
                </tr>
                <tr>
                    <td>폰</td>
                    <td><input type="text" name="user_phone" value="0${ usersdto.user_phone}"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="user_address" value="${usersdto.user_address}" maxlength="50"></td>
                </tr>
                <tr>
                    <td>생일</td>
                    <td><input type="date" name="user_birth_date" value="<fmt:formatDate value="${usersdto.user_birth_date}" pattern="yyyy-MM-dd" />"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td id="gender_td"><input type="text" id="gender" name="user_gender" value="${ usersdto.user_gender }" maxlength="1">
                </tr>
            </table>
            <div>
                <input type="submit" value="정보변경">                
                <a href="adminMemberDeleteAction?user_idx=${usersdto.user_idx}"><button id="delete" type="button" value="회원삭제">회원삭제</button></a>
                <a href="admin_member"><input type="button" value="목록"></a>
            </div>
            <input type="hidden" name="user_idx" value="${usersdto.user_idx}"></input>
        </form>
        </div><!--user-infowrap-->
    </div><!--content-wrap-->
    <script>
	    function printGender()  {
	    	  var usergender = document.getElementById('gender').value;
	    	  var udergenderInndertext = document.getElementById('gender_td');
	    	  if( usergender == 0 ){
	    		  udergenderInndertext.innderText='남';
	    	  }esle{
	    		  udergenderInndertext.innderText='여';
	    	  }
	    	
	    	}
    </script>
