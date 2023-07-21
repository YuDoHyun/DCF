<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/Admin/admin_member.css">
<div id="user-search-wrap">
    <h2 id="user-search-title">회원정보 조회</h2>
    <a><button id="" class="btn" type="button" onclick="document.getElementById('frm').submit();" value="회원삭제">회원삭제</button></a>
	    <div class="customer-search">
	        <form action="admin_user_search">
	    	<select name="search" id="search">
	    		<option value="id">아이디</option>
	    		<option value="name">이름</option>
	    		<option value="email">이메일</option>
	    		<option value="phone">휴대전화</option>
	    	</select>
	        <input type="text" class="searchbar" name="keyword">
	        <input type="submit" class="searchbutton" value="검색">
	        </form>
	    </div>
       <form action="adminMemberDeleteAction" method="get" id="frm">
	    <table id="user-search-table">
	        <tr id="first-tr">
	            <td></td>
	            <td>등록일</td>
	            <td>아이디</td>
	            <td>이름</td>
	            <td>휴대전화</td>
	            <td>성별</td>
	            <td>이메일</td>
	            <td>생일</td>
	        </tr>

	       	<c:forEach var="dto" items="${ list }">
		  	<tr>
	           <td><input type="checkbox" name="user_idx" value="${ dto.user_idx }"></td>
	           <td><fmt:formatDate value="${ dto.user_join_date }" pattern = "yyyy-MM-dd"/></td>
	           <td><a href="admin_member_detail?user_idx=${dto.user_idx }">${ dto.user_id }</a></td>
	           <td><a href="admin_member_detail?user_idx=${dto.user_idx }">${ dto.user_name }</a></td>
	           <td>0${ dto.user_phone }</td>
	           <td>${ dto.user_gender }</td>
	           <td>${ dto.user_email }</td>
	           <td>
	          	<c:set var="dateVar" value="${ dto.user_birth_date }" />
	          	<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
	           </td>
		  	</tr>
			</c:forEach>
	    </table>
	    </form>
</div>
<script>
	<% if(request.getAttribute("msg") != null) { %>
		alert("${msg}");
	<% }else { %>
	<% } %>
</script>